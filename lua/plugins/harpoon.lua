return {
  {
    "ThePrimeagen/harpoon",
    opts = function(_, opts)
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add harpoon mark" })
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon menu" })

      vim.keymap.set("n", "<leader>1", function()
        ui.nav_file(1)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>2", function()
        ui.nav_file(2)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>3", function()
        ui.nav_file(3)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>4", function()
        ui.nav_file(4)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>5", function()
        ui.nav_file(5)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>6", function()
        ui.nav_file(6)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>7", function()
        ui.nav_file(7)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>8", function()
        ui.nav_file(8)
      end, { desc = "Toggle to harpoon mark" })
      vim.keymap.set("n", "<leader>9", function()
        ui.nav_file(9)
      end, { desc = "Toggle to harpoon mark" })

      if opts.menu == nil then
        opts.menu = {}
      end

      opts.menu = vim.tbl_extend("force", opts.menu, {
        width = vim.api.nvim_win_get_width(0) - 8,
      })

      return opts
    end,
  },
}
