setxkbmap -option caps:swapescape &
xmodmap -e "pointer = 3 2 1" &
xrdb -merge ~/.Xresources &
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
