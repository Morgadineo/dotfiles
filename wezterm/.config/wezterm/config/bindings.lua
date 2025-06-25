local wezterm = require('wezterm')
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {
   SUPER = 'ALT', -- to not conflict with Windows key shortcuts
   SUPER_REV = 'ALT|CTRL',
}
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

      -- panes: zoom+close pane
      { key = 'Enter', mods = 'CTRL', action = act.TogglePaneZoomState },

      -- panes: navigation
      { key = 'k', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Up') },
      { key = 'j', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Down') },
      { key = 'h', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Left') },
      { key = 'l', mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Right') },

      {
         key = [[;]],
         mods = mod.SUPER,
         action = wezterm.action_callback(function(window, pane)
            -- Configuração para remover completamente o plano de fundo
            window:set_config_overrides({
               background = {
                  {
                     source = { Color = colors.background }, -- Usa a cor padrão
                     width = '100%',
                     height = '100%',
                     opacity = 1.0,
                  },
               },
            })
            -- Força o redesenho imediato
            window:perform_action(wezterm.action.ReloadConfiguration, pane)
         end),
      },

      {
         key = [[/]],
         mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _pane)
            backdrops:random(window)
         end),
      },
      {
         key = [[,]],
         mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _pane)
            backdrops:cycle_back(window)
         end),
      },
      {
         key = [[.]],
         mods = mod.SUPER,
         action = wezterm.action_callback(function(window, _pane)
            backdrops:cycle_forward(window)
         end),
      },
      {
         key = [[/]],
         mods = mod.SUPER_REV,
         action = act.InputSelector({
            title = 'InputSelector: Select Background',
            choices = backdrops:choices(),
            fuzzy = true,
            fuzzy_description = 'Select Background: ',
            action = wezterm.action_callback(function(window, _pane, idx)
               if not idx then
                  return
               end
               ---@diagnostic disable-next-line: param-type-mismatch
               backdrops:set_img(window, tonumber(idx))
            end),
         }),
      },
   },
}
