return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim' },
  config = function()
    local lualine = require 'lualine'
    local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

    -- local colors = {
    --   blue = '#65D1FF',
    --   green = '#3EFFDC',
    --   violet = '#FF61EF',
    --   yellow = '#FFDA7B',
    --   red = '#FF4A4A',
    --   fg = '#c3ccdc',
    --   bg = '#112638',
    --   inactive_bg = '#2c3043',
    -- }
    local custom_gruvbox = require 'lualine.themes.gruvbox'
    -- custom_gruvbox.normal.c.bg = '#112233'
    custom_gruvbox.insert.b = { fg = custom_gruvbox.insert.a.bg, gui = 'bold' }
    custom_gruvbox.visual.b = { fg = custom_gruvbox.visual.a.bg, gui = 'bold' }
    custom_gruvbox.replace.b = { fg = custom_gruvbox.replace.a.bg, gui = 'bold' }
    custom_gruvbox.command.b = { fg = custom_gruvbox.command.a.bg, gui = 'bold' }

    -- Change the background of lualine_c section for normal mode
    --
    -- local my_lualine_theme = {
    --   normal = {
    --     a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   insert = {
    --     a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   visual = {
    --     a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   command = {
    --     a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   replace = {
    --     a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   inactive = {
    --     a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
    --     b = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --     c = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --   },
    -- }
    local git_blame = require 'gitblame'
    vim.g.gitblame_display_virtual_text = 0

    -- configure lualine with modified theme
    lualine.setup {
      options = {
        theme = custom_gruvbox,
      },
      sections = {
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
    }
  end,
}
