
local options = {
   default_prog = {},
   launch_menu = {},
}

options.default_prog = { 'bash' }
options.launch_menu = {
  { label = 'Bash', args = { 'bash' } },
  { label = 'Fish', args = { 'fish' } },
  { label = 'Zsh', args = { 'zsh' } },
}

return options
