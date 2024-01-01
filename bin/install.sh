#!/bin/sh
# original script: https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh

set -e

DOTFILES=$HOME/.dotfiles
REPO=spyrrfun/.dotfiles
REMOTE=https://github.com/${REPO}.git
BRANCH=master

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

umask g-w, o-w
command_exists git || {
	error "git is not installed"
	exist 1
}

git clone --branch "$BRANCH" "$REMOTE" "$DOTFILES" ||  {
	error "git clone of dotfiles repo of spyrr, failed"
	exit 1
}

ln -s ${DOTFILES}/tmux.conf ~/.tmux.conf
#ln -s ${DOTFILES}/vimrc ~/.vimrc
ln -s ${DOTFILES}/nvim ${HOME}/.config/nvim

TARGET=$HOME/.zshrc
[ -f ${TARGET} ] && echo "\nsource ${DOTFILES}/zshrc" >> ${TARGET} || {
	error "zshrc does not exist"
	exit 1
}

