ls = require("luasnip")
local t = ls.text_node

return {

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

}
