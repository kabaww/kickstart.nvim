-- ~/.config/nvim/lua/plugins/lazygit.lua
return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- Optional: Keybinding to easily open Lazygit
  keys = {
    { '<leader>gg', ':LazyGit<CR>', desc = 'Open Lazygit' },
  },
  -- Optional: Configuration for nvim-remote (for Lazygit to use Neovim as its editor)
  config = function()
    -- This section is for making Lazygit use Neovim for editing commits, etc.
    -- It's highly recommended for a seamless experience.
    if vim.fn.executable 'nvr' == 1 then
      -- If nvim-remote is installed and executable
      vim.g.lazygit_use_neovim_remote = 1
      vim.g.git_editor = "nvr -cc split --remote-wait +'/set bufhidden=wipe'"
    else
      -- Fallback if nvr is not available (will use default system editor or fallback)
      -- You might need to start Neovim with `nvim --listen /tmp/nvim`
      -- and configure GIT_EDITOR environment variable or your global git config.
      -- For example, in your shell config (.bashrc, .zshrc):
      -- export GIT_EDITOR="nvim --listen /tmp/nvim --remote-wait %f"
      -- And in your Neovim config:
      -- vim.g.lazygit_use_neovim_remote = 0
    end
  end,
}
