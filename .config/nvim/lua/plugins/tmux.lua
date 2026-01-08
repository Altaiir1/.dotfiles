return {
  "christoomey/vim-tmux-runner",
  lazy = false, -- Load it immediately so CMake can find it
  config = function()
    local map = vim.keymap.set
    map("n", "<leader>ta", ":VtrAttachToPane<CR>", { desc = "Tmux: Attach to Pane" })
    map("n", "<leader>to", ":VtrOpenRunner<CR>", { desc = "Tmux: Open Pane" })

    local function tmux_cmake_build()
      vim.cmd('VtrSendCommand "cmake --build build"')
    end

    local function tmux_cmake_run()
      -- 1. Try to find the executable in the build folder
      -- This looks for any file in /build that is executable and not a directory
      local handle = io.popen('find ./build -maxdepth 1 -type f -perm +111 ! -name "*.so" ! -name "*.dylib" | head -n 1')
      local result = handle:read("*a")
      handle:close()

      -- Remove any trailing whitespace/newlines
      local executable = result:gsub("%s+", "")

      if executable ~= "" then
        vim.cmd('VtrSendCommand ' .. executable)
      else
        -- Fallback: If we can't find it, ask you for the name
        local name = vim.fn.input("Executable name: ")
        if name ~= "" then
          vim.cmd('VtrSendCommand ./build/' .. name)
        end
      end
    end

    -- Keymaps
    local map = vim.keymap.set
    map('n', '<leader>cb', ':VtrSendCommand cmake --build build<CR>', { desc = "Tmux: Build" })
    map('n', '<leader>cr', tmux_cmake_run, { desc = "Tmux: Smart Run" })
  end
}
