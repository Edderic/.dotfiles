-- Neovim options configuration
-- Based on your .vimrc preferences

local opt = vim.opt
local g = vim.g

-- Basic settings
opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.ruler = true
opt.scrolloff = 0
opt.autoread = true

-- Indentation settings (from your .vimrc)
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- File settings
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.showmatch = true
opt.matchtime = 2

-- Performance
opt.lazyredraw = true
opt.updatetime = 300

-- Disable providers that cause issues
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- Disable old Rails plugin
g.loaded_rails = 1

-- Statusline (simplified version of your .vimrc)
opt.statusline = "%F%=%P %{fugitive#statusline()}" 