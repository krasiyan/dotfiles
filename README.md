# Krasiyan's doftiles

Dotfiles configuration for XFCE, ZSH (with Oh My Zsh) and Emacs (dummy friendly setup with CUA).
Most of the configs are borrowed from all over the web and I will try give credits to everyone in the near future. :)

# Setup

## Prerequisites

- [`Debian`](https://www.debian.org/)
- [`XFCE`](http://www.xfce.org/)
- [`i3`](https://github.com/i3/i3)
- [`i3blocks`](https://github.com/vivien/i3blocks)
- [`rofi`](https://github.com/DaveDavenport/rofi)
- [`redshift`](https://github.com/jonls/redshift)
- [`compton`](https://github.com/chjj/compton)
- [`Zsh`](http://www.zsh.org/)
- [`Oh My Zsh`](https://github.com/robbyrussell/oh-my-zsh)
- [`powerlevel9k Oh My Zsh theme`](https://github.com/bhilburn/powerlevel9k)
- [`The silver searcher AG`](https://github.com/ggreer/the_silver_searcher)
- [`Github Hub`](https://hub.github.com/)
- [`Emacs`](https://www.gnu.org/software/emacs/)

## Cloning

1. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
2. `echo "dotfiles" >> ~/.gitignore`
3. `git clone --bare <git-repo-url> ~/dotfiles`
4. `config checkout`
5. `config config --local status.showUntrackedFiles no`

# Inspiration

TBA

# Various

- [DuckDuckGo](http://duckduckgo.com) settings - `https://duckduckgo.com/?kae=t&kah=bg-bg&kp=-1&k1=-1&kaj=m&kam=google-maps&kal=-1&kak=-1&kw=s&km=l&kf=fw&kai=1&kt=p&kd=1`

  ```
  {
    "kae":"t",
    "kah":"bg-bg",
    "kp":"-1",
    "k1":"-1",
    "kaj":"m",
    "kam":"google-maps",
    "kal":"-1",
    "kak":"-1",
    "kw":"s",
    "km":"l",
    "kf":"fw",
    "kai":"1",
    "kt":"p",
    "kd":"1"
  }
  ```
