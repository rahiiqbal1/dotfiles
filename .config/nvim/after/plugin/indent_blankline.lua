local config = {
    scope = {
        show_start = false,
        show_end = false
    }
}

require("ibl").setup(config)

local hooks = require "ibl.hooks"
hooks.register(
    hooks.type.WHITESPACE,
    hooks.builtin.hide_first_space_indent_level
)
