return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false, -- Load immediately to get colors
  config = function()
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if status then
      configs.setup({
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end
  end,
}
