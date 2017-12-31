export PS1="\d \A \u:\$(pwd) $"
alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'
alias vi='vim'

cd GitHub/quickRef
dir=`pwd`
alias commands='$dir/commands.sh'
cd ~/
echo "colorscheme desert" >> ~/.vimrc
