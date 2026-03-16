# https://github.com/ajeetdsouza/zoxide/issues/491#issuecomment-2137626085
eval "$(zoxide init zsh | sed 's/_files/_cd/g')"

compdef _gnu_generic fzf
compdef _gnu_generic fdfind

source <(mise completion zsh)
source <(chezmoi completion zsh)
