return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "princejoogie/dir-telescope.nvim",
        config = function()
          require("telescope").load_extension("dir")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      },
    },
    opts = {
      extensions = {
        file_browser = {
          hidden = { file_browser = true, folder_browser = true },
          mappings = {
            ["i"] = {
              ["<C-d>"] = function()
                local fb_actions = require("telescope").extensions.file_browser.actions
                return fb_actions.change_cwd
              end,
            },
            ["n"] = {
              ["d"] = function()
                local fb_actions = require("telescope").extensions.file_browser.actions
                return fb_actions.change_cwd
              end,
            },
          },
        },
      },
    },
    keys = {
      -- { "<leader>sg", "<cmd>Telescope dir live_grep_args<cr>", desc = "Grep (Root Dir)" },
      { "<leader>sd", "<cmd>Telescope dir live_grep<cr>", desc = "Grep dir (Root Dir)" },
      { "<leader>fd", "<cmd>Telescope dir find_files<cr>", desc = "Find dir files (Root Dir)" },
      {
        "<leader>fw",
        function()
          return LazyVim.telescope("fd", { default_text = vim.fn.expand("<cword>") })()
        end,
        desc = "Find Files (Word)",
      },
      {
        "<leader>fB",
        "<cmd>Telescope file_browser<cr>",
        desc = "File browser",
      },
      -- {
      --   "<leader>fw",
      --   LazyVim.telescope("find_files", { default_text = vim.fn.expand("<cword>") }),
      --   desc = "Find Files (Word)",
      -- },
    },
  },
}
