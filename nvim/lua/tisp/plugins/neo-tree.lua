-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    filesystem = {
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        visible = true,
        hide_by_name = {},
        never_show = {
          '.git',
          'DS_Store',
          'thumbs.db',
          '.vscode',
          '.pytest_cache',
          '.venv',
        },
      },
    },
    close_if_last_window = true, -- Close Neo-Tree if it is the last window lest in the tab
  },
}
