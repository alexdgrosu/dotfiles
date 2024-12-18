#!/bin/zsh

# ---------------------------------------------------------------------------- #
#                                    Aliases                                   #
# ---------------------------------------------------------------------------- #


setopt AUTO_CD

alias    ..='cd ..'
alias   ...='cd ../../'
alias  ....='cd ../../../'
alias .....='cd ../../../../'

alias     cp='cp -i'
alias     mv='mv -i'
alias    pls='sudo $(fc -ln -1)'
alias python=python3

alias  cat='bat'
alias  eza='eza --icons --group-directories-first'
alias tree='eza -T'
alias   ls='eza'
alias    g='git'
alias   lz='lazygit'

alias  zz='z -c'
alias  zs='cd $(g root)'
alias  lS='ls -1'
alias  ll='ls -lah'
alias  la='ls -A'
alias   l='ls'

alias  gc='g cm'
alias  gd='g di'
alias  gf='g f'
alias  gl='g lp'
alias  gp='g p'
alias  gs='g s'
alias gad='g fza'
alias gan='g fzn'
alias gap='g ap'
alias gco='g co'
alias gds='g ds'
alias gls='g ls'
alias gpl='g pl'
alias grb='g r'
alias gri='g r -i'

alias   ta='tmux attach -t'
alias  tns='tmux new-session -s'
alias   ts='tns ${PWD##*/}'
alias   tl='tmux list-sessions'
alias  tad='tmux attach -d -t'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias  pc='pre-commit run'
alias pca='pre-commit run --all-files'

alias tms='tm script run'
