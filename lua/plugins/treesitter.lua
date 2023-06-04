return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add required parsers
      table.insert(opts.ensure_installed, "css")
      table.insert(opts.ensure_installed, "graphql")
      table.insert(opts.ensure_installed, "html")
      table.insert(opts.ensure_installed, "jsdoc")
      table.insert(opts.ensure_installed, "json")
      table.insert(opts.ensure_installed, "lua")
      table.insert(opts.ensure_installed, "rust")
      table.insert(opts.ensure_installed, "scss")
      table.insert(opts.ensure_installed, "typescript")
      table.insert(opts.ensure_installed, "go")
      table.insert(opts.ensure_installed, "gomod")
      table.insert(opts.ensure_installed, "gowork")
      table.insert(opts.ensure_installed, "gosum")
      -- Disable hightlighing on big files
      opts.highlight.disable = function()
        return vim.b.large_buf
      end

      return opts
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
}
