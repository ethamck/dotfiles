set -x XDG_RUNTIME_DIR "$HOME/.local/run/"
set -x XDG_CONFIG_HOME "$HOME/.config/"
set -x XDG_CACHE_HOME "$HOME/.cache/"
	set -x GRIPHOME "$XDG_CACHE_HOME/grip/"
set -x XDG_DATA_HOME "$HOME/.local/share/"
	set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass/"
	set -x CARGO_HOME "$XDG_DATA_HOME/cargo/"
	set -x GNUPGHOME "$XDG_DATA_HOME/gnupg/"
set -x XDG_STATE_HOME "$HOME/.local/state"

set -x GTK_THEME 'Adwaita:dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

export (dbus-launch)
set -x GPG_TTY (tty)


if status is-login
	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	rm -rf "$XDG_RUNTIME_DIR/*"
	sleep 1 && sway
end

if status is-interactive
	abbr -a !! --position anywhere "$history[1]"

	abbr -a cdt --set-cursor 'cd %; clear; tree;'
	alias l 'ls -1AhFL --group-directories-first'
	abbr -a mkd 'mkdir -p'
	abbr -a q 'bg; disown; exit;'

	abbr -a stopwatch 'termdown'
	abbr -a present 'mdp'

	abbr -a svln --set-cursor "doas ln -s /etc/sv/% /var/service/"
	abbr -a giet 'git clone'
	abbr -a ~radio "mpv 'https://azuracast.tilderadio.org/radio/8000/320k.ogg'"

	abbr -a o 'open'
	abbr -a e "$EDITOR"
	abbr -a s --set-cursor "$SEARCH" # set $SEARCH to "$BROWSER 'https://lite.duckduckgo.com/lite?q=%'" if you don't have a search program

	abbr -a xi 'doas xbps-install -Su'
	abbr -a xr 'doas xbps-remove -Rf'
	abbr -a xs 'doas xbps-query -Rs'

	function ytv -w 'yt-dlp' -d "Play a video from the command line using mpv"
		yt-dlp --default-search="ytsearch" "$argv" --no-simulate -O pre_process:"playing %(id)s" -o - | mpv --really-quiet --speed=2 - & bg $last_pid &> /dev/null
	end
	alias ytvc 'yt-dlp --default-search="ytsearch" (wl-paste) -qo - | mpv --speed=2 - & bg $last_pid'
	function ytm -w 'yt-dlp' -d "Play a song from the command line using mpv"
		yt-dlp --prefer-free-formats --default-search="ytsearch" "$argv" --no-simulate -O "$(tput dim)playing %(id)s$(tput sgr0) %(title)s" -xo - | mpv --really-quiet -
	end
	function yts -w 'yt-dlp' -d "Search the first fifteen YouTube videos for query"
		yt-dlp -O "$(tput dim)%(id)s$(tput sgr0) %(channel)s - %(title)s" ytsearch15:"$argv"
	end

	abbr -a wifi --set-cursor "doas wpa_supplicant -BD nl80211 -i 'wlp170s0' -c(wpa_passphrase '%' | psub)"

	function pcp -w 'pass' -d "Copy a password to clipboard"
		pass $argv | head -n1 | wl-copy
	end

	# Configuration shadowing
	alias surf 'GDK_BACKEND=x11 command surf'
	alias radeontop 'radeontop -T'

	# Programs as scripts
	alias imv "mpv --image-display-duration=inf"

	# Useless dotfile removal
	alias wget 'wget --hsts-file="/tmp/wget-history"'
	rm -fr ~/.pki ~/.gnome2 ~/.links ~/.surf ~/.grip

	thefuck --alias | source
end
