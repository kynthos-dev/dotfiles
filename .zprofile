#
# ~/.zprofile
#
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules


[[ -f ~/.zshrc ]] && . ~/.zshrc

# Start x-server
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
##################################################
# Start x-server
#if [[ "$(tty)" = "/dev/tty1" ]]; then
#	pgrep dwm || startx
#fi
##################################################
