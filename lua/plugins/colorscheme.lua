return {
  {
    "Mofiqul/vscode.nvim",
    opts = {
      colorscheme = "vscode",
    },
    config = function(_, opts)
      require("vscode").setup(opts)
      require("lualine").setup({
        options = {
          theme = "vscode",
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "EdenEast/nightfox.nvim" },
  { "rose-pine/neovim", as = "rose-pine" },
  { "rebelot/kanagawa.nvim" },
  { "navarasu/onedark.nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("cyberdream").setup(opts)
      require("lualine").setup({
        options = {
          theme = "cyberdream",
        },
      })
    end,
    opts = {
      colorscheme = "cyberdream",
      theme = {
        colors = {
          bgHighlight = "#5f6269",
        },
      },
      highlights = {},
    },
  },

  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
