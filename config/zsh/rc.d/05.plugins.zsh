#!/bin/zsh


# ---------------------------------------------------------------------------- #
#                                Plugin Manager                                #
# ---------------------------------------------------------------------------- #
# Plugins are configured in /zsh/zsh_plugins.txt


autoload -U $XDG_CONFIG_HOME/functions/*

source "$ANTIDOTE_DIR/antidote.zsh"
antidote load

# We initialize bash-completion because certain plugins rely on it.
autoload -Uz bashcompinit; bashcompinit

# Hook direnv so it can automatically load .envrc when cd-ing to a directory.
eval "$(direnv hook zsh)"
