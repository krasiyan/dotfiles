# Krasiyan's doftiles

Dotfiles configuration for [i3](https://github.com/i3/i3) (with [i3blocks](https://github.com/vivien/i3blocks)), [Zsh](http://www.zsh.org/) (with [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)) and [Emacs](https://www.gnu.org/software/emacs/) (dummy friendly setup with [CUA](https://www.emacswiki.org/emacs/CuaMode)).
Most of the configs are borrowed from all over the web and I will try give credits to everyone in the near future. :)

# Screenshots

![](http://i.imgur.com/LFm0sFz.png)

# Setup

## Prerequisites

- [`Debian`](https://www.debian.org/)
- [`i3`](https://github.com/i3/i3)
- [`i3blocks`](https://github.com/vivien/i3blocks)
- [`rofi`](https://github.com/DaveDavenport/rofi)
- [`redshift`](https://github.com/jonls/redshift)
- [`compton`](https://github.com/chjj/compton)
- [`dunst`](https://github.com/dunst-project/dunst)
- [`Zsh`](http://www.zsh.org/)
- [`Oh My Zsh`](https://github.com/robbyrussell/oh-my-zsh)
- [`powerlevel9k Oh My Zsh theme`](https://github.com/bhilburn/powerlevel9k)
- [`The silver searcher AG`](https://github.com/ggreer/the_silver_searcher)
- [`Github Hub`](https://hub.github.com/)
- [`Emacs`](https://www.gnu.org/software/emacs/)
- [`arandr`](https://christian.amsuess.com/tools/arandr/)
- [`xkblayout-state`](https://github.com/nonpop/xkblayout-state)
- [`xfce4-screenshooter`](http://goodies.xfce.org/projects/applications/xfce4-screenshooter)
- [`keepassx`](https://www.keepassx.org/)
- [`feh`](https://feh.finalrewind.org/)
- [`xautolock`](https://linux.die.net/man/1/xautolock)

## Cloning

1. `alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`
3. `git clone --bare https://github.com/krasiyan/dotfiles.git ~/dotfiles`
4. `dotfiles checkout`
5. `dotfiles config --local status.showUntrackedFiles no`

## Installation

TBA

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
