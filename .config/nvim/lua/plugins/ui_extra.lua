return {
  -- Show function signatures while you type
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      floating_window = true,
      hint_enable = true,
      handler_opts = { border = "rounded" },
    },
    config = function(_, opts) require('lsp_signature').setup(opts) end
  },

  -- Automatically highlight other uses of the word under the cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        delay = 100,
        under_cursor = true,
      })
    end
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>so", ":Outline<CR>", desc = "Toggle Outline" } },
    opts = {
      outline_window = {
        width = 30,
        side = 'right',
      },
      preview_window = {
        auto_preview = true,          -- This is what Jdah uses!
        open_hover_on_preview = true, -- Shows LSP info in the preview
        width = 50,                   -- Size of the floating preview window
        min_width = 50,
      },
    },
  },
}
