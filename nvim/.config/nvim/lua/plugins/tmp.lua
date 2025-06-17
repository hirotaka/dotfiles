return {
  { "HawkinsT/pathfinder.nvim" },
  {
    "vuciv/golf",
  },
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup({
        templates = {
          "builtin",
          "user",
          "rspec",
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = function()
      require("copilot.api").status = require("copilot.status")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      autotag = {
        -- Setup autotag using treesitter config.
        enable = true,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enabled = false,
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    keys = {
      { "<leader>r", "", desc = "+lspsaga", mode = { "n", "v" } },
      { "<leader>rh", "<cmd>Lspsaga hover_doc<CR>", desc = "hover documentation", mode = "n" },
      { "<leader>rf", "<cmd>Lspsaga finder<CR>", desc = "finder", mode = "n" },
      { "<leader>rr", "<cmd>Lspsaga rename<CR>", desc = "rename", mode = "n" },
      { "<leader>rc", "<cmd>Lspsaga code_action<CR>", desc = "code_action", mode = "n" },
      { "<leader>rs", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "show_line_diagnostics", mode = "n" },
      { "<leader>rp", "<cmd>Lspsaga peek_definition<CR>", desc = "peek_definition", mode = "n" },
      { "<leader>r[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic_jump_prev", mode = "n" },
      { "<leaaer>r]", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic_jump_next", mode = "n" },
    },
  },
  {
    "haya14busa/vim-asterisk",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true,
  },
  {
    "wsdjeg/vim-fetch",
    lazy = false,
  },
  {
    "jannis-baum/vivify.vim",
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
    },
  },
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/Workspaces/github.com/hirotaka/org/roam/agenda/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        mappings = {
          disable_all = true,
        },
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
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  -- { "dmmulroy/ts-error-translator.nvim" },
  -- {
  --   "OlegGulevskyy/better-ts-errors.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   config = {
  --     keymaps = {
  --       toggle = "<leader>dd", -- default '<leader>dd'
  --       go_to_definition = "<leader>dx", -- default '<leader>dx'
  --     },
  --   },
  -- },
  -- {
  --   "voxelprismatic/rabbit.nvim",
  --   config = function()
  --     require("rabbit").setup({})
  --   end,
  -- },
  -- {
  --   "ibhagwan/fzf-lua",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     -- カスタム関数の定義
  --     local function goto_file_line()
  --       local fzf_lua = require("fzf-lua")
  --       fzf_lua.files({
  --         actions = {
  --           ["default"] = function(selected)
  --             local file = selected[1]
  --             vim.ui.input({ prompt = "Enter line number: " }, function(line)
  --               if line and tonumber(line) then
  --                 vim.cmd(string.format("edit +%s %s", line, file))
  --               else
  --                 vim.cmd("edit " .. file)
  --               end
  --             end)
  --           end,
  --         },
  --       })
  --     end
  --     -- キーマッピングの設定
  --     vim.keymap.set("n", "<leader>fl", goto_file_line, { desc = "Go to file and line" })
  --   end,
  -- },

  -- {
  --   "garymjr/nvim-snippets",
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --   },
  --   opts = {
  --     global_snippets = { "all", "global" },
  --     search_paths = { vim.fn.stdpath("config") .. "/snippets" },
  --   },
  -- },
  -- {
  --   "folke/snacks.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   ---@type snacks.Config
  --   opts = {
  --     bigfile = { enabled = true },
  --     dashboard = { enabled = true },
  --     notifier = {
  --       enabled = true,
  --       timeout = 3000,
  --     },
  --     quickfile = { enabled = true },
  --     statuscolumn = { enabled = true },
  --     words = { enabled = true },
  --     styles = {
  --       notification = {
  --         wo = { wrap = true }, -- Wrap notifications
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>.",
  --       function()
  --         Snacks.scratch()
  --       end,
  --       desc = "Toggle Scratch Buffer",
  --     },
  --     {
  --       "<leader>S",
  --       function()
  --         Snacks.scratch.select()
  --       end,
  --       desc = "Select Scratch Buffer",
  --     },
  --     {
  --       "<leader>n",
  --       function()
  --         Snacks.notifier.show_history()
  --       end,
  --       desc = "Notification History",
  --     },
  --     {
  --       "<leader>bd",
  --       function()
  --         Snacks.bufdelete()
  --       end,
  --       desc = "Delete Buffer",
  --     },
  --     {
  --       "<leader>cR",
  --       function()
  --         Snacks.rename.rename_file()
  --       end,
  --       desc = "Rename File",
  --     },
  --     {
  --       "<leader>gB",
  --       function()
  --         Snacks.gitbrowse()
  --       end,
  --       desc = "Git Browse",
  --     },
  --     {
  --       "<leader>gb",
  --       function()
  --         Snacks.git.blame_line()
  --       end,
  --       desc = "Git Blame Line",
  --     },
  --     {
  --       "<leader>gf",
  --       function()
  --         Snacks.lazygit.log_file()
  --       end,
  --       desc = "Lazygit Current File History",
  --     },
  --     {
  --       "<leader>gg",
  --       function()
  --         Snacks.lazygit()
  --       end,
  --       desc = "Lazygit",
  --     },
  --     {
  --       "<leader>gl",
  --       function()
  --         Snacks.lazygit.log()
  --       end,
  --       desc = "Lazygit Log (cwd)",
  --     },
  --     {
  --       "<leader>un",
  --       function()
  --         Snacks.notifier.hide()
  --       end,
  --       desc = "Dismiss All Notifications",
  --     },
  --     {
  --       "<c-/>",
  --       function()
  --         Snacks.terminal()
  --       end,
  --       desc = "Toggle Terminal",
  --     },
  --     {
  --       "<c-_>",
  --       function()
  --         Snacks.terminal()
  --       end,
  --       desc = "which_key_ignore",
  --     },
  --     {
  --       "]]",
  --       function()
  --         Snacks.words.jump(vim.v.count1)
  --       end,
  --       desc = "Next Reference",
  --       mode = { "n", "t" },
  --     },
  --     {
  --       "[[",
  --       function()
  --         Snacks.words.jump(-vim.v.count1)
  --       end,
  --       desc = "Prev Reference",
  --       mode = { "n", "t" },
  --     },
  --     {
  --       "<leader>N",
  --       desc = "Neovim News",
  --       function()
  --         Snacks.win({
  --           file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
  --           width = 0.6,
  --           height = 0.6,
  --           wo = {
  --             spell = false,
  --             wrap = false,
  --             signcolumn = "yes",
  --             statuscolumn = " ",
  --             conceallevel = 3,
  --           },
  --         })
  --       end,
  --     },
  --   },
  --   init = function()
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "VeryLazy",
  --       callback = function()
  --         -- Setup some globals for debugging (lazy-loaded)
  --         _G.dd = function(...)
  --           Snacks.debug.inspect(...)
  --         end
  --         _G.bt = function()
  --           Snacks.debug.backtrace()
  --         end
  --         vim.print = _G.dd -- Override print to use snacks for `:=` command
  --
  --         -- Create some toggle mappings
  --         Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
  --         Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
  --         Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
  --         Snacks.toggle.diagnostics():map("<leader>ud")
  --         Snacks.toggle.line_number():map("<leader>ul")
  --         Snacks.toggle
  --           .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  --           :map("<leader>uc")
  --         Snacks.toggle.treesitter():map("<leader>uT")
  --         Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
  --         Snacks.toggle.inlay_hints():map("<leader>uh")
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "Bekaboo/dropbar.nvim",
  --   event = "LazyFile",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --   },
  --   keys = {
  --     {
  --       "<leader>D",
  --       function()
  --         require("dropbar.api").pick()
  --       end,
  --       desc = "Winbar pick",
  --     },
  --   },
  --   opts = function()
  --     local menu_utils = require("dropbar.utils.menu")
  --
  --     -- Closes all the windows in the current dropbar.
  --     local function close()
  --       local menu = menu_utils.get_current()
  --       while menu and menu.prev_menu do
  --         menu = menu.prev_menu
  --       end
  --       if menu then
  --         menu:close()
  --       end
  --     end
  --
  --     return {
  --       menu = {
  --         preview = false,
  --         keymaps = {
  --           -- Navigate back to the parent menu.
  --           ["h"] = "<C-w>q",
  --           -- Expands the entry if possible.
  --           ["l"] = function()
  --             local menu = menu_utils.get_current()
  --             if not menu then
  --               return
  --             end
  --             local row = vim.api.nvim_win_get_cursor(menu.win)[1]
  --             local component = menu.entries[row]:first_clickable()
  --             if component then
  --               menu:click_on(component, nil, 1, "l")
  --             end
  --           end,
  --           ["q"] = close,
  --           ["<esc>"] = close,
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "leath-dub/snipe.nvim",
  --   config = function()
  --     local snipe = require("snipe")
  --     snipe.setup()
  --     vim.keymap.set("n", "gb", snipe.create_buffer_menu_toggler())
  --   end,
  -- },
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
