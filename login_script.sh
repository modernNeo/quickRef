export PS1="\d \A \u:\h\$(pwd) $"
alias ll='ls -l'
alias la='ls -la'
alias l='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'
alias vi='vim'

cd ~/GitHub/quickRef
dir=`pwd`
alias commands='$dir/commands.sh'
cd ~/
if [ -e ~/.vimrc ]; then

  my_array=()
  while IFS= read -r line; do
    my_array+=( "$line" )
  done < <( cat ~/.vimrc )
  alreadyThere=true
  for index in `seq 0 ${#my_array[@]}`;
  do
    if [ "${my_array[index]}" = "colorscheme desert" ]; then
      alreadyThere=false
    fi
  done
  if [ $alreadyThere == true ]; then
    echo "colorscheme desert" >> ~/.vimrc
  fi
else
  echo "colorscheme desert" >> ~/.vimrc
fi