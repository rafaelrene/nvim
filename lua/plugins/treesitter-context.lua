return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    event = "BufEnter",
    opts = {
      mode = "topline",
      line_numbers = true,
    },
  },
}
