local opt = vim.opt

opt.number = true          -- Show line numbers
opt.relativenumber = false -- Relative numbers
opt.tabstop = 2            -- Tab width 4
opt.shiftwidth = 2         -- Indent width 4
opt.expandtab = true       -- Use spaces instead of tabs
opt.smartindent = true     -- Better C++ indentation
opt.undofile = true        -- Persistent undo (even after closing nvim)
opt.signcolumn = "yes"     -- Fixes the "shaking" screen when error appear

vim.opt.splitbelow = true  -- New horizontal splits go to the bottom
vim.opt.splitright = true  -- New vertical splits go to the right
vim.opt.undofile = true    -- Make undo history Persistent

vim.diagnostic.config({
  virtual_text = true, -- Show text next to code
  signs = true,        -- Show icons in the gutter
  underline = true,
})

if vim.fn.filereadable("build/compile_commands.json") == 1 then
  if vim.fn.filereadable("compile_commands.json") == 0 then
    vim.fn.system("ln -s build/compile_commands.json .")
  end
end
