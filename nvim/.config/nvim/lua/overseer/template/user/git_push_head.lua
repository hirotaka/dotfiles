return {
  name = "git push HEAD",
  builder = function()
    return {
      cmd = { "git", "push", "-v", "origin", "HEAD" },
      components = { "default" },
    }
  end,
}
