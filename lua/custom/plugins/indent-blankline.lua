return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    require('ibl').setup {
      scope = {
        enabled = true,
        highlight = { 'IblScope' },
        show_start = true,
      },
    }
  end,
  vim.api.nvim_set_hl(0, 'IblScope', { fg = '#FF5517', bold = true }),
}
