#!/bin/bash

ROOT=$HOME/dotfiles

cd $ROOT

if [[ $PWD != "$HOME/dotfiles" ]]; then
	echo \~/dotfiles not found!
	exit 1
fi

mkdir backup &>/dev/null

# backup current files
cp --backup=t -v ~/.vimrc backup/.vimrc 2>/dev/null
cp --backup=t -v ~/.bashrc backup/.bashrc 2>/dev/null
cp --backup=t -v ~/.bash_aliases backup/.bash_aliases 2>/dev/null
cp --backup=t -v ~/.profile backup/.profile 2>/dev/null
cp --backup=t -v ~/.tmux.conf backup/.tmux.conf 2>/dev/null
cp -r --backup=t -v ~/bin backup/bin 2>/dev/null

# remove current files
rm ~/.vimrc ~/.bashrc ~/.bash_aliases ~/.profile ~/.tmux.conf
rm -rf ~/bin

# create symlinks
ln -s dotfiles/.vimrc ~/.vimrc
ln -s dotfiles/.bashrc ~/.bashrc
ln -s dotfiles/.bash_aliases ~/.bash_aliases
ln -s dotfiles/.profile ~/.profile
ln -s dotfiles/.tmux.conf ~/.tmux.conf
ln -s dotfiles/bin ~/bin


