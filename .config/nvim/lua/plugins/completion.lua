return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- From clangd
        { name = 'buffer' },   -- From current file
        { name = 'path' },     -- From file system
      })
    })
  end
}
