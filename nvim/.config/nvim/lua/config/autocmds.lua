-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "fish" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

-- Disble spell for markdown files
-- https://github.com/LazyVim/LazyVim/discussions/1470#discussioncomment-7057486
vim.api.nvim_create_augroup("lazyvim_wrap_spell", { clear = true })

-- https://github.com/folke/lazy.nvim/issues/702#issuecomment-1749878838
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("autoupdate"),
  callback = function()
    require("lazy").update({
      show = false,
    })
  end,
})

-- https://github.com/LazyVim/LazyVim/issues/4509#issuecomment-2431509475
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function(ev)
    vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = ev.buf, nowait = true })
  end,
})
