return {
  'luckasRanarison/tailwind-tools.nvim',
  name = 'tailwind-tools',
  -- The 'build' command is important for remote plugins
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- Optional, for the class previewer
    'neovim/nvim-lspconfig', -- Optional, but highly recommended for LSP integration
    'hrsh7th/nvim-cmp', -- Optional, for completion menu styling with colors
    'onsails/lspkind-nvim', -- Optional, for LSP kind icons with cmp and color highlighting
  },
  opts = {
    -- Basic configuration options
    -- The plugin automatically configures tailwindcss-language-server using nvim-lspconfig
    -- if it's installed. Make sure you don't set up the server elsewhere if you want
    -- tailwind-tools to handle it.
    server = {
      override = true, -- Set to true to let tailwind-tools setup the server
      settings = {
        -- You can add specific Tailwind CSS language server settings here.
        -- For example, to include more languages or experimental features:
        -- experimental = {
        --   classRegex = { "tw\\(('([^']*)')\\)" },
        -- },
        includeLanguages = {
          svelte = 'html',
        },
      },
    },
    -- Configuration for nvim-cmp integration (if you use nvim-cmp)
    cmp = {
      highlight = 'foreground', -- or "background" for color preview style
    },
    -- Configuration for telescope.nvim integration (if you use telescope)
    telescope = {
      utilities = {
        callback = function(name, class)
          -- Define a callback function when selecting a utility class
          print('Selected utility: ' .. name .. ' - ' .. class)
        end,
      },
    },
    -- To enable/disable features globally.
    -- These can also be toggled with commands like :TailwindColorToggle
    colors = {
      enable = true,
    }, -- Enable class color hints
    conceal = {
      enable = true,
    }, -- Enable class concealing
  },
  config = function(_, opts)
    -- Call the setup function with your options
    require('tailwind-tools').setup(opts)

    -- You might want to define keymaps for the various commands provided by the plugin
    -- For example:
    -- vim.keymap.set("n", "<leader>tc", ":TailwindColorToggle<CR>", { desc = "Toggle Tailwind Colors" })
    -- vim.keymap.set("n", "<leader>ts", ":TailwindSortSync<CR>", { desc = "Sort Tailwind Classes" })
    -- vim.keymap.set("x", "<leader>ts", ":TailwindSortSelectionSync<CR>", { desc = "Sort selected Tailwind Classes" })

    -- If you want to integrate with nvim-cmp for colored completion items,
    -- ensure your nvim-cmp config includes the formatter:
    -- (This part usually goes into your nvim-cmp plugin configuration, not here)
    -- Example for nvim-cmp config:
    -- {
    --   "hrsh7th/nvim-cmp",
    --   dependencies = {
    --     "luckasRanarison/tailwind-tools.nvim", -- Ensure tailwind-tools is a dependency
    --     "onsails/lspkind-nvim",
    --   },
    --   opts = function()
    --     return {
    --       formatting = {
    --         format = require("lspkind").cmp_format({
    --           before = require("tailwind-tools.cmp").lspkind_format,
    --         }),
    --       },
    --     }
    --   end,
    -- },
  end,
}
