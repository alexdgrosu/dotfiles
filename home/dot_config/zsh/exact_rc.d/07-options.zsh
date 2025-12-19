#!/usr/bin/env zsh

##
# Other shell options. We set them after sourcing plugins to override them.
#

# Treat pasted comments as comments, not code
setopt INTERACTIVE_COMMENTS

# Don't treat non-executable files in $path as commands.
setopt HASH_EXECUTABLES_ONLY

# Sort numbers numerically, not lexicographically.
setopt NUMERIC_GLOB_SORT

# Allow changing to a directory by typing its name.
setopt AUTO_CD
