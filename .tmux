#!/bin/sh

# Add this to your zshrc or bzshrc file
not_inside_tmux() {
  [ -z "$TMUX" ]
}

ensure_tmux_is_running() {
  if not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

