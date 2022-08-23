HISTFILE=/dev/null # disable history

if [ -n "$ZSH_VERSION" ]; then
	zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' # case insensitive autocomplete
	setopt autocd extendedglob
	bindkey -e
	bindkey "^[[3~" delete-char # DEL key
	autoload -Uz compinit && compinit
	
	tput initc 4 400 400 850 # make terminal blue a bright blue
fi


PS1="┌ \w\n└ "
PROMPT="┌ %~"$'\n'"└ " # zsh will take this and set `PS1` to it rather than the `PS1` with bash escapes

if [ -n "$BASH_VERSION" ]; then
	PS1="$PS1[bash] "
fi

if [ -n "$GUIX_ENVIRONMENT" ]; then
	PS1="$PS1[Guix] "
fi

PS1="$PS1\$ "


if [ -f "$HOME/remindme" ]; then
	cat ~/remindme
fi


alias ls='exa'
alias l='ls -1'
alias la='ls -al'
alias ..='cd ..'
alias ...='..; ..'
alias mk='touch'
alias mkdir='mkdir -p'

alias ed='vi'
alias vi='vim'
alias vim='nvim'
alias nvim='nano'
alias nano='emacs'

alias ssh='kitty +kitten ssh'
alias icat='kitty +icat'

alias cori='sudo pacman -Syu'
alias corr='sudo pacman -Rsu'
alias auri='yay' # no -Syu to prevent risky AUR blind updates
alias aurr='yay -Rsu'

alias pvpn='protonvpn-cli'
alias nl='pvpn c --cc NL'

alias flow='while true; do; dzr /user/4850608022/flow; done;'

alias homeuse='exa */.git -d1; echo; exa -f;'

homeuseold() {
	# list repositories in the home directory
	for repository in ~/*; do
		if [ -d "$repository/.git" ]; then
			echo "${repository/$HOME\//}"
		fi
	done
	echo
	for file in ~/*; do
		if [ -d "$file" ]; then
			continue
		fi
		echo "${file/$HOME\//}"
	done
}

minecraft() {
	# run the .sh script in the Minecraft installation folder
	eval "~/.minecraft/_$1/.sh -ml ethamck@protonmail.com --jvm-args='-Xmx6G' ${@:2}"
}

chika() {
	if [[ "$@" == 'fujiwara' ]]; then
		echo 'https://www.crunchyroll.com/kaguya-sama-love-is-war'
	fi
}
