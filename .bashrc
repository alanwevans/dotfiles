# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Environment Variables
export AUTHOR="Alan Evans"
export EMAIL="AlanWEvans@gmail.com"

# User specific aliases and functions
if [ -d $HOME/bin ] ; then
    export PATH="$PATH:$HOME/bin"
fi

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
