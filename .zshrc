# path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# xterm 256 color
export TERM="xterm-256color"

# vim default editor
export EDITOR='vim'

# Flask settings
export NEO4J_PORT=7687
export FLASK_DEBUG=1
export FLASK_ENV=development
export FLASK_APP=app.py

# set name of the theme to load.
ZSH_THEME="materialshell"

# theme settings
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_ALWAYS_SHOW_USER=true

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

source $ZSH/oh-my-zsh.sh

# aliases
alias config="vim ~/dev/setup/zshrc/.zshrc"
alias c="clear"
alias timetable="open ~/Google\ Drive/Universiteit\ van\ Stellenbosch/Timetables/Timetable_2018_2.png"
alias gs="git status"
alias gcd="git checkout dev"
alias goodshit="echo '👌👀👌👀👌👀👌👀👌👀 good shit go౦ԁ sHit👌 thats ✔ some good👌👌shit right👌👌there👌👌👌 right✔there ✔✔if i do ƽaү so my self 💯 i say so 💯 thats what im talking about right there right there (chorus: ʳᶦᵍʰᵗ ᵗʰᵉʳᵉ) mMMMMᎷМ💯 👌👌 👌НO0ОଠOOOOOОଠଠOoooᵒᵒᵒᵒᵒᵒᵒᵒᵒ👌 👌👌 👌 💯 👌 👀 👀 👀 👌👌Good shit' | pbcopy"
alias gl="git log | vim -R -"
alias tb="nc termbin.com 9999"
alias tbc="nc termbin.com 9999 | pbcopy"
alias p="python"
alias gs="git status"
# source ~/.oh-my-zsh/plugins/git/git.plugin.zsh

disable r
alias r="make clean && make && ./run.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


if [[ `uname` == 'Linux' ]]; then
	export OS=linux
	/usr/bin/setxkbmap -option "caps:swapescape"
elif [[ `uname` == 'Darwin' ]]; then
  export PATH="/usr/local/opt/icu4c/bin:$PATH"
  export PATH="/usr/local/opt/icu4c/sbin:$PATH"
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

  # OLD
  # export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  # export CPPFLAGS="-I/usr/local/opt/icu4c/include"
  # export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

  # NEW
  export LDFLAGS="-L/usr/local/opt/ruby/lib"
  export CPPFLAGS="-I/usr/local/opt/ruby/include"
  export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

  # Maven
  export M2_HOME="/usr/local/Cellar/maven/3.6.1/libexec"
  export M2="$M2_HOME/bin"
  export PATH="$PATH:$M2_HOME/bin"
  export JAVA_HOME=$(/usr/libexec/java_home)
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home

	export OS=osx
	export uni=~/Google\ Drive/Universiteit\ van\ Stellenbosch/Modules # autocompletes ~uni to the full directory
	export cs=~/Google\ Drive/Universiteit\ van\ Stellenbosch/Modules/Computer\ Science/ # autocompletes ~uni to the full directory
	export tw=~/Google\ Drive/Universiteit\ van\ Stellenbosch/Modules/Applied\ Mathematics/ # autocompletes ~uni to the full directory
	export PATH="$HOME/.jenv/bin:$PATH"
  export PATH="/usr/local/mysql/bin:$PATH"
	alias vim="mvim -v"
	alias v="mvim -v"
  bindkey -v
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

  source ~/dev/dotfiles/tmuxinator.zsh

  # A helper function to launch docker container using mattrayner/lamp with overrideable parameters
  #
  # $1 - Apache Port (optional)
  # $2 - MySQL Port (optional - no value will cause MySQL not to be mapped)
  function launchdockerwithparams {
      APACHE_PORT=80
      MYSQL_PORT_COMMAND=""

      if ! [[ -z "$1" ]]; then
          APACHE_PORT=$1
      fi

      if ! [[ -z "$2" ]]; then
          MYSQL_PORT_COMMAND="-p \"$2:3306\""
      fi

      docker run -i -t -p "$APACHE_PORT:80" $MYSQL_PORT_COMMAND -v ${PWD}/source:/app -v ${PWD}/mysql:/var/lib/mysql mattrayner/lamp:latest
  }
  alias launchdocker='launchdockerwithparams $1 $2'
  alias ldi='launchdockerwithparams $1 $2'
  alias ldd='launchdockerwithparams 8000 3306'

# Open new iTerm window from the command line
#
# Usage:
#     iterm                   Opens the current directory in a new iTerm window
#     iterm [PATH]            Open PATH in a new iTerm window
#     iterm [CMD]             Open a new iTerm window and execute CMD
#     iterm [PATH] [CMD] ...  You can prob'ly guess
#
# Example:
#     iterm ~/Code/HelloWorld ./setup.sh
#
# References:
#     iTerm AppleScript Examples:
#     https://gitlab.com/gnachman/iterm2/wikis/Applescript
#
# Credit:
#     Inspired by tab.bash by @bobthecow
#     link: https://gist.github.com/bobthecow/757788
#

# OSX only
[ `uname -s` != "Darwin" ] && return

function iterm () {
    local cmd=""
    local wd="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        wd="$1"
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        # echo $args
        cmd="; $args"
    fi

    osascript &>/dev/null <<EOF
        tell application "iTerm"
            activate
            set term to (make new terminal)
            tell term
                launch session "Default Session"
                tell the last session
                    delay 1
                    write text "cd $wd$cmd"
                end
            end
        end tell
EOF
}
iterm $@
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/m/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/m/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/m/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/m/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export SCIPY_PIL_IMAGE_VIEWER='/Applications/Preview.app'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/daniel/.sdkman"
[[ -s "/Users/daniel/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/daniel/.sdkman/bin/sdkman-init.sh"


