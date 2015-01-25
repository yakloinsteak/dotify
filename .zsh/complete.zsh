# The following lines were added by compinstall
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ”
#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
#zstyle ':completion:*' glob 1
#zstyle ':completion:*' max-errors 2
#zstyle ':completion:*' prompt '[%e]'
#zstyle ':completion:*' substitute 1
#zstyle :compinstall filename '/home/blackman/.zsh/complete2.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Paging for many results of completion
zmodload zsh/complist
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# xkill -id completion, kill (and the like) let you navigate a menu instead of a paged list of choices to have to type yourself
zstyle ':completion:*:(window|processes)' menu on=0

# Progressive max errors (untested)
#zstyle -e ':completion:*:(approximate|correct):*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) )'

#
#zstyle '*' hosts staging
