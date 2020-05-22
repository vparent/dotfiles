alias path 'echo $PATH | tr -s ":" "\n"'
alias reload 'source $XDG_CONFIG_HOME/fish/config.fish $XDG_CONFIG_HOME/conf.d/*.fish'
alias bat 'cat /sys/class/power_supply/BAT0/capacity'

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
function ln 
	command ln -v $argv
end
function mkdir 
	command mkdir -pv $argv
end
function rm 
	command rm -I $argv
end
function rmf
	command rm -rfI $argv
end
function view 
	command view -R -c "syntax on" $argv
end
function vim
	command nvim $argv
end
function objdump
	command objdump -M intel $argv
end
function wget
	command wget --hsts-file=$XDG_CACHE_HOME/wget-hsts $argv
end
function tmux
	command tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf $argv
end
function sqlite3
	command sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqliterc $argv
end
function feh
	command feh --no-fehbg $argv
end
function py 
	command python $argv
end
function d
	command dirs -v $argv 
end
function src 
	if test (pwd) = $HOME
		cd .local/src
	else
		cd ./src
	end
end
