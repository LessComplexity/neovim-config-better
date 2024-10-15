return {
  "yetone/avante.nvim",
  -- dir = "~/Personal/OS/avante.nvim",
  -- name = "avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = function(_, opts)
    -- local config = require("avante.config")
    -- config.auto_suggestions_provider = "copilot"
    -- opts.auto_suggestions_provider = "copilot"
    opts.openai = {
      endpoint = "https://api.openai.com/v1",
      model = "o1-preview",
      timeout = 120000, -- Timeout in milliseconds
      temperature = 1,
      max_tokens = 4096,
      ["local"] = false,
    }
    opts.provider = "openai"

    require("img-clip").setup()
    require("copilot").setup()
    require("render-markdown").setup()
    require("avante_lib").load()
    vim.notify("Avante setup completed", vim.log.levels.INFO)
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
}
