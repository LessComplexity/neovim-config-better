return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
  },
  keys = {
    { "<leader>vb", ":Git blame<CR>", desc = "Git Blame" },
    { "<leader>vg", ":Git browse<CR>", desc = "Git Browse" },
    { "<leader>vc", ":Git commit<CR>", desc = "Git Commit" },
    { "<leader>vd", ":Git diff<CR>", desc = "Git Diff" },
    { "<leader>vG", ":Git grep<CR>", desc = "Git Grep" },
    { "<leader>vl", ":Git log<CR>", desc = "Git Log" },
    { "<leader>vm", ":Git move<CR>", desc = "Git Move" },
    { "<leader>vp", ":Git pull<CR>", desc = "Git Pull" },
    { "<leader>vP", ":Git push<CR>", desc = "Git Push" },
    { "<leader>vr", ":Gread<CR>", desc = "Git Read" },
    { "<leader>vR", ":Git remove<CR>", desc = "Git Remove" },
    { "<leader>vs", ":Git<CR>", desc = "Git Status" },
    { "<leader>vw", ":Gwrite<CR>", desc = "Git Write" },
  },
}
