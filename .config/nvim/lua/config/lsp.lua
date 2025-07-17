-- LSP configuration
-- Basic setup for Ruby, JavaScript, and other languages

-- Wait for all dependencies to be available
local function setup_lsp()
  -- Check if required modules are available
  local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  
  if not cmp_lsp_ok or not mason_lspconfig_ok or not lspconfig_ok then
    vim.notify("LSP dependencies not ready yet", vim.log.levels.DEBUG)
    return false
  end
  
  local capabilities = cmp_lsp.default_capabilities()
  
  -- Use mason-lspconfig for automatic setup
  mason_lspconfig.setup_handlers({
    -- Default handler for installed servers
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end,
    
    -- Custom handlers for specific servers
    ["ruby_lsp"] = function()
      -- Try to find ruby-lsp in different locations
      local function find_ruby_lsp()
        local paths = {
          "ruby-lsp",
          "bundle exec ruby-lsp",
          vim.fn.expand("~/.rbenv/shims/ruby-lsp"),
          vim.fn.expand("~/.rvm/gems/*/bin/ruby-lsp"),
        }
        
        for _, path in ipairs(paths) do
          if vim.fn.executable(path) == 1 then
            return path
          end
        end
        
        -- If not found, return nil to disable the LSP
        return nil
      end
      
      local cmd = find_ruby_lsp()
      if cmd then
        lspconfig.ruby_lsp.setup({
          capabilities = capabilities,
          cmd = { cmd },
          filetypes = { "ruby" },
          init_options = {
            formatter = "rubocop",
          },
        })
      else
        vim.notify("ruby-lsp not found. Install with: gem install ruby-lsp", vim.log.levels.WARN)
      end
    end,
    
    ["solargraph"] = function()
      lspconfig.solargraph.setup({
        capabilities = capabilities,
        settings = {
          solargraph = {
            diagnostics = true,
            formatting = true,
          },
        },
      })
    end,
    
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  })
  
  return true
end

-- Try to setup LSP immediately, if it fails, retry later
if not setup_lsp() then
  -- Retry after a short delay
  vim.defer_fn(function()
    setup_lsp()
  end, 1000)
end

-- Global LSP settings
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Keymaps for LSP
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Attach LSP keymaps when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    lsp_keymaps(args.buf)
  end,
}) 