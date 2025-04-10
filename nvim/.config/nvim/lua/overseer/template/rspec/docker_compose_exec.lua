--@type overseer.TaskDefinition
return {
  name = "docker compose exec web",
  params = function()
    local current_file = vim.fn.expand("%:p")
    local root_dir = require("lazyvim.util").root()
    local relative_path = root_dir and vim.fn.fnamemodify(current_file, ":~:." .. root_dir) or current_file

    return {
      dir = {
        type = "string",
        default = relative_path,
      },
    }
  end,
  builder = function(params)
    --@type overseer.TaskDefinition
    return {
      cmd = {
        "docker",
        "compose",
        "exec",
        "web",
        "bundle",
        "exec",
        "rspec",
        "--require",
        "./quickfix_formatter.rb",
        "--format",
        "QuickfixFormatter",
        params.dir,
      },
      components = {
        {
          "on_output_quickfix",
          open = true,
        },
        "default",
      },
    }
  end,
}
