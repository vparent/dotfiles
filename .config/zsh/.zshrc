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
zstyle :compinstall filename '/home/vparent/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.config/zsh/histfile
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
zstyle :compinstall filename '/home/vparent/.zshrc'

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

alias reload='source ~/.zshrc'

alias rm="rm -I"
alias rmf="rm -rfI"

alias prjprg="cd ~/dev/INSA/Cours/PrjProg/Automate-ique"

alias view="view -c 'syntax on'"

alias objdump="objdump -M intel"

alias del="gio trash"

alias rps='cd ~/src/Bfs'

alias gdb='gdb -q'
alias cgdb='cgdb -q'
alias dbg='cgdb -q'

alias chmod='chmod --preserve-root'

alias te='$EDITOR'

# Python aliases
alias py="python"
alias py2="python2"
alias ipy="ipython"
alias ipy2="ipython2"
alias ppy="ptpython"
alias ppy2="ptpython2"
alias pipy="ptipython"

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

#TMOUT=1
#CPU_USAGE=$(cat /proc/stat | grep 'cpu' | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%3d%s", usage, "%%" }')
#RAM_USAGE=$(free | grep Mem | awk '{printf "%3d%s", $3/$2 * 100.0, "%%"}')
#if [ -n "$(ifconfig enp3s0 | grep 'inet')" ]; then
#	IP_ADDR=$(ifconfig enp3s0 | grep 'inet ' | awk '{ printf $2 }');
#else
#	if [ -n "$(ifconfig wlo1 | grep 'inet')" ]; then
#		IP_ADDR=$(ifconfig wlo1 | grep 'inet ' | awk '{ printf $2 }');
#	fi
#fi
#GIT_BRCH=$(if [ -d .git ]; then echo -n '\ue725 '; echo $(/usr/bin/git rev-parse --abbrev-ref HEAD); else echo ""; fi;)
#
## Update each TMOUT seconds the prompt
#TRAPALRM() {
#    CPU_USAGE=$(cat /proc/stat | grep 'cpu' | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%3d%s", usage, "%%" }')
#    RAM_USAGE=$(free | grep Mem | awk '{printf "%3d%s", $3/$2 * 100.0, "%%"}')
#    GIT_BRCH=$(if [ -d .git ]; then echo -n '\ue725 '; echo $(/usr/bin/git rev-parse --abbrev-ref HEAD); else echo ""; fi;)
#    zle reset-prompt
#}
#
#PS2=$'\xe2\x95\xad\xe2\x94\x80\\ %F{red}\uf133 %D{%a %f %b%p} \uf64f %D{%H:%M:%S%p}%f %K \uf2c0 %F{blue}%n%f @ %F{magenta}'$IP_ADDR$'%f \uf07b :%F{green}%~%f ?:%F{red}%?%f jobs:%F{blue}%j%k%f \uf085 %F{red}'$CPU_USAGE$'%f \uf2db %F{blue}'$RAM_USAGE$'%f '$GIT_BRCH$'\n\xe2\x95\xb0\xe2\x94\x80> '

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
