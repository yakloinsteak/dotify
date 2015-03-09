# To list current bindings: bindkey -L
# To list available functions: zle -la
# To see what is bound (to control-y for example): bindkey '\C-y'
# Use the read command to echo back key sequences
# Binding strings: bindkey -s '\C-mm' 'Hello my friend'

# Multiple key bindings may require tuning the KEYTIMEOUT value

bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

# Go up in your history and then you can ^o over and over to cycle through all the commands.
bindkey -M viins '^o' accept-line-and-down-history

# blank out the line (saving it). Then check on something (like a man page). and then the command will magically reappear!
bindkey -M vicmd 'q' push-line-or-edit
#bindkey -M viins '\eq' push-line-or-edit

# Get help (m for man-page)
#bindkey -M viins '\em' run-help
#bindkey -M vicmd '\em' run-help
#bindkey -M vicmd '\em' run-help

# Paging of long auto-complete can be exited with a 'q'
bindkey -M listscroll q send-break

# Menu selects with this key keep you in the menu to select another
bindkey -M menuselect '\C-o' accept-and-menu-complete

# Full editor on this line
autoload -U edit-command-line
zle -N edit-command-line

#bindkey '\ee' edit-command-line
bindkey -M vicmd 'v' edit-command-line

bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward
