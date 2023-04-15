return {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        enabled = function()
          return vim.b.large_buf == false
        end,
      })
    end,
  },
}
