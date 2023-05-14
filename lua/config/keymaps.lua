-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move buffer page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move bugger page up" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous" })

vim.keymap.set(
  "n",
  "<leader>fs",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Find and Replace (In Current Buffer)" }
)

vim.keymap.set("v", "K", ":m '< -2<CR>gv=gv", { desc = "Move selection line up" })
vim.keymap.set("v", "J", ":m '> +1<CR>gv=gv", { desc = "Move selection line down" })

vim.keymap.set("i", "jk", "<esc>", { desc = "Return to normal mode" })
