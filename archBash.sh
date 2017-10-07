#!/bin/bash
cd ~/GitHub/quickRef

PS1="\d \A \u:\h\$(pwd) $"
alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'
alias vi='vim'
dir=`pwd`
alias commands='$dir/commands.sh'
cd ~/
