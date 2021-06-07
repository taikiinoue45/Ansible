PROMPT='%F{red}%M@%n%f:%F{green}%~%f$ '

# ls aliases
alias ls='ls -FG'
alias ll='ls -lFG'
alias lla='ls -lFAG'
alias la='ls -1FAG'
alias cl='clear'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# setopt
setopt auto_cd
setopt auto_menu
setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt no_beep
setopt nolistbeep
setopt nomatch

# command history
HISTFILE=${HOME}/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# completion
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

# cuda 11.0
export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# conda
export PATH=/opt/conda/bin${PATH:+:${PATH}}
