#!/bin/bash
#====================================================
# Author: shi
# Create Date: 2019-02-11
# Description: 
#====================================================
# Echo function
function my_echo(){
	if [ $# -le 1 ];
	then
		echo -e "\033[31m Error:my_echo [color] [info] \033[0m"
		return
	fi

	declare -A local color_list
	color_list=(["red"]="31" ["green"]="32" ["yellow"]="33" ["blue"]="34")

	local color=${color_list[$1]}
	echo -e "\033[${color}m$2\033[0m"
}

# Trap ctrl-c
trap "my_echo \"red\" \"\nbreak and exit\n\"; exit" INT

########################################################
# vim,cscope,ctags install
my_vim=vim-gtk
my_cs=cscope
my_tags=exuberant-ctags
my_rm=trash-cli

# install the vim-gtk
sudo apt-get install $my_vim

# install the cscope
sudo apt-get install $my_cs

# install the ctags
sudo apt-get install $my_tags

# install the trash-cli
sudo apt-get install $my_rm

#########################################################
# install the neocomplete.vim-ver.2.1
# check the dir .vim in home path, if not exist, create it
targetDir="$HOME/.vim"
neocomplete="./neocomplete.vim-ver.2.1/*"
lightline="./lightline.vim-master/*"
if [ ! -d $targetDir ];then
	mkdir $targetDir
fi

# copy the neocomplete.vim-ver.2.1 to the home path
cp -r $neocomplete  $targetDir
if [ $? -eq 0 ]; then
	my_echo "green" "install the neocomplete.vim-ver.2.1 done!"
fi

# copy the lightline to the home path
lightlineDIR="$targetDir/pack/plugins/start/lightline"
if [ ! -d "$lightlineDIR" ]; then
  mkdir -p "$lightlineDIR"
fi
cp -r $lightline  $lightlineDIR 
if [ $? -eq 0 ]; then
	my_echo "green" "install the lightline done!"
fi

#############################################################
# add the vim config 
# check the file .vimrc in home path, if not exist, create it
targetFile="$HOME/.vimrc"
my_config="./vimrc"
if [ ! -f $targetFile ];then
	cat  $my_config  >>  $targetFile 
else
	# backup .vimrc
	timestamp=$(date +%s)
	file_backup="$targetFile$timestamp"
	mv  $targetFile  $file_backup

	# delete the old config content
	config_start="vim config by shi706734862@163.com start"
	config_end="vim config by shi706734862@163.com end"
	sed  "/$config_start/,/$config_end/d" $file_backup > $targetFile
	cat  $my_config  >>  $targetFile 
fi

if [ $? -eq 0 ]; then
	my_echo "green" "add the vim config done!"
fi

###############################################################
# add shell command config
# check the file .bashrc in home path, if not exists, create it
targetFile="$HOME/.bashrc"
my_config="./bashrc"
if [ ! -f $targetFile ];then
	cat  $my_config  >>  $targetFile 
else
	# backup .bashrc
	timestamp=$(date +%s)
	file_backup="$targetFile$timestamp"
	mv  $targetFile  $file_backup

	# delete the old config content
	config_start="bash config by shi706734862@163.com start"
	config_end="bash config by shi706734862@163.com end"
	sed  "/$config_start/,/$config_end/d" $file_backup > $targetFile
	cat  $my_config  >>  $targetFile 
fi

if [ $? -eq 0 ]; then
	my_echo "green" "add the bash config done!"
	source $targetFile
fi
