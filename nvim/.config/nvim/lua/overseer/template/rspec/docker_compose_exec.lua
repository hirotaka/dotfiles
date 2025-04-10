--@type overseer.TaskDefinition
return {
  name = "docker compose exec web",
  params = function()
    return {
      dir = {
        type = "string",
        default = "spec/requests/api/admin",
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
        "--format",
        "RSpec::Core::Formatters::FailureListFormatter",
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
