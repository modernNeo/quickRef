#!/bin/bash

#function for setting up vimrc with:
#   desert colorscheme
setup_vimrc (){
  if [ -e ~/.vimrc ]; then

    my_array=()
    while IFS= read -r line; do
      my_array+=( "$line" )
    done < <( cat ~/.vimrc )
    alreadyThere=true
    for index in `seq 0 ${#my_array[@]}`;
    do
      index="$(echo -e "${index}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
      if [ "${my_array[index]}" = "colorscheme desert" ]; then
        alreadyThere=false
      fi
    done
    if [ $alreadyThere == true ]; then
      echo "Setting up the desert colorscheme as the default colorscheme for vim"
      echo "colorscheme desert" >> ~/.vimrc
      echo "set clipboard=unnamedplus" >> ~/.vimrc
    fi
  else
    echo "Setting up the desert colorscheme as the default colorscheme for vim"
    echo "colorscheme desert" >> ~/.vimrc
    echo "set clipboard=unnamedplus" >> ~/.vimrc
  fi


  editor=`ll /etc/alternatives/editor | awk '{ print $11 }'`
  if [ $editor != "/usr/bin/vim.basic" ]; then
    echo "updating editor to vim"
    sudo update-alternatives --set editor /usr/bin/vim
  fi
}

install_vim(){
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
      elif [ "$OS"  = "Linux" ]; then
        echo "this appears to be a Linux system, now attemptingto install VIM"
        sudo apt-get install -y vim
        exitCode=`echo $?`
      fi
      if [ $exitCode -ne 0 ]; then
        echo "the install command did not appear to work correctly, please investigate further"
        exit 1
      else
        echo "vim successfully installed!"
      fi
    fi 
  fi
}

setup_default_editor(){
  VIM=`which vim`.basic
  update-alternatives --set editor $VIM
}

if [ `echo $UID` -ne 0 ]; then
  echo "you are not a user with root privelages.....quiting script"
  exit 1
fi

install_vim
setup_vimrc
setup_default_editor
alias vi='vim'
