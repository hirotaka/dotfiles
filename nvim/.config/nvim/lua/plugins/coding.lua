-- local rails_alternative_targets = {
--   { context = "model", target = "/app/models/%1.rb", transformer = "singularize" },
--   { context = "controller", target = "/app/controllers/**/%1_controller.rb" },
--   { context = "view", target = "/app/views/%1/*.html*" },
--   { context = "view", target = "/app/views/%1/*.html*", transformer = "singularize" },
--   { context = "channel", target = "/app/channels/**/%1_channel.rb" },
--   { context = "mailer", target = "/app/mailers/%1_mailer.rb" },
--   { context = "serializer", target = "/app/serializers/%1_serializer.rb" },
--   { context = "mailer", target = "/app/mailers/%1_mailer.rb" },
--   { context = "service", target = "/app/services/%1_service.rb" },
--   { context = "worker", target = "/app/workers/**/%1_worker.rb" },
--   { context = "factories", target = "/spec/factories/%1.rb", transformer = "pluralize" },
-- }
--
return {
  {
    "neovim/nvim-lspconfig",
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { " /Users/hirotaka/.local/share/mise/shims/ruby-lsp" },
      },
    },
    opts = function(_, opts)
      local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
      opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, res, ...)
            local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
            if string.match(file_name, "^%.env") == nil then
              return on_publish_diagnostics(err, res, ...)
            end
          end,
        },
      })
      opts.inlay_hints = { enabled = false }
    end,
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = "/Users/hirotaka/.local/share/mise/installs/node/20.15/bin/node",
    },
  },
  -- {
  --   "rgroli/other.nvim",
  --   cmd = { "Other", "OtherClear", "OtherSplit", "OtherVSplit" },
  --   opts = {
  --     mappings = {
  --       "rails",
  --
  --       -- Additional rails mappings
  --       {
  --         pattern = "/(.*)/%+(.*).svelte$",
  --         target = rails_alternative_targets,
  --       },
  --       {
  --         pattern = "/spec/lib/tasks/(.*)_spec.rb",
  --         target = {
  --           { context = "task", target = "/lib/tasks/%1.rake" },
  --         },
  --       },
  --       {
  --         pattern = "/lib/tasks/(.*).rake",
  --         target = {
  --           { context = "test", target = "/spec/lib/tasks/%1_spec.rb" },
  --         },
  --       },
  --       {
  --         pattern = "/spec/requests/api/(.*)/.*_spec.rb",
  --         target = {
  --           { context = "controller", target = "/app/controllers/api/%1_controller.rb" },
  --         },
  --       },
  --     },
  --   },
  --   config = function(_, opt)
  --     require("other-nvim").setup(opt)
  --   end,
  --   keys = {
  --     { "goo", "<cmd>Other<cr>", desc = "Open other files" },
  --     { "gov", "<cmd>OtherVSplit<cr>", desc = "Open other files in a vertical split" },
  --   },
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
  --       ["<M-CR>"] = function(fallback)
  --         cmp.abort()
  --         fallback()
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   build = (not jit.os:find("Windows"))
  --       and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
  --     or nil,
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --     config = function()
  --       require("luasnip.loaders.from_vscode").lazy_load()
  --     end,
  --   },
  --   opts = {
  --     history = true,
  --     delete_check_events = "TextChanged",
  --   },
  --   config = function()
  --     require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/snippets/" } })
  --   end,
  --   -- stylua: ignore
  --   keys = {
  --     {
  --       "<tab>",
  --       function()
  --         return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
  --       end,
  --       expr = true, silent = true, mode = "i",
  --     },
  --     {
  --       "<tab>",
  --       function() require("luasnip").jump(1) end,
  --       mode = "s"
  --     },
  --     {
  --       "<s-tab>",
  --       function() require("luasnip").jump(-1) end,
  --       mode = { "i", "s" }
  --     },
  --     -- {
  --     --   "<leader>cs",
  --     --   function() require("luasnip.loaders").edit_snippet_files({}) end,
  --     --   desc = "Edit Snippets"
  --     -- }
  --   },
  -- },
}
