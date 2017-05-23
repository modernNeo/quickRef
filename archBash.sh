#!/bin/bash
cd GitHub/quickRef

for my arch
PS1="\d \A \u:\h\$(pwd) $"
alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'
alias vi='vim'
dir=`pwd`
alias commands='$dir/commands.sh'
###ONLY FOR ANKLR FOR CMPT 397
export CLASSPATH=".:/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'
###
cd ~/
