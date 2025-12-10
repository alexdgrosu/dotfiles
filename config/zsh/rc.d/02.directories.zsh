#!/bin/zsh

# ---------------------------------------------------------------------------- #
#                               Named Directories                              #
# ---------------------------------------------------------------------------- #


# Create shortcuts for common directories.
# `hash -d <name>=<path>` makes ~<name> a shortcut for <path>.
hash -d config="${XDG_CONFIG_HOME}"
hash -d    dot="${HOME}/.dotfiles"
hash -d    ssh="${HOME}/.ssh"
hash -d    zsh="${ZDOTDIR}"
hash -d   temp="${HOME}/temp"
hash -d    src="${HOME}/sources"
hash -d    win="/mnt/c/Users/adg"
