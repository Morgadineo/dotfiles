local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local date = function()
	return os.date("%d/%m/%Y")
end

-- Função para obter a hora atual
local time = function()
	return os.date("%H:%M:%S")
end
