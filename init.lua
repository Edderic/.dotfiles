-- Modern Neovim Configuration
-- Based on your existing .vimrc preferences

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic Neovim settings
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Configure plugins
require("lazy").setup("plugins")

-- Set colorscheme
vim.cmd("colorscheme tokyonight")


