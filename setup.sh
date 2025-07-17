#!/usr/bin/env bash

ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/lua
mkdir -p $HOME/.config/nvim/lua/config
mkdir -p $HOME/.config/nvim/lua/plugins
ln -s $PWD/.config/nvim/init.lua $HOME/.config/nvim/init.lua
ln -s $PWD/.config/nvim/lua/plugins/init.lua $HOME/.config/nvim/lua/plugins/init.lua
ln -s $PWD/.config/nvim/lua/config/autocmds.lua $HOME/.config/nvim/lua/config/autocmds.lua
ln -s $PWD/.config/nvim/lua/config/keymaps.lua $HOME/.config/nvim/lua/config/keymaps.lua
ln -s $PWD/.config/nvim/lua/config/lsp.lua $HOME/.config/nvim/lua/config/lsp.lua
ln -s $PWD/.config/nvim/lua/config/options.lua $HOME/.config/nvim/lua/config/options.lua
ln -s $PWD/.config/nvim/lua/config/ruby.lua $HOME/.config/nvim/lua/config/ruby.lua
ln -s $
