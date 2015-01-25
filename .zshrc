#ZSH_THEME="tjkirch"
#ZSH_THEME="wedisagree"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gnzh"
#ZSH_THEME="powerline"
#ZSH_THEME="fox"
#ZSH_THEME="random"
ZSH=$HOME/.oh-my-zsh

plugins=(git rails ruby gem vi-mode rvm cap rvm bundler rake rsync colorize)
if [ -x /usr/bin/tmux ] ; then
  plugins+=(tmux)
fi

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.zsh/themes/fox.zsh-theme
source ~/.zsh/aliases.zsh
source ~/.zsh/paths.zsh
source ~/.zsh/vars.zsh
source ~/.zsh/rake_completion.zsh
source ~/.zsh/kill9.zsh
source ~/.zsh/post.zsh
source ~/.zsh/keybinding.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/complete.zsh
source ~/.zsh/locationinc.zsh
source ~/.zsh/autoloads.zsh
if [ -e ~/.zsh/secrets.zsh ] ; then
  source ~/.zsh/secrets.zsh
fi

function chpwd {
  if [[ -e .setup.zsh ]] ; then
    source .setup.zsh
  fi
}

if [[ `uname` == 'Darwin' ]] ; then source ~/.zsh/mac_only.zsh ; else ; source ~/.zsh/linux_only.zsh ; fi

# Load RVM into a shell session *as a function*
if [ -s "/usr/local/rvm/scripts/rvm" ]; then
elif [ -s "$HOME/.rvm/scripts/rvm" ]; then
  $HOME/.rvm/scripts/rvm
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
