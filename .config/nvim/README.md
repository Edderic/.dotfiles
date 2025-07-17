# Modern Neovim Configuration

This is a modern Neovim configuration based on your original `.vimrc` preferences, converted to Lua and using modern plugins.

## Features

### 🎨 **Themes**
- **Tokyo Night** (default) - Beautiful dark theme with excellent contrast
- **Catppuccin** - Soft, warm theme available in multiple variants

### 🔧 **Core Functionality**
- **Git Integration** - Fugitive + Gitsigns for Git operations
- **Commenting** - Modern commenting with `<leader>/`
- **Rails Support** - Modern Rails plugin with proper Neovim compatibility
- **Tmux Integration** - Seamless navigation between tmux panes
- **File Tree** - Neo-tree for file navigation
- **Fuzzy Finding** - Telescope for finding files, grep, etc.

### 🚀 **Development Features**
- **LSP Support** - Language Server Protocol for Ruby, JavaScript, Python, etc.
- **Treesitter** - Better syntax highlighting
- **Auto-completion** - CMP with LSP integration
- **Auto-pairs** - Automatic bracket/parenthesis pairing
- **Indent guides** - Visual indent guides

### ⌨️ **Key Mappings**

#### Git Operations
- `<leader>gb` - Git blame
- `<leader>gst` - Git status
- `<leader>gcm` - Git commit
- `<leader>gpsh` - Git push origin HEAD

#### File Operations
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Find buffers (Telescope)

#### Testing
- `<leader>tt` - Run current test file
- `<leader>ts` - Run nearest test
- `<leader>ta` - Run all tests

#### Ruby Development
- `<leader>li` - Run rubocop on modified files
- `<leader>/` - Toggle comments

#### Navigation
- `<C-h/j/k/l>` - Navigate between tmux panes
- `<C-\>` - Toggle terminal
- `¡™£¢∞§¶•ªº` - Quick tab switching (1-9, last)

## Installation

The configuration is automatically installed when you start Neovim. Plugins will be downloaded and installed via lazy.nvim.

## Customization

### Changing Themes
Edit `~/.dotfiles/init.lua` and change:
```lua
vim.cmd("colorscheme tokyonight")
```
to:
```lua
vim.cmd("colorscheme catppuccin")
```

### Adding New Keymaps
Edit `~/.config/nvim/lua/config/keymaps.lua`

### Adding New Plugins
Edit `~/.config/nvim/lua/plugins/init.lua`

## Troubleshooting

### If you get errors about missing functions
Some functions from your old `.vimrc` might not be available. You can add them to `~/.config/nvim/lua/config/autocmds.lua` or create new Lua functions.

### If Rails plugin causes issues
The Rails plugin is configured to avoid the compiler error. If you still have issues, you can disable it by commenting out the Rails plugin in the plugins file.

## Migration from .vimrc

This configuration preserves most of your important keybindings and functionality:
- ✅ Git operations
- ✅ Tab navigation
- ✅ Line movement
- ✅ Commenting
- ✅ Ruby/RSpec shortcuts
- ✅ Tmux integration
- ✅ File operations

Some advanced functions from your `.vimrc` might need to be reimplemented in Lua if you need them.

## Next Steps

1. **Restart Neovim** - The new configuration will load
2. **Install LSP servers** - Run `:Mason` to install language servers
3. **Customize further** - Add any missing functionality you need

## Support

If you encounter issues:
1. Check `:checkhealth` for plugin status
2. Look at `:messages` for error details
3. The configuration is modular, so you can easily modify individual components 