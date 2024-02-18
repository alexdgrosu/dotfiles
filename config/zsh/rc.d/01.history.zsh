#!/bin/zsh

# ---------------------------------------------------------------------------- #
#                                    History                                   #
# ---------------------------------------------------------------------------- #
# We set all history options early to preserve history no matter what happens.


# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Filename-Generation
setopt EXTENDED_GLOB

HISTFILE=${XDG_DATA_HOME:=-~/.local/share}/zsh/history

# Ensure the directory structure for the history file exists.
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

# Max number of entries to keep in the history file.
SAVEHIST=$((100 * 1000))

# Max number of entries to keep in memory.
HISTSIZE=$((1.2 * SAVEHIST))

# Use modern file-locking mechanisms.
setopt HIST_FCNTL_LOCK

# Remove duplicates from history.
setopt HIST_IGNORE_ALL_DUPS

# Sync history between sessions.
setopt SHARE_HISTORY

# Do not save lines that start with a ` ` to history.
setopt HIST_IGNORE_SPACE
