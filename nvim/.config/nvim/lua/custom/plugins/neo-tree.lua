---@module 'lazy'
---@type LazySpec
return {
  -- Neo-tree for file explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- Requires Nerd Fonts
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true, -- Show hidden files (dotfiles)
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = { enabled = true }, -- Focus the file you're currently editing
        },
        window = {
          width = 30,
          mappings = {
            ['<space>'] = 'none', -- Disable space so it doesn't conflict with your leader key
          },
        },
      }
      -- Shortcut to toggle the tree
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle [E]xplorer' })
    end,
  },
}
