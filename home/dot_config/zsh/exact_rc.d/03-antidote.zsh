#!/usr/bin/env zsh

##
# Antidote plugin manager.
#
# Install if missing.
#

local antidote=${ZDOTDIR:-$HOME}/.antidote/antidote.zsh

if ! [[ -r $antidote ]]; then
    local antidote_dir=$(dirname $antidote)
    mkdir -p $antidote_dir
    git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
fi

source $antidote
