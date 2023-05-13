return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gb", "<cmd> Telescope git_branches <cr>", desc = "branches" },
    { "<leader>sv", "<cmd> Telescope treesitter <cr>", desc = "treesitter symbols" },
  },
  opts = function(_, opts)
    opts.defaults.path_display = { shorten = 10 }
    opts.defaults.layout_strategy = "vertical"
    opts.defaults.layout_config = {
      height = 0.99,
      mirror = true,
      preview_height = 0.7,
      prompt_position = "top",
      width = 0.99,
    }

    return opts
  end,
}
