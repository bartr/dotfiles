#!/bin/sh

# mount dotfiles at $HOME/dotfiles
ln -s /workspaces/.codespaces/.persistedshare/dotfiles $HOME/dotfiles

# source the bashrc_patch from dotfiles
echo "" >> ~/.bashrc
echo "source ~/dotfiles/my_bashrc" >> ~/.bashrc

# make the dir if it doesn't exist
mkdir -p ~/.local/bin

# configure git (change user.*)
git config --global user.name bartr
git config --global user.email bartr@microsoft.com
git config --global core.whitespace blank-at-eol,blank-at-eof,space-before-tab
git config --global pull.rebase false
git config --global init.defaultbranch main
git config --global core.pager more
git config --global fetch.prune true

# delete merged local branches
git config --global alias.gone "! git checkout main && git fetch -pa && git pull &&  git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '\$2 == \"[gone]\" {print \$1}' | xargs -r git branch -D"

# Codespaces sets the env vars for you
# I override these values in my_bashrc with a "full PAT"
# GITHUB_PAT only works in the Codespace repo by default
sudo git config --system credential.helper '!f() { sleep 1; echo "username=${GIT_COMMITTER_NAME}"; echo "password=${GITHUB_PAT}"; }; f'

# this is a cool feature that lets you use "git clone b://dotfiles"
# instead of "git clone https://github.com/bartr/dotfiles"
git config --global url.https://github.com/bartr/.insteadOf b://
git config --global url.https://github.com/cloudatx/.insteadOf c://
git config --global url.https://github.com/.insteadOf g://
git config --global url.https://github.com/lnkdus/.insteadOf l://
git config --global url.https://github.com/retaildevcrews/.insteadOf r://

# install / update key utils
DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y --no-install-recommends apt-utils dialog curl git nano jq httpie bash-completion
DEBIAN_FRONTEND=dialog
