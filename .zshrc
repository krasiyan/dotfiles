# Colors!
export TERM="xterm-256color"
export LANG='en_US.UTF-8'

# Path to oh-my-zsh
export ZSH=~/.oh-my-zsh

DEFAULT_USER=$USER

# https://github.com/bhilburn/powerlevel9k + https://github.com/AravSinghal/ConsolasForPowerline
ZSH_THEME="powerlevel9knext/powerlevel9k"

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d.%m.%Y}"
POWERLEVEL9K_TIME_FOREGROUND="black"
POWERLEVEL9K_TIME_BACKGROUND="249"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version time)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Prevent the update prompt
DISABLE_UPDATE_PROMPT=true

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins!
plugins=(git common-aliases sudo debian ssh-agent web-search extract github)

# ssh agent setup
zstyle :omz:plugins:ssh-agent identities id_rsa github bitbucket_linux e_gitlab

source $ZSH/oh-my-zsh.sh

# language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacs -nw'
 else
   export EDITOR='emacs'
 fi

# Allow emacs to track the current directory
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"

  POWERLEVEL9K_MODE='flat'
  POWERLEVEL9K_TIME_FOREGROUND="black"
  POWERLEVEL9K_TIME_BACKGROUND="white"
  POWERLEVEL9K_STATUS_ERROR_FOREGROUND="white"
  POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
  POWERLEVEL9K_STATUS_OK_FOREGROUND="white"
  POWERLEVEL9K_STATUS_OK_BACKGROUND="green"
  POWERLEVEL9K_NODE_VERSION_FOREGROUND="white"
  POWERLEVEL9K_NODE_VERSION_BACKGROUND="blue"

  POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

  POWERLEVEL9K_CUSTOM_FIX_EMACS_BACKGROUND="green"
  POWERLEVEL9K_CUSTOM_FIX_EMACS_FOREGROUND="white"
fi


# Aliases"
alias emacsconfig="emacs ~/.emacs.d/init.el"
alias zshconfig="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"
alias sshconfig="emacs ~/.ssh/config"
alias dotfiles='/usr/bin/git --git-dir=/home/$USER/dotfiles/ --work-tree=/home/$USER'
alias cls="clear"
