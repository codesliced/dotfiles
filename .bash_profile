# echo is like puts for bash (bash is the program running in your terminal)
echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"
# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# RVM scripts below
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Path for RVM
PATH=$PATH:$HOME/.rvm/bin
# note that when setting PATH=$PATH is called.  This is like A=A+B so we preserve the old path

# git completion (commented out in case you don't have these)
# source ~/.git-completion.bash
# source ~/.git-prompt.sh

# Path order matters, putting /usr/local/bin: before $PATH
# ensures brew programs will be seen and used before another program of the same name

# Path for brew
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
# Path for Heroku
export PATH="/usr/local/heroku/bin:$PATH"
# Unfuck Support
export PATH="$PATH:$HOME/.uf/bin"
# Unfuck autocomplete
complete -W "save background chibash sfbash desktop git irb fancy-irb init allsf allchi" uf

# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# Add postgres to autostart with this line from console
# ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# Manually start postgres
function pgstart {
  pg_ctl -D /usr/local/var/postgres -l logfile start
}

# Manually stop postgres
function pgstop {
  pg_ctl -D /usr/local/var/postgres stop
}


# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Useful aliases
alias e=subl

# If the subl command doesn't work. It is probably not properly symlinked
# Try this command for sublime 2
# ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl