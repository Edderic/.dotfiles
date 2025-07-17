#!/usr/bin/env bash

ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.config/nvim
ln -s $PWD/init.lua $HOME/.config/nvim/init.lua
