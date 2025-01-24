return {
  {
    "neovim/nvim-lspconfig",
    -- https://github.com/LazyVim/LazyVim/discussions/520
    opts = {
      servers = {
        cssls = { settings = { css = { lint = { unknownAtRules = "ignore" } } } },
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   init = function()
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     keys[#keys + 1] = { "<leader>cR", "<cmd>LspRestart<cr>", desc = "Lsp Restart" }
  --   end,
  -- opts = {
  --   servers = {
  --     cssls = {
  --       settings = {
  --         css = {
  --           validate = false,
  --           lint = { unknownAtRules = "ignore" },
  --           customData = {
  --             "~/.config/nvim/lua/config/tailwind.json",
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  -- },
}
