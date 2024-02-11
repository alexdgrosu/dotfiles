#!/bin/zsh

###
# Comands, functions, aliases
#

setopt AUTO_CD

alias    ..='cd ..'
alias   ...='cd ../../'
alias  ....='cd ../../../'
alias .....='cd ../../../../'

alias cp='cp -i'
alias mv='mv -i'

alias cat='bat'
alias eza='eza --icons --group-directories-first'
alias  ls='eza'
alias   g='git'

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
alias gds='g ds'
alias gls='g ls'
alias gpl='g pl'
