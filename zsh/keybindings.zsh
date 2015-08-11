bindkey -v

#backwards search
bindkey '^r' history-incremental-search-backward
bindkey "^[." insert-last-word

bindkey -M isearch '^k' history-incremental-search-backward
bindkey -M isearch '^j' history-incremental-search-forward
