[ -f ${ZDOTDIR-${HOME}}/.zaliases ] && source ${ZDOTDIR-${HOME}}/.zaliases

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

if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zcomet load ohmyzsh oh-my-zsh.sh
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load ohmyzsh plugins/gitfast

zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-completions

zcomet load ohmyzsh plugins/copyfile
zcomet load ohmyzsh plugins/copybuffer
zcomet load ohmyzsh plugins/copypath

zcomet load agkozak/zsh-z
zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
(( ${+commands[fzf]} )) || ~[fzf]/install --bin

zcomet compinit
