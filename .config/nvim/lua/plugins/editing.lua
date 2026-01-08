return {
  -- Modern Lua version of Surround (Instant)
  {
    "echasnovski/mini.surround",
    config = function()
      require('mini.surround').setup()
    end
  },

  -- Modern Lua version of Commentary (Native Neovim 0.10+ support)
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },

  -- Lion (Aligning) is usually okay, but let's ensure it's loaded correctly
  "tommcdo/vim-lion",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  "ntpeters/vim-better-whitespace",
}
