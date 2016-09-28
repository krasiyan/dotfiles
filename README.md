# Krasiyan's doftiles

Dotfiles configuration for XFCE, ZSH (with Oh My Zsh) and Emacs (dummy friendly setup with CUA).
Most of the configs are borrowed from all over the web and I will try give credits to everyone in the near future. :)

# Setup

## Prerequisites

- Debian with XFCE
- [`Zsh`](http://www.zsh.org/)
- [`Oh My Zsh`](https://github.com/robbyrussell/oh-my-zsh)
- [`powerlevel9k Oh My Zsh theme`](https://github.com/bhilburn/powerlevel9k)
- [`The silver searcher AG`](https://github.com/ggreer/the_silver_searcher)

## Cloning

1. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
2. `echo "dotfiles" >> ~/.gitignore`
3. `git clone --bare <git-repo-url> ~/dotfiles`
4. `config checkout`
5. `config config --local status.showUntrackedFiles no`

# Inspiration

TBA
