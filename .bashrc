# my.bashrc patch from dotfiles

# aliases
alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -alF'
alias l='ls -CF'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias path='echo $PATH'

# bash history
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

alias k='kubectl'
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'
alias kaf='kubectl apply -f'
alias kdelf='kubectl delete -f'
alias kl='kubectl logs'
alias kccc='kubectl config current-context'
alias kcgc='kubectl config get-contexts'

alias ipconfig='ip -4 a show eth0 | grep inet | sed "s/inet//g" | sed "s/ //g" | cut -d / -f 1'

# add kubectl completion
complete -F __start_kubectl k

export GO111MODULE=on
export PIP=$(ipconfig | tail -n 1)
export PATH=$PATH:$HOME/.local/bin:/workspaces/.codespaces/.persistedshare/dotfiles/bin

git config --global url.https://bartr:${PAT}@github.com/bartr/.insteadOf b://
git config --global url.https://bartr:${PAT}@github.com/retaildevcrews/.insteadOf r://
git config --global url.https://bartr:${PAT}@github.com/.insteadOf g://

# set GitHub info for codespaces

[[ ! -z "$PAT" ]] && export GITHUB_TOKEN=$PAT
export GIT_COMMITTER_NAME=bartr
export GIT_COMMITTER_EMAIL=bartr@microsoft.com