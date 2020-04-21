# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
compinit -d $ZDOTDIR/.zcompdump
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTDIR/histfile
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

zstyle ':completion:*' menu select

export EDITOR='nvim'
export PATH=$PATH:$HOME/.local/bin:.:/usr/lib/mono/fsharp/:$HOME/.gem/ruby/2.7.0/bin
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

case $HIST_STAMPS in
        "mm/dd/yyyy") alias history='fc -fl 1';;
        "dd.mm.yyyy") alias history='fc -El 1';;
        'yyyy-mm-dd') alias history='fc -il 1';;
        *) alias history='fc -l 1';;
esac

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

bindkey '^r' history-incremental-search-backward

autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

bindkey '^[[3~' delete-char

# Aliases

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lhF --color=auto --group-directories-first'
alias la='ls -alhF --color=auto --group-directories-first'
alias lA='ls -A --color=auto --group-directories-first'
alias l='ls -CF'

alias ln='ln -v'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias path='echo $PATH | tr -s ":" "\n"'

alias reload='source $ZDOTDIR/.zshrc'

alias rm="rm -I"
alias rmf="rm -rfI"

alias prjprg="cd ~/dev/INSA/Cours/PrjProg/Automate-ique"

alias view="view -c 'syntax on'"

alias objdump="objdump -M intel"

alias del="gio trash"

alias rps='cd ~/src/Bfs'

alias gdb='gdb -q -nh  -x $XDG_CONFIG_HOME/gdb/init'
alias cgdb='cgdb -q'
alias dbg='cgdb -q'

alias chmod='chmod --preserve-root'

alias te='$EDITOR'

alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"

alias vim="vim -u $XDG_CONFIG_HOME/vim/vimrc"

alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'

alias emacs='emacs --no-init-file --load=$XDG_CONFIG_HOME/emacs/config.el'

alias feh='feh --no-fehbg'

alias src='[[ $(pwd) = $HOME ]] && cd $HOME/.local/src || cd ./src'

alias view='view -R'

# Python aliases
alias py="python"
alias py2="python2"
alias ipy="ipython"
alias ipy2="ipython2"

# Oh-my-zsh aliases
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias /='cd /'
alias ~='cd ~/'

alias d='dirs -v'


if [ -f $HOME/bin/check_dskt_env ]
then
    if $(check_dskt_env i3) || $(check_dskt_env KDE); then
        #. /usr/share/powerline/bindings/zsh/powerline.zsh;
        #/usr/bin/neofetch
        if $(check_dskt_env i3); then
            export QT_QPA_PLATFORMTHEME="qt5ct"
            xrdb ~/.Xresources
            #wal -Rent > /dev/null 2> /dev/null;
        fi
    fi
fi

# man colors
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Prompt config

zmodload zsh/nearcolor
autoload -U colors && colors
autoload -Uz vcs_info

autoload -Uz promptinit
promptinit

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{green}[%*]%f %F{blue}%n%f@%m %~ %F{000}%B%(!.#.>)%b%f '
#RPROMPT='%? $vcs_info_msg_0_'
RPROMPT=$'%? $vcs_info_msg_0_'
PS1=$PROMPT
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/vparent/.cache/yay/symfony-cli/pkg/symfony-cli/usr/bin/symfony symfony

zmodload zsh/zpty
