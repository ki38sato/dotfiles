#!/bin/bash -x

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# setup files
if [ -e $HOME/.zshrc ]; then
  mv $HOME/.zshrc $HOME/.zshrc.bak
fi
cp .zshrc $HOME/.zshrc

if [ -e $HOME/.tmux.conf ]; then
  mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
cp .tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/ref/src $HOME/dev/src $HOME/dev/docker_home

if [ -f $HOME/.gitconfig ]; then
  :
else
  git config --global --add ghq.root $HOME/ref/src
  git config --global --add ghq.root $HOME/dev/src
fi

cp docker_home/* $HOME/dev/docker_home

# setup Atom packages
apm install --packages-file atom_packages.txt
