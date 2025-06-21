local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- Snippet simples
	s("hello", {
		t('print("Hello, "),'),
		t({ "", "print(" }),
		i(1, "world"),
		t(")"),
	}),

	-- Snippet com múltiplos placeholders
	s("for", {
		t("for "),
		i(1, "i"),
		t(" in range("),
		i(2, "n"),
		t("):"),
		t({ "", "    " }),
		i(0),
	}),
}
