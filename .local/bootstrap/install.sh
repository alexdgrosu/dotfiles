#!/usr/bin/env bash

set -e

apt_packages="curl git zsh"

sudo apt-get update && sudo apt-get install -y ${apt_packages}

sudo chsh -s $(command -v zsh) $(whoami)
