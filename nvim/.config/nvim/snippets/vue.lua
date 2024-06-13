local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("fuga", t("Fuga!!!!")),
  s("hoge", t("hoge!!")),
}
