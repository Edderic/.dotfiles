# General

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export PATH="/usr/local/Cellar/vim/7.4.826/bin:$PATH"
export PATH="$HOME/.edderic-dotfiles/bin:$PATH"

eval "$(rbenv init -)"

source ~/.edderic-dotfiles/.aliases
source ~/.edderic-dotfiles/.paths
source ~/.edderic-dotfiles/.git-ps1
source ~/.edderic-dotfiles/.git-completion
source ~/.edderic-dotfiles/.lingraphica-keys
source ~/.edderic-dotfiles/.tmux
