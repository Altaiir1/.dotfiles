local map = vim.keymap.set

-- General & Navigation --

map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Debugging (DAP) --

-- Execution Controls

map("n", "<F5>", function() require("dap").continue() end, { desc = "Debug: Start/Continue" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug: Step Over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Debug: Step Into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "Debug: Step Out" })

-- Breakpoints
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = "Debug: Conditional Breakpoint" })

-- UI Management --

map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Debug: Toggle UI" })
map("n", "<leader>dq", function()
  require("dap").terminate()
  require("dapui").close()
end, { desc = "Debug: Terminate Session" })

map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Debug: Open REPL" })

-- Commands --

-- Use ; for commands so you don't have to hold Shift
map("n", ";", ":", { desc = "CMD: Enter command mode" })

-- Fast Saving: ;w saves the file
-- <CR> used at the end to "hit enter" automatically
map("n", ";w", ":w<CR>", { desc = "Save File" })

-- Fast Exit: ;q closes the file
map("n", ";q", ":q<CR>", { desc = "Quit" })

-- Save and Quit: ;x
map("n", ";x", ":x<CR>", { desc = "Save and Quit" })


-- Sliding lines --

-- Move lines up and down (Normal mode)
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move lines up and down (Visual mode)
-- This lets you highlight a whole block and slide it
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
