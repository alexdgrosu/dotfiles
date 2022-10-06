[ -f ${ZDOTDIR-${HOME}}/.zaliases ] && source ${ZDOTDIR-${HOME}}/.zaliases

# Ensure zsh plugin manager is installed
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=12000
SAVEHIST=10000

setopt autocd
setopt promptsubst
unsetopt beep
unsetopt correct

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# Load p10k prompt
zcomet load romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load some plugins
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions

# Load some OMZ plugins
zcomet load ohmyzsh oh-my-zsh.sh
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/copyfile
zcomet load ohmyzsh plugins/copybuffer
zcomet load ohmyzsh plugins/copypath
zcomet load ohmyzsh plugins/ssh-agent

# Load z and fzf
zcomet load agkozak/zsh-z
zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
(( ${+commands[fzf]} )) || ~[fzf]/install --bin

# Initialize 
zcomet compinit
