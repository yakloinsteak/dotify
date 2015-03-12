
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Load RVM into a shell session *as a function*
if [ -s "/usr/local/rvm/scripts/rvm" ]; then
  source "/usr/local/rvm/scripts/rvm"
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
fi

keychain id_rsa id_dsa
. ~/.keychain/`uname -n`-sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
