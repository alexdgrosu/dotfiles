#!/usr/bin/env zsh

set -Eeuo pipefail

source ${HOME}/.zshenv
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
