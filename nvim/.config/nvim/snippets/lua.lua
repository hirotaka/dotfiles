local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("ctrig", t("also loaded!!")),
  s("hoge", t("hoge!!")),
}, {
  s("autotrig", t("autotriggered, if enabled")),
}
