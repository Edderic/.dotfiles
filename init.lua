-- Temporarily disable Ruby to avoid errors
vim.g.loaded_ruby_provider = 0
vim.cmd("source ~/.vimrc")

-- Language-aware toggle comment function for Neovim
local comment_strings = {
  python = "#",
  lua = "--",
  vim = '"',
  sh = "#",
  bash = "#",
  zsh = "#",
  ruby = "#",
  javascript = "//",
  typescript = "//",
  c = "//",
  cpp = "//",
  java = "//",
  go = "//",
  rust = "//",
  html = "<!--",
  xml = "<!--",
  css = "/*",
  scss = "/*",
  yaml = "#",
  toml = "#",
  make = "#",
  conf = "#",
  tex = "%",
  r = "#",
  julia = "#",
  matlab = "%",
}

-- Debug version of comment function
function _G.toggle_comment_debug()
  local ft = vim.bo.filetype
  local comment = comment_strings[ft] or "#"

  -- Get visual marks for selection
  local start_mark = vim.api.nvim_buf_get_mark(0, "<")
  local end_mark = vim.api.nvim_buf_get_mark(0, ">")
  local s, e

  print("Filetype:", ft)
  print("Comment char:", comment)
  print("Start mark:", vim.inspect(start_mark))
  print("End mark:", vim.inspect(end_mark))

  -- Check if we have valid visual marks (visual mode)
  if start_mark[1] > 0 and end_mark[1] > 0 then
    s = start_mark[1]
    e = end_mark[1]
    print("Visual mode detected: lines", s, "to", e)
  else
    -- Normal mode - just current line
    s = vim.fn.line(".")
    e = s
    print("Normal mode detected: line", s)
  end

  -- Ensure s <= e
  if s > e then
    s, e = e, s
  end

  local lines = vim.fn.getline(s, e)
  print("Processing", #lines, "lines")

  local all_commented = true

  -- Check if all lines are already commented
  for i, line in ipairs(lines) do
    local trimmed = line:match("^%s*(.*)")
    if trimmed ~= "" and not vim.startswith(trimmed, comment) then
      all_commented = false
      print("Line", s + i - 1, "not commented:", trimmed)
      break
    end
  end

  print("All commented:", all_commented)

  -- Process each line
  for i, line in ipairs(lines) do
    local indent, content = line:match("^(%s*)(.*)")
    if all_commented then
      -- Remove comment if present
      if vim.startswith(content, comment) then
        content = content:gsub("^" .. vim.pesc(comment) .. " ?", "", 1)
        lines[i] = indent .. content
        print("Uncommented line", s + i - 1)
      end
    else
      -- Add comment if content exists
      if content ~= "" then
        lines[i] = indent .. comment .. " " .. content
        print("Commented line", s + i - 1)
      end
    end
  end

  -- Apply the changes
  vim.fn.setline(s, lines)

  -- Restore visual selection if we had one
  if start_mark[1] > 0 and end_mark[1] > 0 then
    vim.cmd("normal! gv")
    print("Restored visual selection")
  end
end

-- Comment function
function _G.toggle_comment()
  local ft = vim.bo.filetype
  local comment = comment_strings[ft] or "#"
  local s, e

  -- Check if were in visual mode by looking at the current mode
  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' or mode == '' then
    -- Visual mode - use visual marks
    local start_mark = vim.api.nvim_buf_get_mark(0, '<')
    local end_mark = vim.api.nvim_buf_get_mark(0, '>')
    if start_mark[1] > 0 and end_mark[1] > 0 then
      s = start_mark[1]
      e = end_mark[1]
    else
      -- Fallback to current line if marks are invalid
      s = vim.fn.line('.')
      e = s
    end
  else
    -- Normal mode - check for count prefix
    local count = vim.v.count
    if count > 0 then
      -- Use count to determine range
      s = vim.fn.line('.')
      e = s + count - 1
    else
      -- Just current line
      s = vim.fn.line('.')
      e = s
    end
  end

  -- Ensure s <= e
  if s > e then
    s, e = e, s
  end

  local lines = vim.fn.getline(s, e)
  local all_commented = true

  -- Check if all lines are already commented
  for _, line in ipairs(lines) do
    local trimmed = line:match("^%s*(.*)")
    if trimmed ~= "" and not vim.startswith(trimmed, comment) then
      all_commented = false
      break
    end
  end

  -- Process each line
  for i, line in ipairs(lines) do
    local indent, content = line:match("^(%s*)(.*)")
    if all_commented then
      -- Remove comment if present
      if vim.startswith(content, comment) then
        content = content:gsub("^" .. vim.pesc(comment) .. " ?", "", 1)
        lines[i] = indent .. content
      end
    else
      -- Add comment if content exists
      if content ~= "" then
        lines[i] = indent .. comment .. " " .. content
      end
    end
  end

  -- Apply the changes
  vim.fn.setline(s, lines)

  -- Restore visual selection if we were in visual mode
  if mode == 'v' or mode == 'V' or mode == '' then
    vim.cmd("normal! gv")
  end
end

-- Visual mode: <leader>/ to toggle comment
vim.keymap.set('v', '<leader>/', toggle_comment, {desc = "Toggle comment"})

-- Normal mode: <leader>/ to toggle comment on current line
vim.keymap.set('n', '<leader>/', toggle_comment, {desc = "Toggle comment"})

-- Source init.lua file
vim.keymap.set('n', '<leader>sv', function()
  vim.cmd('source ~/.dotfiles/init.lua')
end, {desc = "Source init.lua"})

-- Edit init.lua file
vim.keymap.set('n', '<leader>ev', function()
  vim.cmd('tabe ~/.dotfiles/init.lua')
end, {desc = "Edit init.lua"})

-- Function to run rubocop -A on modified Ruby files
function _G.run_rubocop_on_modified_files()
  -- Get the current working directory
  local cwd = vim.fn.getcwd()
  
  -- Run git status to get modified files
  local git_status = vim.fn.system('git status --porcelain')
  
  if vim.v.shell_error ~= 0 then
    vim.notify("Not in a git repository or git command failed", vim.log.levels.ERROR)
    return
  end
  
  local ruby_files = {}
  
  -- Parse git status output to find modified Ruby files
  for line in git_status:gmatch("[^\r\n]+") do
    -- Git porcelain format: XY PATH or XY ORIG_PATH -> PATH
    local status, file = line:match("^([AMDRT][AMDRT]?)%s+(.+)$")
    if status and file then
      -- Remove leading/trailing whitespace
      file = file:match("^%s*(.-)%s*$")
      
      -- Check if it's a Ruby file
      if file:match("%.rb$") then
        table.insert(ruby_files, file)
      end
    end
  end
  
  if #ruby_files == 0 then
    vim.notify("No modified Ruby files found", vim.log.levels.INFO)
    return
  end
  
  -- Build the rubocop command
  local rubocop_cmd = "rubocop -A " .. table.concat(ruby_files, " ")
  
  -- Run rubocop
  vim.notify("Running: " .. rubocop_cmd, vim.log.levels.INFO)
  
  local result = vim.fn.system(rubocop_cmd)
  
  if vim.v.shell_error == 0 then
    vim.notify("Rubocop completed successfully", vim.log.levels.INFO)
    -- Reload the current buffer if it's one of the modified files
    local current_file = vim.fn.expand("%")
    for _, file in ipairs(ruby_files) do
      if current_file == file then
        vim.cmd("edit!")
        break
      end
    end
  else
    vim.notify("Rubocop failed: " .. result, vim.log.levels.ERROR)
  end
end

-- Keymap to run rubocop on modified Ruby files
vim.keymap.set('n', '<leader>li', run_rubocop_on_modified_files, {desc = "Run rubocop -A on modified Ruby files"})
