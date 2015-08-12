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



# Kudos to again to...yes Matthew 'that cntrl-p guy' Franglen.
function vim-ctrlp() {

    #if there's anything else on the buffer, then whack it on the stack
    if [ ${#BUFFER} -ne 0 ]; then
        zle push-line
    fi
    BUFFER='vim +:CtrlP'
    zle accept-line
}

zle -N vim-ctrlp
bindkey -M viins '^P' vim-ctrlp
