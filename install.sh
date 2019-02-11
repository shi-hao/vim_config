#!/bin/bash
#====================================================
# Author: shi
# Create Date: 2019-02-11
# Description: 
#====================================================

my_vim=vim-gtk
my_cs=cscope
my_tags=exuberant-ctags

#install the vim-gtk
sudo apt-get install $my_vim

#install the cscope
sudo apt-get install $my_cs

#install the ctags
sudo apt-get install $my_tags


#check the dir .vim in home path, if not exist, create it
if [ ! -d $HOME"/.vim" ];then
	echo $HOME"/.vim not exist"
	mkdir $HOME/.vim
else
	echo $HOME"/.vim exist"
fi

#copy the neocomplete.vim-ver.2.1 to the home path
cp -r ./neocomplete.vim-ver.2.1/*  $HOME/.vim/

#check the file .vimrc in home path, if not exist, create it
if [ ! -f $HOME"/.vimrc" ];then
	echo $HOME"/.vimrc not exist"
	touch $HOME/.vimrc
else
	echo $HOME"/.vimrc exist"
fi

#add the vim config to the .vimrc
cat ./vimrc  >>  $HOME/.vimrc 
