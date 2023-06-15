# path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# xterm 256 color
export TERM="xterm-256color"

# vim default editor
export EDITOR='vim'

# Flask settings
export CLOUDSDK_PYTHON_SITEPACKAGES=1

# set name of the theme to load.
ZSH_THEME="materialshell"

# theme settings
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_ALWAYS_SHOW_USER=true

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

source $ZSH/oh-my-zsh.sh

# aliases
alias gs="git status"
alias gcd="git checkout develop"
alias gl="git log | vim -R -"
alias p="python"
alias gs="git status"
alias g="noglob git"

export LINEBOOKER="~/dev/linebooker/web"
export FRONTEND="$LINEBOOKER/webui/frontend"
export BACKEND="$LINEBOOKER/backend"
export INFRA="$LINEBOOKER/infra"
alias lb="cd $LINEBOOKER"
alias fe="cd $FRONTEND"
alias be="cd $BACKEND"
alias infra="cd $INFRA"

alias down="docker-compose -f src/main/docker/api-with-redis.yml down && docker-compose -f src/main/docker/app.yml down"
alias up="docker-compose -f src/main/docker/api-with-redis.yml down && ./build.sh && docker-compose -f src/main/docker/api-with-redis.yml up"

alias vd="find $FRONTEND/cypress/videos -type f -iname '*.mp4' | fzf -1 -0 | xargs open"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="$HOME/opt/anaconda3/bin:$PATH"
export PATH="$PATH:$HOME/dev/flutter/bin"

export AWS_PROFILE=DanielB
export AWS_PAGER=""

# POLYMORPH
export GOOGLE_APPLICATION_CREDENTIALS="/opt/gcedeploy/google-service-account.json"
alias j11="export JAVA_HOME=$(/usr/libexec/java_home -v 11); java -version"
alias j8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8); java -version"
alias lbdm='gcloud compute --project "linebooker" ssh --zone "us-east1-b" "linebooker-demo"'
alias lbqa='gcloud compute --project "linebooker" ssh --zone "us-east1-c" "linebooker-qa"'
alias lbprod='gcloud compute --project "linebooker" ssh --zone "us-east1-c" "linebooker-prod-1"'
alias lbprod2='gcloud compute --project "linebooker" ssh --zone "us-east1-b" "linebooker-prod-2"'
alias lblt='gcloud compute --project "linebooker" ssh --zone "us-east1-b" "lb-mysql-lt"'
alias lbdev='gcloud beta compute --project "linebooker" ssh --zone "us-east1-b" "linebooker-dev-1"'
alias lbfd='gcloud beta compute --project "linebooker" ssh --zone "us-east1-b" "linebooker-fd"'
alias lbelk='gcloud compute --project "linebooker" ssh --zone "us-east1-c" "elk-monitoring"'
alias lbprodtunnel='gcloud compute ssh linebooker-prod-1 --project linebooker --zone us-east1-c -- -L 8080:localhost:8080'
alias lbprod2tunnel='gcloud compute ssh linebooker-prod-2 --project linebooker --zone us-east1-b -- -L 8080:localhost:8080'

alias lbsql='gcloud sql connect linebooker-v2-prod --user=root'
alias lbsqlplus='gcloud sql connect linebooker-v2-prodplus --user=root'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"

# NEW
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Maven
export M2_HOME="/usr/local/Cellar/maven/3.6.1/libexec"
export M2="$M2_HOME/bin"
export PATH="$PATH:$M2_HOME/bin"

export OS=osx
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
alias vim="mvim -v"
alias v="mvim -v"
bindkey -v

function code {
  if [[ $# = 0 ]]; then
    open -a "Visual Studio Code"
  else
    local argPath="$1"
    [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
    open -a "Visual Studio Code" "$argPath"
  fi
}
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

source ~/dev/dotfiles/tmuxinator.zsh

function iterm() {
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

export SCIPY_PIL_IMAGE_VIEWER='/Applications/Preview.app'

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/daniel/.sdkman"
# [[ -s "/Users/daniel/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/daniel/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/djbotha/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/djbotha/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/djbotha/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/djbotha/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

cm() {
  local msg=$(echo $1 | perl -pe 's/^(\w+\s)+((\d+).*)$/Fixes AB#\2/')
  echo $msg
  git commit -m "$msg"
}

cmi() {
  local msg=$(echo $1 | perl -pe 's/^(\w+\s)+((\d+).*)$/Implements AB#\2/')
  echo $msg
  git commit -m "$msg"
}

cht() {
  curl "cht.sh/$1?T" | less
}

stacks() {
  aws cloudformation list-stacks --stack-status-filter --output table --query "StackSummaries[? (starts_with(StackName, '${1:-"DanielB"}') && !contains(StackStatus, 'DELETE'))].[StackName, StackStatus]"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zstyle ':completion:*:*:*:default' menu yes select search
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
# preview directory content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
