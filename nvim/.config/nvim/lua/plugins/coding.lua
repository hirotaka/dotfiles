return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = "/Users/hirotaka/.asdf/installs/nodejs/18.16.0/bin/node",
    },
  },
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
