local util = require("lspconfig/util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
        gopls = {
          settings = {
            gopls = {
              semanticTokens = true,
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
              },
            },
          },
        },
      },
      setup = {
        gopls = function()
          -- workaround for gopls not supporting semantictokensprovider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          require("lazyvim.util").on_attach(function(client, _)
            if client.name == "gopls" then
              if not client.server_capabilities.semanticTokensProvider then
                local semantic = client.config.capabilities.textDocument.semanticTokens
                client.server_capabilities.semanticTokensProvider = {
                  full = true,
                  legend = {
                    tokenTypes = semantic.tokenTypes,
                    tokenModifiers = semantic.tokenModifiers,
                  },
                  range = true,
                }
              end
            end
          end)
          -- end workaround
        end,
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)

          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              if util.get_active_client_by_name(event.buf, "eslint") then
                vim.cmd("EslintFixAll")
              end
            end,
          })
        end,
        tsserver = function(_, opts)
          opts.on_attach = function(server)
            if vim.b.large_buf then
              vim.lsp.get_client_by_id(server.id).stop()
            else
              vim.lsp.get_client_by_id(server.id).setup(opts)
            end
          end
        end,
      },
    },
  },
}
