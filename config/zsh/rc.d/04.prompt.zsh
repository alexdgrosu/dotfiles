#!/bin/zsh

# ---------------------------------------------------------------------------- #
#                                Prompt & Themes                               #
# ---------------------------------------------------------------------------- #

setopt PROMPT_SUBST 
unsetopt BEEP
unsetopt CORRECT

export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Configure fzf (history, file completion)
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
  --color=prompt:#32344a,pointer:#787c99,marker:#acb0d0,spinner:#acb0d0,header:#414868
  --border='sharp' --layout=reverse
  --prompt='❯❯ ' --marker='✱' --pointer='❯'
  --height=99%
  --bind 'ctrl-/:toggle-preview'
  --preview='bat --color=always {}' --preview-window 'down:50%:hidden'"

export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window 'up:3:hidden:wrap'"

# Initialize starship (prompt)
export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
export STARSHIP_CACHE="${XDG_CACHE_HOME}/starship"
eval "$(starship init zsh)"
