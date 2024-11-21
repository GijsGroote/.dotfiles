local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s({trig="mama", dscr="Expands python yo MAMA"},
  {
    t({"def MAMA():",
    "    pass",
    "",
    "if __name__ == '__main__':",
    "    main()",
    })
  }),

  s({trig="main", dscr="Expands python main function"},
  {
    t({"def main():",
    "    pass",
    "",
    "if __name__ == '__main__':",
    "    main()",
    })
  }),


  s({trig="pr", dscr="Expands 'pr' into 'print(f'')'"},
  {
    t('print(f"'),
    i(1),
    t('")'),
  }
  ),

  s({trig="class", dscr="Expands 'class' into dummy class"},
  {
    t("class "),
    i(1, "ClassName"),
    t(":"),
    t({"",
    "",
    "    def __init__(self):",
    "        pass",
    "",
    "    def dummy_method(self):",
    "        pass"}),
  }),


}
