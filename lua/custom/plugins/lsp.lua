-- LSP and Completion
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'tsserver',
        'jsonls',
        'cssls',
        'html',
        'svelte', -- Crucial for Svelte LSP
        'pyright', -- If you use Python for Strapi scripts/customizations
        -- "sqlls", -- If you want SQL LSP
      },
    }
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        local lspconfig = require 'lspconfig'
        local cmp_nvim_lsp = require 'cmp_nvim_lsp'
        local capabilities = cmp_nvim_lsp.default_capabilities()

        if server_name == 'svelte' then
          lspconfig.svelte.setup {
            capabilities = capabilities,
            filetypes = { 'svelte', 'typescript', 'javascript' },
            settings = {
              svelte = {
                plugin = {
                  typescript = { enable = true },
                },
              },
            },
          }
        elseif server_name == 'typescript' then
          lspconfig.tsserver.setup {
            capabilities = capabilities,
            -- You might adjust this based on whether svelte-language-server takes over
            -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
          }
        else
          lspconfig[server_name].setup {
            capabilities = capabilities,
          }
        end
      end,
    }
  end,
}
