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

#########################################################
#install the neocomplete.vim-ver.2.1
#check the dir .vim in home path, if not exist, create it
if [ ! -d $HOME"/.vim" ];then
	mkdir $HOME/.vim
	echo "create the "$HOME"/.vim"
else
	#copy the neocomplete.vim-ver.2.1 to the home path
	cp -r ./neocomplete.vim-ver.2.1/*  $HOME/.vim/
	echo "install the neocomplete.vim-ver.2.1 done!"
fi


#############################################################
#add the vim config file
#check the file .vimrc in home path, if not exist, create it
if [ ! -f $HOME"/.vimrc" ];then
	echo "create the "$HOME"/.vimrc done"
	cat ./vimrc  >>  $HOME/.vimrc 
else
	#backup .vimrc
	config_file=$HOME"/.vimrc"
	timestamp=$(date +%s)
	file_backup=$HOME"/.vimrc"$timestamp
	mv $config_file  $file_backup

	#delete the old config content
   config_start="vim config by shi706734862@163.com start"
   config_end="vim config by shi706734862@163.com end"
   sed '/vim config by shi706734862@163.com start/,/vim config by shi706734862@163.com end/d' $file_backup > $config_file
	cat ./vimrc  >>  $config_file 

	echo "add the vim config done!"
fi
