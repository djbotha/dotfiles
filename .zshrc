# path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# xterm 256 color
export TERM="xterm-256color"

# vim default editor
export EDITOR='vim'

# set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

# theme settings
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_ALWAYS_SHOW_USER=true

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# aliases
alias config="vim ~/dev/setup/zshrc/.zshrc"
alias c="clear"
alias timetable="open ~/Google\ Drive/Universiteit\ van\ Stellenbosch/Timetables/Timetable_2018_2.png"
alias gs="git status"
alias goodshit="echo '👌👀👌👀👌👀👌👀👌👀 good shit go౦ԁ sHit👌 thats ✔ some good👌👌shit right👌👌there👌👌👌 right✔there ✔✔if i do ƽaү so my self 💯 i say so 💯 thats what im talking about right there right there (chorus: ʳᶦᵍʰᵗ ᵗʰᵉʳᵉ) mMMMMᎷМ💯 👌👌 👌НO0ОଠOOOOOОଠଠOoooᵒᵒᵒᵒᵒᵒᵒᵒᵒ👌 👌👌 👌 💯 👌 👀 👀 👀 👌👌Good shit' | pbcopy"
alias gl="git log | vim -R -"
alias tb="nc termbin.com 9999"
alias tbc="nc termbin.com 9999 | pbcopy"
alias p="python"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


if [[ `uname` == 'Linux' ]]; then
	export OS=linux
	/usr/bin/setxkbmap -option "caps:swapescape"
elif [[ `uname` == 'Darwin' ]]; then
	export OS=osx
	export uni=~/Google\ Drive/Universiteit\ van\ Stellenbosch/Modules # autocompletes ~uni to the full directory
	export cs=~/Google\ Drive/Universiteit\ van\ Stellenbosch/Modules/Computer\ Science/ # autocompletes ~uni to the full directory
	export tw=~/Google\ Drive/Universiteit\ van\ Stellenbosch/Modules/Applied\ Mathematics/ # autocompletes ~uni to the full directory
	export PATH="$HOME/.jenv/bin:$PATH"
	eval "$(jenv init -)"
	eval "$(thefuck --alias)"
	alias vim="mvim -v"
	alias v="mvim -v"
	#fortune | cowsay

	function code {
		if [[ $# = 0 ]]
		then
			open -a "Visual Studio Code"
		else
			local argPath="$1"
			[[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
			open -a "Visual Studio Code" "$argPath"
		fi
	}
	if which rbenv > /dev/null
	then 
		eval "$(rbenv init -)"
	fi
	eval "$(docker-machine env default)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/m/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/m/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/m/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/m/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export SCIPY_PIL_IMAGE_VIEWER='/Applications/Preview.app'
