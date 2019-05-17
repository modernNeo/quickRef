#!/bin/bash

export PS1="\$(date +\"%Y-%b-%d %r\") \u:\h\$(pwd)\n $ "

alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

alias vim="vim -c \"set clipboard=unnamedplus\""

alias commands="$DIR/commands.sh"
