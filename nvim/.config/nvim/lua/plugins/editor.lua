return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fz",
        function()
          Snacks.picker.zoxide()
        end,
        desc = "Zoxide",
      },
      {
        "<leader>fs",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart",
      },
    },
    opts = {
      picker = {
        win = {
          input = {
            -- avoid conflict with zellij
            keys = {
              -- ["<a-s-i>"] = { "toggle_ignored", mode = { "i", "n" } },
              ["<a-s-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            },
          },
        },
      },
    },
  },
  {
    "jedrzejboczar/exrc.nvim",
    dependencies = { "neovim/nvim-lspconfig" }, -- (optional)
    config = true,
  },
}
