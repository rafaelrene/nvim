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
      },
      setup = {
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
              if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
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
