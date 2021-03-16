#!/bin/sh

date >> /home/codespace/status
echo "(dotfiles) starting ..." >> /home/codespace/status

# source the bashrc_patch from dotfiles
echo "" >> /home/codespace/.bashrc
echo "source /home/codespace/dotfiles/my_bashrc" >> /home/codespace/.bashrc

mkdir -p /home/codespace/.local/bin

sudo mkdir -p /etc/bash_completion.d
#sudo cp /home/codespace/dotfiles/kubectl /etc/bash_completion.d

#git config --global user.name bartr
#git config --global user.email bartr@microsoft.com
#git config --global core.whitespace blank-at-eol,blank-at-eof,space-before-tab
#git config --global pull.rebase false
#git config --global init.defaultbranch main
#git config --global core.pager more

#echo "(dotfiles) Installing packages ..." >> /home/codespace/status

# install / update key apps
DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y --no-install-recommends apt-utils dialog curl git jq httpie bash-completion
DEBIAN_FRONTEND=dialog

echo "(dotfiles) Done" >> /home/codespace/status
date >> /home/codespace/status
pwd >> /home/codespace/status
