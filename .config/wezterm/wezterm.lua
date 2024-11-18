local wezterm = require "wezterm"

local config = wezterm.config_builder()

config.automatically_reload_config = true

config.animation_fps = 60
config.max_fps = 144
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13

-- Window:
config.enable_scroll_bar = true
config.enable_tab_bar = false
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}
config.window_decorations = "RESIZE"

-- Bindings:
local act = wezterm.action
local mod = {}
mod.SUPER = "ALT"
mod.SUPER_REV = "ALT|CTRL"
local keys = {
   -- Toggle fullscreen.
   { key = "F11", mods = "NONE",      action = act.ToggleFullScreen },
   -- copy/paste --
   { key = 'c', mods = 'CTRL|SHIFT',  action = act.CopyTo('Clipboard') },
   { key = 'v', mods = 'CTRL|SHIFT',  action = act.PasteFrom('Clipboard') },
      -- spawn windows
   { key = 'n', mods = mod.SUPER,     action = act.SpawnWindow },
   -- panes: split panes
   {
      key = [[\]],
      mods = mod.SUPER,
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
   },
   {
      key = [[\]],
      mods = mod.SUPER_REV,
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
   },
   -- panes: zoom+close pane
   { key = 'Enter', mods = mod.SUPER,     action = act.TogglePaneZoomState },
   { key = 'w',     mods = mod.SUPER,     action = act.CloseCurrentPane({ confirm = false }) },
   -- panes: navigation
   { key = 'k',     mods = mod.SUPER, action = act.ActivatePaneDirection('Up') },
   { key = 'j',     mods = mod.SUPER, action = act.ActivatePaneDirection('Down') },
   { key = 'h',     mods = mod.SUPER, action = act.ActivatePaneDirection('Left') },
   { key = 'l',     mods = mod.SUPER, action = act.ActivatePaneDirection('Right') },
   {
      key = 'p',
      mods = mod.SUPER_REV,
      action = act.PaneSelect({ alphabet = '1234567890', mode = 'SwapWithActiveKeepFocus' }),
   },
   -- resizes fonts
   {
      key = 'f',
      mods = 'LEADER',
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- resize panes
   {
      key = 'F1',
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
}
local key_tables = {
   resize_font = {
      { key = 'k',      action = act.IncreaseFontSize },
      { key = 'j',      action = act.DecreaseFontSize },
      { key = 'r',      action = act.ResetFontSize },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
   resize_pane = {
      { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'q',      action = 'PopKeyTable' },
   },
}
local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
}
config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = mod.SUPER_REV }
config.keys = keys
config.key_tables = key_tables
config.mouse_bindings = mouse_bindings

config.scrollback_lines = 5000

config.hyperlink_rules = {
          -- Matches: a URL in parens: (URL)
    {
       regex = '\\((\\w+://\\S+)\\)',
       format = '$1',
       highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
       regex = '\\[(\\w+://\\S+)\\]',
       format = '$1',
       highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
       regex = '\\{(\\w+://\\S+)\\}',
       format = '$1',
       highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
       regex = '<(\\w+://\\S+)>',
       format = '$1',
       highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
       regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
       format = '$0',
    },
    -- implicit mailto link
    {
       regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
       format = 'mailto:$0',
    },
}

return config
