#!/bin/bash

export PS1="\d \A \u:\h\$(pwd) $"

alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'

alias commands='~/GitHub/quickRef/commands.sh'
. ~/GitHub/quickRef/install_and_setup_vim.sh
