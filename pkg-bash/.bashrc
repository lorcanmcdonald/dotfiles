#!/bin/bash

export EDITOR=vim
export PATH="$PATH:$HOME/.ghcup/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.aws/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/local/bin"
alias timestamp='date +"%s"'
alias log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias review='git diff $(git status --porcelain | fzf | sed "s/^...//" )'
alias rev=review
alias add='git add $(git status --porcelain | fzf -m --color bg:#222222,preview-bg:#333333 --preview="echo {} | sed "s/^...//"| xargs git diff --color" | sed "s/^...//"); git status'

export NVM_DIR="/Users/lorcan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export MELOSITY_ENVIRONMENT_NAME=Development
export OPTIMIZATION_LEVEL=0
if which pandoc > /dev/null; then
  eval "$(pandoc --bash-completion)"
fi

# bash: Place this in .bashrc.
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

man() {
  env \
    LESS_TERMCAP_md=$'\e[1;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;40;92m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
      man "$@"
}

PATH="/Users/lorcan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/lorcan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/lorcan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/lorcan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/lorcan/perl5"; export PERL_MM_OPT;
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source <(kubectl completion bash)


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/pi-config:$HOME/.kube/config

# GoLang
export GOROOT=/Users/lorcanmcdonald/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/repos/stabs:$PATH
export PATH=$PATH:$HOME/Library/Python/3.9/bin

# export AWS_PROFILE=saas-app-dev
# export AWS_PROFILE=saas-dataeng-dev
export AWS_PROFILE=bastion-mfa
export DEV_USER=lmcdonald

export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
