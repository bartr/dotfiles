#!/bin/sh

date >> ~/status
echo "(dotfiles) starting ..." >> ~/status

# source the bashrc_patch from dotfiles
echo "" >> ~/.bashrc
echo "source /workspaces/.codespaces/.persistedshare/dotfiles/my_bashrc" >> ~/.bashrc

mkdir -p ~/.local/bin

git config --global user.name bartr
git config --global user.email bartr@microsoft.com
git config --global core.whitespace blank-at-eol,blank-at-eof,space-before-tab
git config --global pull.rebase false
git config --global init.defaultbranch main
git config --global core.pager cat

echo "(dotfiles) Installing packages ..." >> ~/status
# install / update key apps
DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y --no-install-recommends apt-utils dialog nano curl git jq httpie bash-completion
DEBIAN_FRONTEND=dialog

echo "(dotfiles) Done" >> ~/status
date >> ~/status
