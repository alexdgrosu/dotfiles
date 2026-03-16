# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Reference documentation

Read these files on demand when the topic is relevant:

| File             | Topics                                        |
| :--------------- | :-------------------------------------------- |
| @docs/chezmoi.md | chezmoi concepts, commands, templating syntax |

## Overview

This repository contains my [dotfiles](https://dotfiles.github.io/) which are securely managed across multiple machines with [chezmoi](https://www.chezmoi.io/).
My dotfiles currently target Debian-based systems: Debian, Ubuntu, Linuxt Mint.
For chezmoi to apply the dotfiles configuration succesffuly the following dependencies are expected to be in place:

- `git` as the version control system
- `curl/wget` as headless HTTP clients
- `apt` as the default system package manager

While applying the dotfiles, chezmoi installs these additional core dependencies:

- `zsh` as the default shell
- [mise](https://mise.jdx.dev/) as a development environment manager

### Repository structure

Important files and directories are highlighted with a `#` comment to give you a better understanding of how this repository is structured.

```
.chezmoiroot # configures the dotfiles source directory
home/ # the dotfiles source directory
├── .chezmoiscripts/linux/
│  ├── run_onchange_after_00-chsh.sh
│  ├── run_onchange_after_01-install-mise.sh.tmpl
│  └── run_onchange_before_00-install-packages.sh.tmpl
├── dot_config
│  ├── functions/
│  ├── git/
│  ├── kitty/
│  │  ├── ...
│  │  └── kitty.conf
│  ├── lazygit/
│  ├── mise/
│  │  └── create_config.toml
│  ├── starship/
│  ├── tmux/
│  └── zsh/
│     ├── exact_rc.d
│     ├── ...
│     └── dot_zshrc
├── .chezmoi.toml.tmpl # main chezmoi configuration file with data used by templates
├── .chezmoiignore.tmpl # allows different files to be ignored on different machines
└── dot_zshenv

.env
Makefile
build/
├── .dockerignore
├── compose.yml
├── ...
└── Dockerfile.ubuntu

install.sh
```

