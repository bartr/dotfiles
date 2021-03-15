#!/bin/sh

date >> ~/status
echo "(dotfiles) starting ..." >> ~/status

# source the bashrc_patch from dotfiles
echo "" >> ~/status
echo "source ~/dotfiles/my_bashrc" >> ~/.bashrc

mkdir -p ~/.local/bin

sudo mkdir -p /etc/bash_completion.d
sudo cp ~/dotfiles/kubectl /etc/bash_completion.d

git config --global user.name bartr
git config --global user.email bartr@microsoft.com
git config --global core.whitespace blank-at-eol,blank-at-eof,space-before-tab
git config --global pull.rebase false
git config --global init.defaultbranch main
git config --global core.pager more

echo "(dotfiles) Installing packages ..." >> ~/status
# install / update key apps
DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y --no-install-recommends apt-utils dialog curl git jq httpie bash-completion
DEBIAN_FRONTEND=dialog

echo "(dotfiles) Done" >> ~/status
date >> ~/status
