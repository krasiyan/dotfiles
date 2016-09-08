# Colors!
export TERM="xterm-256color"

# Path to oh-my-zsh
export ZSH=~/.oh-my-zsh

DEFAULT_USER=$USER

# https://github.com/bhilburn/powerlevel9k + https://github.com/AravSinghal/ConsolasForPowerline
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d.%m.%Y}"
POWERLEVEL9K_TIME_FOREGROUND="black"
POWERLEVEL9K_TIME_BACKGROUND="249"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

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
plugins=(git common-aliases sudo debian web-search)

source $ZSH/oh-my-zsh.sh

# language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacs -nw'
 else
   export EDITOR='emacs -nw'
 fi

# Aliases
alias emacs="emacs -nw"
alias emacsconfig="emacs ~/.emacs"
alias zshconfig="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"
alias sshconfig="emacs ~/.ssh/config"
alias dotfiles='/usr/bin/git --git-dir=/home/$USER/dotfiles/ --work-tree=/home/$USER'
alias cls="clear"
