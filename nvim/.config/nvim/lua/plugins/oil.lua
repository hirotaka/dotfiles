local fd_oil = function()
  require("fzf-lua").fzf_exec("fd --type=directory", {
    prompt = "Dir❯ ",
    actions = {
      ["default"] = function(selected, _)
        require("oil").open_float(selected[1])
      end,
    },
  })
end

return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>fo", "<cmd>Oil --float<CR>", desc = "Open oil" },
      { "<leader>fd", fd_oil, desc = "Open oil with dir" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 5,
      },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "ibhagwan/fzf-lua",
    },
  },
}
