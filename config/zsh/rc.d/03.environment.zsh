#!/bin/zsh

# ---------------------------------------------------------------------------- #
#                             Environment Variables                            #
# ---------------------------------------------------------------------------- #

bindkey -e

# -U ensures each entry is unique
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

# Each value in the array is expanded separately
path=(
    $path
    "~/.local/bin"
)

fpath=(
    "${XDG_CONFIG_HOME}/functions"
    $fpath
)

# We source asdf early to make sure its shims are available in the path
source "$ASDF_DIR/asdf.sh"
