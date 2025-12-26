#!/usr/bin/env zsh

##
# Install plugin managers and load plugins.
#
# Zsh plugins are configured in /zsh/zsh_plugins.txt.
# Tmux plugins are configured in /tmux/tmux.conf.
#

export ANTIDOTE=${ZDOTDIR:-$HOME}/.antidote/antidote.zsh

function install_tmux_plugins() {
  local tpm_dir=${XDG_CONFIG_HOME}/tmux/plugins/tpm

  if ! [[ -d $tpm_dir ]]; then
      git clone https://github.com/tmux-plugins/tpm $tpm_dir
      $tpm_dir/bin/install_plugins
  fi
}

function install_antidote() {
  if ! [[ -r $ANTIDOTE ]]; then
      local antidote_dir=$(dirname $ANTIDOTE)
      mkdir -p $antidote_dir
      git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
  fi
}

autoload -U ${XDG_CONFIG_HOME}/functions/*
autoload -z edit-command-line && zle -N edit-command-line
autoload -Uz bashcompinit && bashcompinit

install_tmux_plugins
install_antidote && source $ANTIDOTE && antidote load
