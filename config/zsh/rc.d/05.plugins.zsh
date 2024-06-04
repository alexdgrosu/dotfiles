#!/bin/zsh


# ---------------------------------------------------------------------------- #
#                                Plugin Manager                                #
# ---------------------------------------------------------------------------- #
# Plugins are configured in /zsh/zsh_plugins.txt


autoload -U $XDG_CONFIG_HOME/functions/*

# We initialize bash-completion because certain plugins rely on it.
autoload -Uz bashcompinit; bashcompinit
autoload -z edit-command-line && zle -N edit-command-line

source "$ANTIDOTE_DIR/antidote.zsh"
antidote load

# Hook direnv so it can automatically load .envrc when cd-ing to a directory.
eval "$(direnv hook zsh)"
