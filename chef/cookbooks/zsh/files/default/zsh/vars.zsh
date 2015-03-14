# history of different shells stays separate
#setopt nosharehistory

# pwd in a symlinked directory shows actual directory
setopt chase_links

# Automatically keep a small stack of previous directories
setopt auto_pushd
setopt pushd_ignore_dups
export DIRSTACKSIZE=5

# History is shared, but only on opening a new shell
setopt inc_append_history

export EDITOR=vim
DISABLE_AUTO_TITLE=true
CASE_SENSITIVE=true

## Time to wait for keybindings
export KEYTIMEOUT=10

# need keychain package
if [ -x /usr/bin/keychain ] ; then
  keychain --timeout 600 id_rsa id_dsa
  . ~/.keychain/`uname -n`-sh
else
  echo No keychain binary
fi

PS4='+%N:%i:% >'

## Duh, but these affect how much memory ruby uses and makes it faster if you have the memory.
RUBY_HEAP_MIN_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000

export MYSQL_PS1="(\u@\h) [\d]> "

# Makes mysql-workbench not use gnome keyring.
export WB_NO_GNOME_KEYRING=1

export VIM_SERVER=red

# Used in cucumber
export CUCUMBER_FORMAT=progress
export FAST=true

export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

export EC2_HOME=/usr/local/ec2/`ls /usr/local/ec2`
export PATH=$PATH:$EC2_HOME/bin

if [ -x /usr/bin/dircolors ] ; then
  eval `dircolors ~/.zsh/dircolors`
fi
