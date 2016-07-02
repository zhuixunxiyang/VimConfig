#!/bin/bash

VIM_CONFIG_HOME=~/.vim
VIM_CONFIG_DIRS=($(ls $(pwd)))

if [ -z $(which vim) ]; then
	echo "installing VIM..."
	sudo apt-get install vim
else
	echo "VIM is already installed on this computer"
fi

if [ -d $VIM_CONFIG_HOME ]; then
	echo "VIM config directory [$VIM_CONFIG_HOME] exists, skip creating it."
else
	mkdir $VIM_CONFIG_HOME
fi

if [ -z $(which ctags) ]; then
	echo "installing ctags..."
	sudo apt-get install ctags
else
	echo "ctags is already installed on this computer."
fi

# copy directories and files into VIM_CONFIG_HOME
for sub_dir in ${VIM_CONFIG_DIRS[@]}; do
	if [ "$sub_dir" == ".git" ]; then
		echo "ignore .git"
		continue
	fi

	if [ -d ./$sub_dir ]; then
		echo "start to copy $sub_dir"
		cp -r ./$sub_dir $VIM_CONFIG_HOME/
	else
		echo "$sub_dir is not a configuration file for VIM, skipping it."
	fi
done

if [ -f ./.vimrc ]; then
	echo "start to copy .vimrc file"
	cp ./.vimrc ~/
fi

echo done.

