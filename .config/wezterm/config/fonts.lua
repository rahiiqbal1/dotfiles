local wezterm = require('wezterm')
local platform = require('utils.platform')

local font = 'JetBrainsMono Nerd Font'
local font_size = 11

return {
   font = wezterm.font(font),
   font_size = font_size,
   harfbuzz_features = {"calt=0", "clig=0", "liga=0"},

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
