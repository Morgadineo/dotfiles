local wezterm = require('wezterm')
local act = wezterm.action

return {
   -- Atalhos básicos de terminal (padrão)
   keys = {
      -- Ctrl+Shift+C: Copiar (forçado)
      { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
      -- Ctrl+Shift+V: Colar (forçado)
      { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },
      -- Ctrl+Z: Suspender processo
      { key = 'z', mods = 'CTRL', action = act.SendKey({ key = 'z', mods = 'CTRL' }) },
      -- Ctrl+L: Limpar tela (equivalente ao 'clear')
      { key = 'l', mods = 'CTRL', action = act.ClearScrollback('ScrollbackOnly') },
      -- Ctrl+D: Enviar EOF (fechar terminal se linha estiver vazia)
      { key = 'd', mods = 'CTRL', action = act.SendKey({ key = 'd', mods = 'CTRL' }) },
      -- Ctrl+A: Início da linha (compatível com Bash/Zsh)
      { key = 'a', mods = 'CTRL', action = act.SendKey({ key = 'a', mods = 'CTRL' }) },
      -- Ctrl+E: Fim da linha
      { key = 'e', mods = 'CTRL', action = act.SendKey({ key = 'e', mods = 'CTRL' }) },
      -- Ctrl+W: Apagar palavra anterior
      { key = 'w', mods = 'CTRL', action = act.SendKey({ key = 'w', mods = 'CTRL' }) },
      -- Ctrl+U: Apagar até o início da linha
      { key = 'u', mods = 'CTRL', action = act.SendKey({ key = 'u', mods = 'CTRL' }) },
      -- Ctrl+K: Apagar até o fim da linha
      { key = 'k', mods = 'CTRL', action = act.SendKey({ key = 'k', mods = 'CTRL' }) },
      -- Ctrl+T: Trocar caracteres (compatível com shells)
      { key = 't', mods = 'CTRL', action = act.SendKey({ key = 't', mods = 'CTRL' }) },
      -- Página para cima/baixo (rolagem)
      { key = 'PageUp', mods = 'NONE', action = act.ScrollByPage(-1) },
      { key = 'PageDown', mods = 'NONE', action = act.ScrollByPage(1) },
   },

   -- Desativa atalhos personalizados do wezterm-config (se houver)
   disable_default_key_bindings = false,
}
