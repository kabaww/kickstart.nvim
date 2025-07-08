-- ~/.config/nvim/lua/plugins/init.lua (or a file like emmet.lua inside the plugins directory)
return {
  {
    'olrtg/nvim-emmet',
    ft = { 'html', 'css', 'javascriptreact', 'typescriptreact', 'vue', 'svelte', 'jsx', 'tsx' },
    config = function()
      local emmet = require 'nvim-emmet'
      if not emmet then
        print 'Error: nvim-emmet module did not load inside config.'
        return
      end
      if emmet.wrap_with_abbreviation then
        vim.keymap.set({ 'n', 'v' }, '<leader>xe', function()
          emmet.wrap_with_abbreviation()
        end, { desc = 'Emmet: Wrap with abbreviation', silent = true })
      end
      if emmet.expand_abbreviation then
        vim.keymap.set('i', '<C-y>,', function()
          emmet.expand_abbreviation()
        end, { desc = 'Emmet: Expand abbreviation', silent = true })
      end
    end,
  },
  -- other plugins...
}
