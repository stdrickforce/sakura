################
# basic configs
################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# bash aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# bash env
if [[ -f ~/.bash_env ]]; then
    . ~/.bash_env
fi

# bash prompt
# if [[ -f ~/.bash_prompt ]]; then
#     . ~/.bash_prompt
# fi

#############
# export env
#############

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export CLICOLOR=1

###################
# homebrew related
###################

if [[ -f "/usr/local/bin/brew" ]]; then
  echo waiting for homebrew to be registered...

  # auto add gnubin before $PATH
  if [[ -d "/usr/local/opt/coreutils" ]]; then
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
  fi

  # auto select php-version to 5.6
  if [[ -d "/usr/local/opt/php-version" ]]; then
    source /usr/local/opt/php-version/php-version.sh && php-version 5.6
  fi

fi

# direnv
if [[ -f "/usr/local/bin/direnv" ]]; then
  echo initializing direnv bash hooks...
  eval "$(direnv hook bash)"
fi

# git completion
# if [[ -f ~/.git-completion.bash ]]; then
#   echo initializing git completion...
#   . ~/.git-completion.bash
# fi

# nvm
if [[ -d "/usr/local/opt/nvm" ]]; then
  echo initializing nvm enviroments...
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi

# mysql
# export PATH=$PATH:/usr/local/mysql/bin

# es
export ES_HOME=/Users/terence/workspace/elasticsearch-6.2.4
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH


# add composer bin directory to path
export PATH=~/.composer/vendor/bin:$PATH

# add go bin directory to path
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# maven
export PATH="$PATH:$HOME/workspace/apache-maven-3.5.2/bin"

# make man colorful
function man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Upgrade bison to 3.x
PATH="/usr/local/opt/bison/bin:$PATH"

# clear current bash outputs.
clear

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
}
