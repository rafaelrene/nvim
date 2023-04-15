local function getIndex(value, table)
  local foundIndex = nil

  for index, tableValue in ipairs(table) do
    if value == tableValue then
      foundIndex = index
    end
  end

  return foundIndex
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local helpIndex = getIndex("help", opts.ensure_installed)

      if helpIndex ~= nil then
        table.remove(opts.ensure_installed, helpIndex)
      end
    end,

    config = function(_, opts)
      opts.highlight.disable = function()
        return vim.b.large_buf
      end

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
