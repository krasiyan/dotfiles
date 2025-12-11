# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$(uname)" == "Darwin" ]]; then
  # Homebrew
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_INSECURE_REDIRECT=1
  export HOMEBREW_CASK_OPTS=--require-sha
  export NVM_HOMEBREW=$(brew --prefix nvm)
fi


# Colors!
export TERM="xterm-256color"
export LANG='en_US.UTF-8'

# Path to oh-my-zsh
export ZSH=~/.oh-my-zsh

DEFAULT_USER=$USER

# https://github.com/romkatv/powerlevel10k + https://github.com/AravSinghal/ConsolasForPowerline
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZLE_RPROMPT_INDENT=0
POWERLEVEL9K_LEGACY_ICON_SPACING=true

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

# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Prevent the update prompt
DISABLE_UPDATE_PROMPT=true

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="false"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Plugins!
plugins=(
    alias-finder
    aliases
    bazel
    common-aliases
    debian
    docker
    extract
    fzf
    git
    gh
    github
    golang
    npm
    pip
    poetry
    poetry-env
    pyenv
    python
    safe-paste
    ssh-agent
    sudo
    web-search
    ufw
    nvm
)

# ssh agent setup
zstyle :omz:plugins:ssh-agent identities `find ~/.ssh/ -type f ! -name "*.pub" ! -name "known_hosts" ! -name "config" ! -name "*.ppk" ! -name "environment-*"`

source $ZSH/oh-my-zsh.sh

# ctrl + backspace = delete word (backward)
bindkey '^H' backward-kill-word
# ctrl + delete = delete word (forward)
bindkey '^[[3;5~' kill-word

# language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='nano'
   export VISUAL='nano'
 fi

# Aliases
alias e="nano"
alias configemacs="e ~/.emacs.d/init.el"
alias configzsh="e ~/.zshrc"
alias configohmyzsh="e ~/.oh-my-zsh"
alias configi3="e ~/.i3"
alias configssh="e ~/.ssh/config"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cls="clear"
alias ducks="du -hcs -BM * | sort -rn | head"
alias grbim='git rebase -i origin/master'
alias qrcode='qrencode -o - -t UTF8'

# dotfiles alias auto-completion
complete -F _complete_alias dotfiles
compdef dotfiles='git'
setopt complete_aliases

# Functions

# bc - An arbitrary precision calculator language
# Ripped off from https://github.com/arzzen/calc.plugin.zsh
function = 
{
  echo "$@" | bc -l
}
alias calc="="

# Path
path+=("/usr/local/go/bin")
path+=("/var/lib/flatpak/exports/bin")

if [[ "$(uname)" == "Darwin" ]]; then
  path+=("/Users/$USER/.local/bin")
  path+=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin")
  path+=("/Users/$USER/go/bin")
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
