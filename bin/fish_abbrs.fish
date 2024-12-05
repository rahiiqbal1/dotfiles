abbr nvdriver -a cat /sys/module/nvidia/version
abbr rebuild -a sudo nixos-rebuild switch --flake ~/dotfiles/.config/nixos
abbr nd -a nix develop
abbr update -a sudo nix flake update
abbr lf -a lfcd
abbr sysconf -a cd ~/dotfiles/.config/nixos
abbr conf -a ~/dotfiles/.config/
abbr dot -a ~/dotfiles/
abbr bin -a ~/dotfiles/bin/
abbr doc -a ~/Documents/
abbr dwn -a ~/Downloads/
abbr cl -a clear
abbr vi -a nvim
abbr pv -a nvim .
abbr gs -a git status
abbr ga -a git add
abbr gaa -a git add -A
abbr gau -a git add -u
abbr gcm -a git commit
abbr gco -a git checkout
abbr gl -a git log
abbr gd -a git diff
abbr gr -a git restore
abbr gpsh -a git push
abbr gpl -a git pull
abbr grep -a rg
abbr --add dotdot --regex '^\.\.+$' --function multicd
