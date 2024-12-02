#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BASHRC_GREEN='\[\033[01;32m\]'
BASHRC_WHITE='\[\033[00m\]'
BASHRC_BLUE='\[\033[01;34m\]'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1_HOST="${BASHRC_GREEN}\u@\h"
PS1_SEP="${BASHRC_WHITE}:"
PS1_DIR="${BASHRC_BLUE}\W"
PS1_IN="${BASHRC_WHITE}\$"
PS1="${PS1_HOST}${PS1_SEP}${PS1_DIR}${PS1_IN} "

export EDITOR=nvim
ssh-start(){ eval "$(ssh-agent -s)"; }
ssh-add-key(){ ssh-add "$HOME/.ssh/$1"; }
