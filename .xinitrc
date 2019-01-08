#xrdb -merge ~/.Xresources
#exec i3
numlockx &
(conky | while read LINE; do xsetroot -name "$LINE"; done) &
exec dwm
