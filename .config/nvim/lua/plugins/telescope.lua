return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    -- SEARCH FILES: The classic Ctrl+P
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })

    -- SEARCH TEXT: Find a variable or string across your whole project
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })

    -- SEARCH OPEN FILES: See everything you're currently working on
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })

    -- SEARCH HELP: Quickly look up Neovim commands
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

    -- Shows a list of everywhere the function/variable under your cursor is used
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, { desc = "Go to References" })
  end
}
