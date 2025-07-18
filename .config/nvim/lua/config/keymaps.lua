-- Neovim keymaps configuration
-- Based on your .vimrc preferences

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "

-- Git keymaps (from your .vimrc)
map("n", "<Leader>gb", ":Git blame<CR>", opts)
map("n", "<Leader>gst", ":Gstatus<CR>", opts)
map("n", "<Leader>gcm", ":Gcommit<CR>", opts)
map("n", "<Leader>ggr", ":Ggrep<CR>", opts)
map("n", "<Leader>gmo", ":Gmove ", opts)
map("n", "<Leader>grm", ":Gremove<CR>", opts)
map("n", "<Leader>grd", ":Gread<CR>", opts)
map("n", "<Leader>gw", ":Gwrite<CR>", opts)
map("n", "<Leader>gl", ":Glog<CR>", opts)
map("n", "<Leader>gbw", ":Gbrowse<CR>", opts)
map("n", "<Leader>gt", ":Git ", opts)
map("n", "<Leader>gpsh", ":Git push origin HEAD<CR>", opts)
map("n", "<Leader>gap", ":Git add --patch<CR>", opts)
map("n", "<Leader>gap%", ":Git add --patch %<CR>", opts)
map("n", "<Leader>ga%", ":Git add %<CR>", opts)

-- Tab navigation (from your .vimrc)
map("n", "¡", "1gt", opts)
map("n", "™", "2gt", opts)
map("n", "£", "3gt", opts)
map("n", "¢", "4gt", opts)
map("n", "∞", "5gt", opts)
map("n", "§", "6gt", opts)
map("n", "¶", "7gt", opts)
map("n", "•", "8gt", opts)
map("n", "ª", "9gt", opts)
map("n", "º", ":tablast<CR>", opts)

-- Tab cycling
map("n", "¬", "gt", opts)
map("n", "˙", "gT", opts)

-- Move lines up and down (from your .vimrc)
map("n", "<D-j>", ":m .+1<CR>==", opts)
map("n", "<D-k>", ":m .-2<CR>==", opts)
map("i", "<D-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<D-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<D-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<D-k>", ":m '<-2<CR>gv=gv", opts)

-- Move vertically by visual line
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Navigation remappings
map("n", "L", "$", opts)
map("o", "L", "$", opts)
map("v", "L", "$", opts)
map("n", "H", "^", opts)
map("o", "H", "^", opts)
map("v", "H", "^", opts)

-- Copy word/WORD under cursor
map("n", "<Leader>cw", "viw\"+y", opts)
map("n", "<Leader>cW", "viW\"+y", opts)

-- Reindent the whole file
map("n", "<Leader>if", "magg=G`a", opts)

-- Edit configuration files
map("n", "<Leader>eg", ":vsp ~/.gitconfig<CR>", opts)
map("n", "<Leader>ev", ":tabe ~/.config/nvim/init.lua<CR>", opts)
map("n", "<Leader>sv", ":source ~/.config/nvim/init.lua<CR>", opts)

-- File operations
map("n", "<Leader>pl", ":tabe playground.sql<CR>", opts)
map("n", "<Leader>todo", ":vsp todo.markdown<CR>", opts)

-- Commenting (using modern comment plugin)
map("n", "<Leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("v", "<Leader>/", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Testing (RSpec)
map("n", "<Leader>sr", ":call ToggleSpringRspec()<CR>", opts)
map("n", "<Leader>td", ":call RunRSpecDirOfCurrentBuffer()<CR>", opts)
map("n", "<Leader>tt", ":call RunCurrentSpecFile()<CR>", opts)
map("n", "<Leader>ts", ":call RunNearestSpec()<CR>", opts)
map("n", "<Leader>tl", ":call RunLastSpec()<CR>", opts)
map("n", "<Leader>ta", ":call RunAllSpecs()<CR>", opts)

-- Tmux navigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
map("n", "<C-m>", ":TmuxNavigatePrevious<CR>", opts)

-- Tmux runner
map("n", "<Leader>vv", ":call VtrSendVisuallySelectedCommand()<CR>", opts)
map("v", "<Leader>vv", ":call VtrSendVisuallySelectedCommand()<CR>", opts)
map("n", "<Leader>vr", ":VtrSendLinesToRunner<CR>", opts)
map("v", "<Leader>vr", ":VtrSendLinesToRunner<CR>", opts)
map("n", "<Leader>vsc", ":VtrSendCommandToRunner<CR>", opts)
map("n", "<Leader>vcr", ":VtrClearRunner<CR>", opts)
map("n", "<Leader>vfc", ":VtrFlushCommand<CR>", opts)
map("n", "<Leader>vatp", ":VtrAttachToPane<CR>", opts)
map("n", "<Leader>vsf", ":VtrSendFile<CR>", opts)
map("n", "<Leader>vfr", ":VtrFocusRunner<CR>", opts)

-- Ruby-specific keymaps
map("n", "<Leader>li", "<cmd>lua require('config.ruby').run_rubocop_on_modified_files()<CR>", opts)

-- Insert mode character pairs
local function insert_pair(open, close)
  return function()
    vim.api.nvim_put({open .. close}, "", false, true)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, true, true), "n", false)
  end
end

map("i", "'", insert_pair("'", "'"), opts)
map("i", "`", insert_pair("`", "`"), opts)
map("i", "\"", insert_pair("\"", "\""), opts)
map("i", "[", insert_pair("[", "]"), opts)
map("i", "{", insert_pair("{", "}"), opts)
map("i", "(", insert_pair("(", ")"), opts)
map("i", "|", insert_pair("|", "|"), opts)
map("i", "<", insert_pair("<", ">"), opts)

-- Quick exit from insert mode
map("i", "jk", "<Esc>", opts)

-- Quick exit from visual mode
map("v", "<Leader>jk", "<Esc>", opts)
map("x", "<Leader>jk", "<Esc>", opts)

-- Copy file path to register
map("n", "<Leader>yf", function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", file_path)
  vim.notify("Copied file path: " .. file_path, vim.log.levels.INFO)
end, opts)

-- Regenerate tags file
map("n", "<Leader>cr", function()
  vim.notify("Regenerating tags file...", vim.log.levels.INFO)
  vim.fn.system("ctags -R .")
  vim.notify("Tags file updated!", vim.log.levels.INFO)
end, opts)

-- Neo-tree file explorer
map("n", "<C-p>", "<cmd>Neotree focus<cr>", opts)
map("n", "<Leader>e", "<cmd>Neotree toggle<cr>", opts)

-- Telescope search keymaps
map("n", "\\", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", opts) 
