# Path to your oh-my-zsh configuration.
ZSH=$HOME/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew common-aliases tmux npm history svn go sublime heroku mvn emoji-clock)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/aws_zsh_completer.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

##########################
# add Ruby env.
##########################
export PATH="$HOME/.rbenv/bin:$PATH" 
eval "$(rbenv init -)" 
alias rake="noglob rake" # allows square brackts for rake task invocation
alias brake='noglob bundle exec rake' # execute the bundled rake gem
alias srake='noglob sudo rake' # noglob must come before sudo
alias sbrake='noglob sudo bundle exec rake' # altogether now ... 

##########################
# add Go env.
##########################
export GOPATH=$HOME/.go/1.3
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

##########################
# add Scala env.
##########################
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
export JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

##########################
# add Scala env.
##########################
SCALA_HOME=/usr/local/opt/scala
export SCALA_HOME
export PATH=$PATH:$SCALA_HOME/bin

##########################
# add Playframework env.
##########################
PLAY_HOME=/usr/local/opt/play
export PLAY_HOME
export PATH=$PATH:$PLAY_HOME

##########################
# add ec2-api-tools env
##########################
#export JAVA_HOME="$(/usr/libexec/java_home)"
#export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
#export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
#export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.13.0/libexec"

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8



# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# MacVim KaoriYa
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# tmux prefixキーをzshでのbindkeyを無効化
bindkey -r '^q'

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
