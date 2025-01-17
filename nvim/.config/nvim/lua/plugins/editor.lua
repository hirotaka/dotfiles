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
    },
  },
}
