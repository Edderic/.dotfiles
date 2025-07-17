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

-- Debug version (temporary)
vim.keymap.set('v', '<leader>d', toggle_comment_debug, {desc = "Debug toggle comment"})
vim.keymap.set('n', '<leader>d', toggle_comment_debug, {desc = "Debug toggle comment"})
