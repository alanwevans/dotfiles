# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Environment Variables
export AUTHOR="Alan Evans"
export EMAIL="AlanWEvans@gmail.com"
export EDITOR=vim
export VISUAL=vim

# Shell Options
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'

# Add $HOME/bin to PATH if it exists
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"

# pip install --user puts bins in ~/.local/bin
[ -d ~/.local/bin/ ] && export PATH=$PATH:~/.local/bin/

# gem install --user-install puts things in ~/.gem/ruby/1.8/bin
[ -d ~/.gem/ruby/1.8/bin/ ] && export PATH=$PATH:~/.gem/ruby/1.8/bin/

# Aliases
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# AWS Aliases
if tty &> /dev/null && which aws &> /dev/null && [ -f ~/.aws/config ] ; then
    for PROFILE in $(awk -F'[] ]' '/profile/ { print $(NF-1) }' ~/.aws/config) ; do
        alias aws-$PROFILE="aws --profile $PROFILE"
    done
fi

if [ -x /usr/bin/ssh-pageant ] ; then 
	eval $(/usr/bin/ssh-pageant -ra $TEMP/.ssh-pageant)
fi
export SSH_AUTH_SOCK

# Git dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
tty &> /dev/null && config fetch --dry-run --verbose origin

# Modified from company /etc/profile.d/default_prompt.sh
if tput colors &> /dev/null; then
    if [[ ${EUID} == 0 ]]; then
        PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;35m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    fi
else
    if [[ ${EUID} == 0 ]] ; then
    # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \W \$ '
    fi
fi

# If there is a local bashrc, source it
[ -r $HOME/.bashrc.local ] && source $HOME/.bashrc.local
