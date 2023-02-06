local ls = require("luasnip")
local t = ls.text_node

return {

require("luasnip").snippet(
    { trig = "test" },
    { t("test in html") }
  ),

}
