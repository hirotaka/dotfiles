-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local word = vim.fn.expand("<cword>")
-- local command = "<cmd>:Telescope find_files<cr>"
--vim.keymap.set("n", "<leader>sF", command .. "'" .. word, { expr = true })

local map = LazyVim.safe_keymap_set

--  https://www.reddit.com/r/neovim/comments/1858n12/comment/kb08eun/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
map("n", "<Leader>xc", ":call setreg('+', expand('%:p:.'))<CR>", { desc = "Copy current file path" })
-- map("n", "<Leader>xc", ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>", opts)
-- map("n", "<Leader>xo", ":e <C-r>+<CR>", { noremap = true, desc = "Go to location in clipboard" })

--
-- vim.keymap.set(
--   "n",
--   "<leader>zr",
--   '<cmd>:!zellij run -d Down -n "testing" -- bundle exec rspec spec/services/access_creation_device_attributes_spec.rb<CR>'
-- )

-- https://github.com/haya14busa/vim-asterisk
local modes = { "n", "v", "o" }
for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "*", "<Plug>(asterisk-*)", { desc = "Search word under cursor" })
  vim.keymap.set(mode, "#", "<Plug>(asterisk-#)", { desc = "Search word under cursor backwards" })
  vim.keymap.set(mode, "g*", "<Plug>(asterisk-g*)", { desc = "Search word under cursor (partial)" })
  vim.keymap.set(mode, "g#", "<Plug>(asterisk-g#)", { desc = "Search word under cursor backwards (partial)" })
  vim.keymap.set(mode, "z*", "<Plug>(asterisk-z*)", { desc = "Search word under cursor (stay)" })
  vim.keymap.set(mode, "gz*", "<Plug>(asterisk-gz*)", { desc = "Search word under cursor (partial, stay)" })
  vim.keymap.set(mode, "z#", "<Plug>(asterisk-z#)", { desc = "Search word under cursor backwards (stay)" })
  vim.keymap.set(mode, "gz#", "<Plug>(asterisk-gz#)", { desc = "Search word under cursor backwards (partial, stay)" })
end
vim.g["asterisk#keeppos"] = 1
