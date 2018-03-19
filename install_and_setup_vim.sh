#!/bin/bash -e
set -e

setup_vimrc (){
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
      echo "Setting up the desert colorscheme as the default colorscheme for vim"
      echo "colorscheme desert" >> ~/.vimrc
    fi
  else
    echo "Setting up the desert colorscheme as the default colorscheme for vim"
    echo "colorscheme desert" >> ~/.vimrc
  fi
}

vimBinPath=`which vim`
if [ ${#vimBinPath} -eq 0 ]; then
  echo "vim is not installed, would you like to install it? [Y/n]"
  read option
  while [ "$option" != "Y" -a "$option" != "y" -a "$option" != "N" -a "$option" != "n" ]
  do
    echo "Incorrect input detected, please try again"
    echo "vim is not installed, would you like to install it? [Y/n]"
    read option
  done
  if [ "$option" = "y" -o "$option" = "y" ]; then
  ## detect OS and install
    OS=`uname -s`
    if [ "$OS" = "Darwin" ]; then
      echo "this appears to be a Mac, now attempting to install VIM with brew"
      brew install vim
      exitCode=`echo $?`
      if [ $exitCode -ne 0 ]; then
        echo "the install command did not appear to work correctly, please investigate further"
      else
        echo "vim successfully installed!"
        setup_vimrc
        alias vi='vim'
      fi
    fi
  fi
else
  setup_vimrc
  alias vi='vim'
fi