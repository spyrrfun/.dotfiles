#!/bin/sh
# original script: https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh

set -e

ZSH=${ZSH:-~/.dotfiles}
REPO=${REPO:-spyrr/.dotfiles}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}


command_exists() {
	command -v "$@" > /dev/null 2>&1
}

umask g-w, o-w
command_exists git || {
	error "git is not installed"
	exist 1
}

git clone --branch "$BRANCH" "$REMOTE" "$ZSH" ||  {
	error "git clone of dotfiles repo of spyrr, failed"
	exit 1
}

ln -s ${ZSH}/tmux.conf ~/.tmux.conf
ln -s ${ZSH}/vimrc ~/.vimrc

TARGET=${TARGET:-~/.zshrc}
[ -f ${TARGET} ] && echo "\nsource ${ZSH}/zshrc" >> ${TARGET} || {
	error "zshrc does not exist"
	exit 1
}

