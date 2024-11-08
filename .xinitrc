xrdb -merge ~/.Xresources
sxhkd -c $HOME/.config/sxhkd/sxhkdrc
setxkbmap -option caps:swapescape
exec bspwm
