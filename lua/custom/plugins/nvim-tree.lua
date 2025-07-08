-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
  version = '*', -- Recommended to use a specific tag, e.g., 'v1.x.x' or '*' for latest stable
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, but highly recommended for file icons
  },
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeClose', 'NvimTreeFindFile' }, -- Lazy-load on these commands
  -- Example opts table for nvim-tree.lua
  opts = {
    sort = {
      sorter = 'case_sensitive', -- or "name", "nat_asc"
    },
    view = {
      width = 30, -- Adjust sidebar width
      -- auto_resize = true, -- Automatically resize the tree based on content
      side = 'left', -- "left" or "right" (for VS Code-like, use "left")
      preserve_window_proportions = false, -- Prevent tree from messing up window layout
      -- float = { -- For a floating window instead of a sidebar
      --   enable = true,
      --   quit_on_focus_lose = true,
      --   open_fn = function()
      --     return vim.api.nvim_open_win( ... ) -- Custom function for floating window
      --   end,
      -- },
    },
    renderer = {
      group_empty = true, -- Group empty directories
      full_name = true, -- Show full file names including extensions
      highlight_git = true, -- Highlight files based on Git status
      highlight_diagnostics = true, -- Highlight files with LSP diagnostics
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
          diagnostics = true,
        },
        glyphs = {
          default = '', -- Fallback file icon
          symlink = '', -- Symlink icon
          git = {
            unstaged = '', -- Unstaged changes
            staged = '', -- Staged changes
            unmerged = '', -- Unmerged changes
            renamed = '襁', -- Renamed files
            deleted = '', -- Deleted files
            untracked = 'U', -- Untracked files
            ignored = '◌', -- Ignored files
          },
          folder = {
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
        },
      },
    },
    filters = {
      dotfiles = false, -- Show hidden files (e.g., .git, .config)
      exclude = { '.git', 'node_modules', '.cache' }, -- Directories to ignore
      custom = {},
    },
    git = {
      enable = true, -- Enable Git integration
      ignore = false, -- Don't ignore files specified in .gitignore
    },
    diagnostics = {
      enable = true, -- Enable LSP diagnostics integration
      show_on_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = '',
        info = '',
        warning = 'Exclamation',
        error = '',
      },
    },
    actions = {
      open_file = {
        quit_on_open = false, -- Keep tree open after opening a file
        resize_window = true,
        window_picker = {
          enable = true,
          exclude = {
            filetype = { 'neo-tree', 'lazy', 'mason', 'undotree', 'qf', '' },
            buftype = { 'terminal', 'nofile', 'quickfix' },
          },
        },
      },
    },
    -- ... many more options. Check `:h nvim-tree-setup` for the full list.
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
