#!/usr/bin/env zsh

##
# Key bindings.
#

unsetopt FLOW_CONTROL

bindkey "^x^x" edit-command-line
bindkey '^[q' push-line-or-edit
bindkey "^[m" copy-prev-shell-word
