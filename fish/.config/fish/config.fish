alias firefox 'firefox --new-tab'
set -x BROWSER 'firefox'
set -x EDITOR 'kak'
set -x SEARCH 'ddgr'

set -x XDG_CONFIG_HOME "$HOME/.config/"
set -x XDG_CACHE_HOME "$HOME/.cache/"
	set -x GRIPHOME "$XDG_CACHE_HOME/grip/"
set -x XDG_DATA_HOME "$HOME/.local/share/"
	set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass/"
	set -x CARGO_HOME "$XDG_DATA_HOME/cargo/"
	set -x GNUPGHOME "$XDG_DATA_HOME/gnupg/"
		mkdir -p $GNUPGHOME
set -x XDG_STATE_HOME "$HOME/.local/state"
	set -x LESSHISTFILE ""

set -x GTK_THEME 'Adwaita:dark'
set -x GPG_TTY (tty)


if status is-login
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	sleep 1 && sway
end

if status is-interactive
	abbr -a !! --position anywhere "$history[1]"
	alias l 'ls -1AhFL --group-directories-first'
	abbr -a mkdir 'mkdir -p'
	abbr -a q 'bg; disown; exit'
	abbr -a o 'open'
	abbr -a e "$EDITOR"
	abbr -a s --set-cursor "$SEARCH" # set $SEARCH to "$BROWSER 'https://lite.duckduckgo.com/lite?q=%'" if you don't have a search program

 	abbr -a svln --set-cursor "doas ln -s /etc/sv/% /var/service/"
	abbr -a xr 'doas xbps-remove -Rf'
	abbr -a giet 'git clone'
	abbr -a ~radio "mpv 'https://azuracast.tilderadio.org/radio/8000/320k.ogg'"
	alias relog 'pkill -u (whoami)'

	function pcp -w 'pass' -d "Copy a password to clipboard"
		pass $argv | head -n1 | wl-copy
	end

	function ytv -w 'yt-dlp' -d "Play a video from the command line using mpv"
		yt-dlp --default-search="ytsearch" --no-simulate -O pre_process:"playing %(id)s" -o - -- "$argv" | mpv --really-quiet --speed=2 - & bg $last_pid &> /dev/null
	end
	alias ytvc 'ytv (wl-paste)'
	function ytm -w 'yt-dlp' -d "Play a song from the command line using mpv"
		yt-dlp --prefer-free-formats --default-search="ytsearch" "$argv" --no-simulate -O "$(tput dim)playing %(id)s$(tput sgr0) %(title)s" -xo - | mpv --really-quiet -
	end
	function yts -w 'yt-dlp' -d "Search the first fifteen YouTube videos for query"
		yt-dlp -O "$(tput dim)%(id)s %(upload_date)s$(tput sgr0) %(channel)s - %(title)s" ytsearch15:"$argv"
	end

	function color-picker -d "Pick a color on screen"
		grim -g (slurp -p) -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:-
	end

	# Dotfile removal
	alias wget 'wget --hsts-file="/tmp/wget-history"'
	rm -fr ~/.pki ~/.gnome2 ~/.links ~/.surf ~/.grip
end
