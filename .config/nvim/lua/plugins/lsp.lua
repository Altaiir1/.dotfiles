return {
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "clangd", "lua_ls" } }
  },
  {
    "neovim/nvim-lspconfig",
    version = "v0.1.x",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup Clangd (C/C++)
      lspconfig.clangd.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
      })

      -- Setup Lua LS (Lua)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Stop the "undefined global 'vim'" warning
            },
          },
        },
      })

      -- The Shared Autocmd (Works for ANY attached LSP)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP: Rename Variable", buffer = args.buf })

          -- Format Keymap
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format({ async = true })
          end, { desc = "LSP: Format File", buffer = args.buf })

          -- Auto-format on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      })
    end
  }
}
