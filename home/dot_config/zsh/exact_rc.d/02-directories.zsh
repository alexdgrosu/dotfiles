#!/usr/bin/env zsh

##
# Named directories
#
# Create shortcuts for commonly used directories.
#


# Create shortcuts for common directories.
# `hash -d <name>=<path>` makes ~<name> a shortcut for <path>.
hash -d config=${XDG_CONFIG_HOME}
hash -d ssh=${HOME}/.ssh
hash -d zsh=${ZDOTDIR}
hash -d temp=${HOME}/temp
hash -d src=${HOME}/sources
