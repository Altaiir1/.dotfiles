return {
  "Civitasv/cmake-tools.nvim",
  opts = {
    cmake_build_directory = "build",
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_executor = {
      name = "terminal",
      opts = {
        split_direction = "horizontal",
        split_size = 10,
        -- This ensures the build terminal closes automatically if it succeeds
        -- so it doesn't clutter your screen.
        single_terminal_per_instance = true,
      },
    },
    cmake_runner = {
      name = "terminal",
      opts = {
        split_direction = "horizontal",
        split_size = 10,
        single_terminal_per_instance = true,
      },
    },
  },
  config = function(_, opts)
    require("cmake-tools").setup(opts)

    local map = vim.keymap.set
    map('n', '<leader>cg', ':CMakeGenerate<CR>', { desc = "CMake Generate" })
    map('n', '<leader>cb', ':CMakeBuild<CR>', { desc = "CMake Build" })
    map('n', '<leader>cr', ':CMakeRun<CR>', { desc = "CMake Run" })
  end
}
