if status is-interactive

    fish_vi_key_bindings
    bind -M insert \cf accept-autosuggestion
    bind -M insert \ef forward-word
    bind -M insert \cg expand-abbr

    starship init fish | source

    fzf --fish | source

    # theme_gruvbox dark medium

    function fish_greeting
    end

    source ~/dotfiles/bin/fish_abbrs.fish

end
