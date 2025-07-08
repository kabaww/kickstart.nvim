-- in your init.lua or a dedicated plugin file
return {
  'LazyVim/LazyVim',
  -- other plugins...
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascriptreact', 'typescriptreact', 'xml', 'svelte' }, -- only load for these filetypes
    config = function()
      require('nvim-ts-autotag').setup {
        -- Options can go here. These are the defaults:
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- You can also override individual filetype configs
        per_filetype = {
          -- Example: disable auto close for plain HTML if needed
          -- ["html"] = { enable_close = false }
        },
      }
    end,
  },
  -- more plugins...
}
