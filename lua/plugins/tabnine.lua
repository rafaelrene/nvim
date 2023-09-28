return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh",
  keys = "<A-Tab>",
  config = function()
    require("tabnine").setup({
      disable_auto_comment = true,
      accept_keymap = "<A-Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt", "spectre_panel", "fugitive", "minifiles" },
      log_file_path = nil, -- absolute path to Tabnine log file
    })
  end,
}
