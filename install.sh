#!/bin/sh

PWD=`pwd`

if [ ! -e ~/.bashrc ]; then
  echo "No ~/.bashrc found, cannot install bash_profile.";
elif [ -e ~/.bash_profile ]; then
  echo "Profile already installed."  
else
  echo "Installing profile..."
  ln -s $PWD/profile/bash_profile ~/.bash_profile
  echo "if [ -f ~/.bash_profile ]; then source ~/.bash_profile fi" >> ~/.bashrc
fi

