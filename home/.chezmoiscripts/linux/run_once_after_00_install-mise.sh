#!/usr/bin/env zsh

set -Eeuo pipefail

local mise=${HOME}/.local/bin/mise

curl https://mise.run | MISE_INSTALL_PATH=$mise sh

$mise use --global usage@latest
