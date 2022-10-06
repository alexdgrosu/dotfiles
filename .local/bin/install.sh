#!/usr/bin/env bash

set -e

dotfiles_dir=${HOME-~}/.dotfiles

function git_config {
    git --git-dir=$dotfiles_dir --work-tree=${HOME-~} $@
}

base_packages="curl git zsh zip unzip"
sudo apt-get update && sudo apt-get install -y ${base_packages}
sudo chsh -s $(command -v zsh) $(whoami)

# Clone dotfiles and configure local git repository
git clone --bare https://github.com/alexdgrosu/dotfiles.git $dotfiles_dir
git_config config status.showUntrackedFiles no
git_config checkout
