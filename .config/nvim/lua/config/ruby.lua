-- Ruby utilities for Neovim
-- Based on your original init.lua functions

local M = {}

-- Function to run rubocop -A on modified Ruby files
function M.run_rubocop_on_modified_files()
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

return M 