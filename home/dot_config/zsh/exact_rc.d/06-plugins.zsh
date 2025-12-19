#!/usr/bin/env zsh

##
# Load zsh plugins.
#
# Plugins are configured in /zsh/zsh_plugins.txt.
#

autoload -U ${XDG_CONFIG_HOME}/functions/*

# We initialize bash-completion because certain plugins rely on it.
autoload -Uz bashcompinit
bashcompinit
autoload -z edit-command-line && zle -N edit-command-line

antidote load
