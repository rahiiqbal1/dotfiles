if status is-interactive

    fish_vi_key_bindings
    bind -M insert \cf accept-autosuggestion
    bind -M insert \ef forward-word

    starship init fish | source

    # theme_gruvbox dark medium

    function fish_greeting
    end

    source ~/dotfiles/bin/fish_abbrs.fish

end
