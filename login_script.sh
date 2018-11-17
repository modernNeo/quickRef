#!/bin/bash

export PS1="\$(date +\"%Y-%b-%d %r\") \u:\h\$(pwd)\n $ "

alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'

alias commands="~/$1/quickRef/commands.sh $1"