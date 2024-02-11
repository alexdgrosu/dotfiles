#!/bin/zsh

###
# Load prompt and theme
#

setopt PROMPT_SUBST 
unsetopt BEEP
unsetopt CORRECT

# Configure fzf (history, file completion)
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
  --color=prompt:#414868,pointer:#c0caf5,marker:#c0caf5,spinner:#c0caf5,header:#414868
  --border='rounded' --border-label=''
  --prompt='❯❯ ' --marker='✱' --pointer='❯❯' --separator='─' --scrollbar='│'
  --info='right' --layout=reverse
  --height=99%
  --bind 'ctrl-/:toggle-preview'
  --preview='bat --color=always {}' --preview-window 'down:50%:hidden'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window 'up:3:hidden:wrap'"

# Initialize starship (prompt)
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
export STARSHIP_CACHE="${XDG_CACHE_HOME}/starship"
eval "$(starship init zsh)"
