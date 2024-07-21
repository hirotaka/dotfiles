return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  {

    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },
  {
    "rgroli/other.nvim",
    cmd = { "Other", "OtherClear", "OtherSplit", "OtherVSplit" },
    opts = {
      mappings = {
        "rails",
      },
      -- transformers = {
      --   -- remove `server` from the path
      --   remove_server = function(inputString)
      --     return inputString:gsub("server", "")
      --   end,
      --   -- add `server` to the path
      --   -- ex: +page.ts -> +page.server.ts
      --   -- ex: +page.js -> +page.server.js
      --   add_server = function(inputString)
      --     print(inputString)
      --     return inputString:gsub("%.(ts|js)$", ".server.%1")
      --   end,
      -- },
    },
    config = function(_, opt)
      require("other-nvim").setup(opt)
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        desc = "Open the file manager",
      },
      {
        "<leader>cw",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open the file manager in nvim's working directory",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
    },
  },
  {
    "garymjr/nvim-snippets",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      global_snippets = { "all", "global" },
      search_paths = { vim.fn.stdpath("config") .. "/snippets" },
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
      "RainbowQuery",
    },
  },
  {
    "sindrets/winshift.nvim",
  },
  {
    "AckslD/muren.nvim",
    event = {
      { "BufNewFile", "BufAdd" },
    },
    opts = {
      patterns_width = 60,
      patterns_height = 20,
      options_width = 40,
      preview_height = 24,
    },
    cmd = "MurenToggle",
  },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false, -- required for using the default keymaps
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")
    end,
    keys = {
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    keys = {
      {
        "<leader>D",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Winbar pick",
      },
    },
    opts = function()
      local menu_utils = require("dropbar.utils.menu")

      -- Closes all the windows in the current dropbar.
      local function close()
        local menu = menu_utils.get_current()
        while menu and menu.prev_menu do
          menu = menu.prev_menu
        end
        if menu then
          menu:close()
        end
      end

      return {
        menu = {
          preview = false,
          keymaps = {
            -- Navigate back to the parent menu.
            ["h"] = "<C-w>q",
            -- Expands the entry if possible.
            ["l"] = function()
              local menu = menu_utils.get_current()
              if not menu then
                return
              end
              local row = vim.api.nvim_win_get_cursor(menu.win)[1]
              local component = menu.entries[row]:first_clickable()
              if component then
                menu:click_on(component, nil, 1, "l")
              end
            end,
            ["q"] = close,
            ["<esc>"] = close,
          },
        },
      }
    end,
  },
  -- {
  --   "swaits/zellij-nav.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   keys = {
  --     { "<c-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
  --     { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
  --     { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
  --     { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
  --   },
  --   opts = {},
  -- },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     registries = {
  --       "file:~/Workspaces/github.com/mason-org/mason-registry",
  --     },
  --   },
  -- },
  -- {
  --   "https://git.sr.ht/~swaits/zellij-nav.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   keys = {
  --     { "<c-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
  --     { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
  --     { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
  --     { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
  --   },
  --   opts = {},
  -- },
  -- {
  --   "dynamotn/Navigator.nvim",
  --   keys = {
  --     { "<c-h>", "<cmd>NavigatorLeft<CR>", { silent = true, desc = "navigate left" } },
  --     { "<c-l>", "<cmd>NavigatorRight<CR>", { silent = true, desc = "navigate right" } },
  --     { "<c-k>", "<cmd>NavigatorUp<cr>", { silent = true, desc = "navigate up" } },
  --     { "<c-j>", "<cmd>NavigatorDown<cr>", { silent = true, desc = "navigate down" } },
  --   },
  -- },
  -- {
  --   "nvim-lspconfig",
  --   opts = {
  --     inlay_hints = { enabled = false },
  --   },
  -- },
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
  --   -- tag = "*",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup({
  --       load = {
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/Workspaces/github.com/hirotaka/org/roam",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   opts = {
  --     debug = true, -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
}
