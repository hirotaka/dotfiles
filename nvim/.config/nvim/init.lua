-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension
else
  if vim.g.neovide then
    vim.o.guifont = "PlemolJP35 Console NF:h13"
    vim.g.neovide_transparency = 0.8
  end
  require("config.lazy")
end
