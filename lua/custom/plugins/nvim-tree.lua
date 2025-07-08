-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
  version = '*', -- Recommended to use a specific tag, e.g., 'v1.x.x' or '*' for latest stable
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, but highly recommended for file icons
  },
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeClose', 'NvimTreeFindFile' }, -- Lazy-load on these commands
  opts = {
    -- Your nvim-tree.lua configuration options
    -- See the "Configuration" section below
  },
  config = function(_, opts)
    -- Disable Netrw (crucial for nvim-tree to work without conflicts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup(opts)

    -- You can add keybindings here, or in a separate keymaps file
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' }) -- Common mapping
  end,
}
