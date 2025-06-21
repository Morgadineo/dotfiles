local ls = require("luasnip")
local types = require("luasnip.util.types")

-- Configuração básica (opcional)
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
	},
})

-- Carrega friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Carrega snippets pessoais
require("luasnip.loaders.from_lua").load({ paths = { "./lua/snippets" } })

-- Atalhos (opcional)
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
