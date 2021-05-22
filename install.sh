#!/bin/sh

pwd >> ~/status

date >> ~/status
echo "(dotfiles) starting ..." >> ~/status

# source the bashrc_patch from dotfiles
echo "" >> ~/.bashrc
echo "source ~/dotfiles/my_bashrc" >> ~/.bashrc

ln -s /workspaces/.codespaces/.persistedshare/dotfiles ~/dotfiles

mkdir -p ~/.local/bin

git config --global user.name bartr
git config --global user.email bartr@microsoft.com
git config --global core.whitespace blank-at-eol,blank-at-eof,space-before-tab
git config --global pull.rebase false
git config --global init.defaultbranch main
git config --global core.pager more
sudo git config --system credential.helper '!f() { sleep 1; echo "username=${GIT_COMMITTER_NAME}"; echo "password=${GITHUB_PAT}"; }; f'
git config --global url.https://github.com/bartr/.insteadOf b://
git config --global url.https://github.com/cloudatx/.insteadOf c://
git config --global url.https://github.com/.insteadOf g://
git config --global url.https://github.com/retaildevcrews/.insteadOf r://


echo "(dotfiles) Installing packages ..." >> ~/status

# install / update key apps
DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y --no-install-recommends apt-utils dialog curl git jq httpie bash-completion
DEBIAN_FRONTEND=dialog

echo "(dotfiles) Done" >> ~/status
date >> ~/status
