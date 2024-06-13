-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set(
  "n",
  "<leader>zr",
  '<cmd>:!zellij run -d Down -n "testing" -- bundle exec rspec spec/services/access_creation_device_attributes_spec.rb<CR>'
)

local word = vim.fn.expand("<cword>")
local command = "<cmd>:Telescope find_files<cr>"
--vim.keymap.set("n", "<leader>sF", command .. "'" .. word, { expr = true })
