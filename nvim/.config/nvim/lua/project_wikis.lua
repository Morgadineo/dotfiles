-------------------------------------------------------------------------------
-- Código de Mirko Vukušić para projetos locais no Vimwiki
-------------------------------------------------------------------------------

-- Configuração principal
local config = {
	projectsFolder = "/home/seu_usuario/projetos/", -- Caminho completo (sem ~)
	maxDepth = 3, -- Profundidade máxima de busca
	ignoreFolders = { "node_modules", ".git" }, -- Pastas ignoradas
	rootWikiFolder = "_wiki", -- Nome da pasta wiki em projetos
	wikiConfig = { syntax = "markdown", ext = ".md" }, -- Formato da wiki
}

-- Preserva a configuração original do Vimwiki
if vim.g.vimwiki_list == nil then
	error("VimWiki não carregado! Carregue o plugin antes deste script.")
else
	_G.vimwiki_list_orig = vim.fn.copy(vim.g.vimwiki_list) or {}
end

-- Atualiza a lista de wikis com as pastas encontradas
local function updateVimwikiList(folders)
	local new_list = vim.fn.copy(vimwiki_list_orig)
	for _, f in ipairs(folders) do
		table.insert(new_list, {
			path = config.projectsFolder .. f,
			syntax = config.wikiConfig.syntax,
			ext = config.wikiConfig.ext,
		})
	end
	vim.g.vimwiki_list = new_list
	vim.api.nvim_call_function("vimwiki#vars#init", {})
end

-- Substituição pessoal para buscar no diretório atual
local function searchForWikis()
	local cwd = vim.fn.getcwd()
	if vim.fn.isdirectory(cwd .. "/_wiki") == 1 then
		return { "_wiki" } -- Retorna a wiki local se existir
	end
	return {}
end

-- Atalho para abrir wikis via FZF (opcional)
function _G.ProjectWikiOpen(name)
	if not name then
		local wikis = searchForWikis()
		updateVimwikiList(wikis)
		for _, f in ipairs(vimwiki_list_orig) do
			table.insert(wikis, f.path)
		end
		vim.fn["fzf#run"]({
			source = wikis,
			sink = function(selected)
				ProjectWikiOpen(selected)
			end,
			options = "--ansi --reverse --no-preview",
		})
	else
		for i, v in ipairs(vim.g.vimwiki_list) do
			if v.path == name or v.path == config.projectsFolder .. name then
				vim.fn["vimwiki#base#goto_index"](i)
				return
			end
		end
		print("Erro: Wiki não encontrada.")
	end
end

-- Mapeamento de tecla (opcional)
vim.api.nvim_set_keymap("n", "<Leader>wp", ":lua ProjectWikiOpen()<CR>", { noremap = true })
