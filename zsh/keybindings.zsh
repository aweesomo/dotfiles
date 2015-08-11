bindkey -v

if [ -z $SSH_CONNECTION ]; then
    xmodmap -e 'keycode 135 = Control_L'
    xmodmap -e 'keycode 108 = Alt_L'
fi

#backwards search
bindkey -M isearch '^k' history-incremental-search-backward
bindkey -M isearch '^j' history-incremental-search-forward
bindkey '^r' history-incremental-search-backward

bindkey "^[." insert-last-word
