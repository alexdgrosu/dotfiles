#!/bin/zsh

# ---------------------------------------------------------------------------- #
#                                 Key Bindings                                 #
# ---------------------------------------------------------------------------- #


unsetopt FLOW_CONTROL

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[q' push-line-or-edit
bindkey "^[m" copy-prev-shell-word
