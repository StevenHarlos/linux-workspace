#!/bin/sh

PWD=`pwd`

replacify() {
  SOURCE=$1
  TARGET=$2
  if [ -L "$TARGET" ]; then
    echo "Skipping $TARGET..."  
  else
    if [ -e "$TARGET" ]; then
      echo "Backing up $TARGET..."  
      mv -f "$TARGET" "${TARGET}.bak"
    fi
    echo "Installing $TARGET..."
    mkdir -p `dirname "$TARGET"`
    ln -s "$PWD/$SOURCE" "$TARGET"
  fi
}

if [ ! -e ~/.bashrc ]; then
  echo "No ~/.bashrc found, cannot install bash_profile.";
else
  echo "if [ -f ~/.bash_profile ]; then source ~/.bash_profile; fi" >> ~/.bashrc
fi

replacify profile/bash_profile ~/.bash_profile
replacify profile/vimrc ~/.vimrc
replacify profile/gitconfig ~/.gitconfig
replacify profile/atom/config.cson ~/.atom/config.cson
replacify bin ~/bin 
