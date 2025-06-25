local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Função para obter a data atual
local date = function()
	return os.date("%d/%m/%Y")
end

-- Função para obter a hora atual
local time = function()
	return os.date("%H:%M:%S")
end

ls.add_snippets("cpp", { -- ou o filetype correto para seu caso

	-- My main function def
	s("mai", {
		t({ "int main(void)", "{", "\t" }),
		i(1),
		t({ "", "\treturn 0;", "}", "" }),
	}),

	-- Header for Programming Marathon exercises
	s("prob", {
		t({ "/*", "* Problema Online", "* ---------------", "* Problema  : " }),
		i(1, "nome do problema"),
		t({ "", "* Plataforma: " }),
		i(2, "nome da plataforma"),
		t({ "", "*", "* Data         : " }),
		f(date, {}),
		t({ "", "* Hora inicial : " }),
		f(time, {}),
		t({ "", "* Hora de envio: " }),
		i(3),
		t({ "", "*", "* Dificuldade: " }),
		i(4),
		t({ "", "* Categoria  : " }),
		i(5),
		t({ "", "* Tipo       : " }),
		i(6),
		t({ "", "**/" }),
	}),
})
