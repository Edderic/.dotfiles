// keylog.c
//
// Usage:
//   ./keylog [command ...]
//
// This runs the given command, capturing all keyboard input in the file
// "outfile." This is currently written for mac os x. I'm guessing slight edits
// would allow it to work on other *nix systems as well.
//
// I learned how to do this by looking at the source of the "script" binary,
// found here:
// http://www.opensource.apple.com/source/shell_cmds/shell_cmds-170/script/script.c
//

#include <err.h>
#include <errno.h>
#include <paths.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <termios.h>
#include <unistd.h>
#include <util.h>

void run_command(char **command) {
  if (command[0]) {
    execvp(command[0], command);
    // Execution will only reach here if execvp failed.
    err(1, "execvp (running the command)");
  }

  // Otherwise run a new shell.
  const char *shell = getenv("SHELL");
  if (shell == NULL) shell = _PATH_BSHELL;
  execl(shell, shell, "-i", NULL);
    // Execution will only reach here if execl failed.
  err(1, "execl (running a new shell)");
}

int main(int argc, char **argv) {
  struct termios tt;
  if (tcgetattr(STDIN_FILENO, &tt) == -1) err(1, "tcgetattr");
  struct winsize win;
  if (ioctl(STDIN_FILENO, TIOCGWINSZ, &win) == -1) err(1, "ioctl");
  int master, slave;
  if (openpty(&master, &slave, NULL, &tt, &win) == -1) err(1, "openpty");

  FILE *outfile = fopen("keylog_log", "w");
  if (outfile == NULL) err(1, "outfile");

  struct termios rtt = tt;
  cfmakeraw(&rtt);
  rtt.c_lflag &= ~ECHO;
  tcsetattr(STDIN_FILENO, TCSAFLUSH, &rtt);

  int child = fork();
  if (child < 0) err(1, "fork");

  if (child == 0) {
    // Set up our file environment and run the command.
    close(master);
    fclose(outfile);
    login_tty(slave);
    run_command(argv + 1);  // Doesn't return.
  }

  // We're in the parent process; capture and log the input.
  fd_set fds;
  FD_ZERO(&fds);
  char buffer[BUFSIZ];
  while (1) {
    FD_SET(master, &fds);
    FD_SET(STDIN_FILENO, &fds);
    int n = select(master + 1, &fds, 0, 0, NULL);
    if (n < 0 && errno != EINTR) break;
    if (n > 0) {
      if (FD_ISSET(STDIN_FILENO, &fds)) {
        int num_bytes = read(STDIN_FILENO, buffer, BUFSIZ);
        if (num_bytes < 0) break;  // Error reported by `read`.
        write(master, buffer, num_bytes);
        fwrite(buffer, 1, num_bytes, outfile);
      }
      if (FD_ISSET(master, &fds)) {
        int num_bytes = read(master, buffer, BUFSIZ);
        if (num_bytes <= 0) break;  // Error or EOF.
        write(STDOUT_FILENO, buffer, num_bytes);
      }
    }
  }

  // Wait for the command to complete.
  int status;
  pid_t pid;
  do {
    pid = wait3(&status, WNOHANG, 0);
    if (pid == -1 && errno == ECHILD) break;
  } while (pid != child);

  tcsetattr(STDIN_FILENO, TCSAFLUSH, &tt);
  fclose(outfile);
  close(master);

  return 0;
}
