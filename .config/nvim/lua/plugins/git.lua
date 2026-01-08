return {
  -- The best Git wrapper for Vim
  -- Usage: :G (status), :Gdiffsplit (diff)
  "tpope/vim-fugitive",

  -- Side-by-side diff view for the whole project
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = { { "<leader>gd", ":DiffviewOpen<CR>", desc = "Git Diffview" } },
  }
}
