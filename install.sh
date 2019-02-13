#!/bin/bash
#====================================================
# Author: shi
# Create Date: 2019-02-11
# Description: 
#====================================================

########################################################
#vim,cscope,ctags install
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
targetDir="$HOME/.vim"
neocomplete="./neocomplete.vim-ver.2.1/*"
if [ ! -d $targetDir ];then
	mkdir $targetDir
	echo "create the $targetDir"
fi

#copy the neocomplete.vim-ver.2.1 to the home path
cp -r $neocomplete  $targetDir
echo "install the neocomplete.vim-ver.2.1 done!"


#############################################################
#add the vim config 
#check the file .vimrc in home path, if not exist, create it
targetFile="$HOME/.vimrc"
vim_config="./vimrc"
if [ ! -f $targetFile ];then
	cat  $vim_config  >>  $targetFile 
	echo "create the $targetFile done"
else
	#backup .vimrc
	timestamp=$(date +%s)
	file_backup="$HOME/.vimrc$timestamp"
	mv  $targetFile  $file_backup

	#delete the old config content
	config_start="vim config by shi706734862@163.com start"
	config_end="vim config by shi706734862@163.com end"
	sed  "/$config_start/,/$config_end/d" $file_backup > $targetFile
	cat  $vim_config  >>  $targetFile 

	echo "add the vim config done!"
fi
