---@module 'lazy'
---@type LazySpec
return {
  {
    'Civitasv/cmake-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      cmake_build_directory = "build", -- Standard build directory
      cmake_soft_link_compile_commands = true, -- Link compile_commands.json to root
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Crucial for clangd
      cmake_build_options = {},
      cmake_console_size = 10, -- 10 lines for the console
      cmake_show_console_on_build = true, -- Show console when building
      cmake_dap_configuration = { -- DAP configuration
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
      },
    },
  },
}
