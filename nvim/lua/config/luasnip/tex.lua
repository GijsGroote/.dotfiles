-- For some reason .tex files are not detected with this file here, 26 nov 2022 Gijs Groote
local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

  s({trig="sym", dscr="Expands 'sym' into '\\gls{}'"},
  {
    t("\\gls{"),
    i(1),
    t("}"),
  }
  ),
  s({trig="ac", dscr="Expands 'ac' into '\\ac{}'"},
  {
    t("\\ac{"),
    i(1),
    t("}"),
    i(2),
  }
  ),
  s(
  {
    trig="ci",
    dscr="citation shortcut",
    regTrig=false,
    priority=100,
  },
  {
    t("\\cite{"), -- remember: backslashes need to be escaped
    i(1),
    t("}"),
  }
  ),
  s({trig="mit", dscr="Expands 'mit' into '\\mathit{}'"},
  {
    t("\\mathit{"),
    i(1),
    t("}"),
  }
  ),
  s({trig="it", dscr="Expands 'it' into '\textit{}'"},
  {
    t("\\textit{"),
    i(1),
    t("}"),
  }
  ),
  s({trig="tb", dscr="Expands 'tb' into '\textbf{}'"},
  {
    t("\\textbf{"),
    i(1),
    t("}"),
  }
  ),

  s({trig="todo", dscr="Expands 'todo' into '\todo{}'"},
  {
    t("\\todo{"),
    i(1),
    t("}")
  }
  ),
  -- create figure environment
  s({trig="fig"},
  {
    t({"\\begin{figure}[H]",
    "    \\centering",
    "    \\includegraphics[width=5cm]{figures/}",
    "    \\caption{}%",
    "    \\label{}",
    "\\end{figure}"
  }),
}
),

-- create environment
s({trig="env", dscr="create a new environmennt"},
fmta(
[[
\begin{<>}
<>
\end{<>}
]],
{
  i(1),
  i(2),
  rep(1),
}
),
{condition = line_begin}
),

s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
{
  t("\\frac{"),
  i(1),  -- insert node 1
  t("}{"),
  i(2),  -- insert node 2
  t("}")
}
),

s({trig="subfig", dscr="Expands 'subfig' into a subfigure environment"},
t({"\\begin{figure}[H]",
"    \\centering",
"    \\begin{subfigure}{.49\\textwidth}",
"    \\centering",
"    \\includegraphics[width=0.8\\textwidth]{}",
"    \\caption{}%",
"    \\label{subfig:}",
"    \\end{subfigure}",
"    \\hfill",
"",
"    \\begin{subfigure}{.49\\textwidth}",
"    \\centering",
"    \\includegraphics[width=0.8\\textwidth]{}",
"    \\caption{}%",
"    \\label{subfig:}",
"    \\end{subfigure}",
"    \\caption{}",
"    \\label{fig:}",
"\\end{figure}"
})
),

s({trig="table", dscr="Expands 'table' into a table environment"},
t({"\\begin{table}[H]",
"    \\centering",
"    \\begin{tabular}%",
"    {>{\\raggedright\\arraybackslash}p{0.25\\textwidth}%",
"    >{\\raggedright\\arraybackslash}p{0.65\\textwidth}}",
"      some & thing \\\\",
"    \\end{tabular}",
"    \\caption{}%",
"    \\label{}",
"\\end{table}",
})
),



s({trig="ref", dscr="Expands 'ref' into '\\Cref{}'"},
{
  t("\\Cref{"),
  i(1),
  t("}"),
}
),
}

