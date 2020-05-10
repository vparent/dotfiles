function ls
	command ls --color=auto --group-directories-first $argv
end
function ll
	command ls -lh --color=auto --group-directories-first $argv
end
function la
	command ls -lah --group-directories-first --color=auto $argv
end
function lA
	command ls -A --color=auto --group-directories-first $argv
end
function l
	command ls -Cf --color=auto --group-directories-first $argv
end
alias ln 'command ln -v '
alias mkdir 'command mkdir -pv '
alias path 'echo $PATH | tr -s ":" "\n"'
alias reload 'source $XDG_CONFIG_HOME/fish/config.fish $XDG_CONFIG_HOME/conf.d/*.fish'
function rm 
	command rm -I $argv
end
function rmf
	command rm -rfI $argv
end
alias view 'command view -R -c "syntax on"'
alias objdump 'command objdump -M intel'
alias wget 'command wget --hsts-file=$XDG_CACHE_HOME/wget-hsts'
alias tmux 'command tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias sqlite3 'command sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqliterc'
alias emacs 'command emacs --no-init-file --load=$XDG_CONFIG_HOME/emacs/config.el'
alias feh 'command feh --no-fehbg'
alias py 'command python'
alias .. 'command cd ../'
alias ... 'command cd ../../'
alias d 'command dirs -v '
alias bat 'cat /sys/class/power_supply/BAT0/capacity'
function src 
	if test (pwd) = $HOME
		cd .local/src
	else
		cd ./src
	end
end
