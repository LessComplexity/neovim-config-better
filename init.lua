-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Add C-c to copy to clipboard in all modes
vim.api.nvim_set_keymap("n", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true })
vim.api.nvim_set_keymap("i", "<C-c>", '<Esc>"+y', { noremap = true })
-- Add C-v to paste from clipboard
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true })
vim.api.nvim_set_keymap("i", "<C-v>", '<Esc>"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-v>", '"+p', { noremap = true })

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h11"
end
