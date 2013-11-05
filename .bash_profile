# Set sublime as the default editor
which -s subl && export EDITOR="subl --wait"

# ---

# Git config - depends on version 1.8.3.4 (installed with homebrew)

# Load git prompt
git_prompt_script=/usr/local/etc/bash_completion.d/git-prompt.sh
test -s $git_prompt_script && source $git_prompt_script

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# ---

# A fancyish prompt

# \W            - current directory name (not full path)
# \e[01;33      - yellow
# $(__git_ps1)  - git "prompt" defined in $git_prompt_script loaded above
# \e[01;32m     - money green
# \$            - literal dolla sign
# \e[0m         - reset to default color

test -s $git_prompt_script &&
  export PS1='\W\[\e[01;33m\]$(__git_ps1) \[\e[01;32m\]\$\[\e[0m\] '

# ---

# ls config

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# ---

# Useful aliases

# e for editor
which -s subl && alias e=subl

# ---

# The `PATH="/some-path-to-folder-of-executables:$PATH"` pattern *prepends*
# a the path to the list of places to look for executables - meaning that
# folder will be searched first.
#
# For example /usr/local/bin needs to come before /usr/bin if we want to
# use the postgres commands installed with homebrew instead of the
# operating systems default postgres version.

# Add homebrew executables folder to PATH
test -d /usr/local/bin && export PATH="/usr/local/bin:$PATH"

# Add unfuck executables
test -d $HOME/.uf/bin && export PATH="$HOME/.uf/bin:$PATH"

# Add heroku executables
test -d /usr/local/heroku/bin && export PATH="/usr/local/heroku/bin:$PATH"

# ---

# If RVM is installed, run it's init script
rvm_init_script="$HOME/.rvm/scripts/rvm"
test -s $rvm_init_script && source $rvm_init_script
