# Krasiyan's doftiles

Dotfiles configuration for [sway](https://github.com/swaywm/sway) / [i3](https://github.com/i3/i3),
[Zsh](http://www.zsh.org/) (with [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh))
and [Emacs](https://www.gnu.org/software/emacs/)
(dummy friendly setup with [CUA](https://www.emacswiki.org/emacs/CuaMode)).
Most of the configs are borrowed from all over the web and I will try give credits to everyone in
the near future. :)

# Screenshots

![](http://i.imgur.com/LFm0sFz.png)

# Setup

## Prerequisites

### Generic

- [`Debian`](https://www.debian.org/)
- [`Emacs`](https://www.gnu.org/software/emacs/)
- [`Github Hub`](https://hub.github.com/)
- [`Oh My Zsh`](https://github.com/robbyrussell/oh-my-zsh)
- [`The silver searcher AG`](https://github.com/ggreer/the_silver_searcher)
- [`Zsh`](http://www.zsh.org/)
- [`editorconfig`](https://github.com/editorconfig/editorconfig-core-c)
- [`footswitch`](https://github.com/rgerganov/footswitch)
- [`keepassxc`](https://keepassxc.org/)
- [`powerlevel10k`](https://github.com/romkatv/powerlevel10k)
- [`ly`](https://github.com/nullgemm/ly)
- [`alacritty`](https://github.com/alacritty/alacritty)
- [`Inconsolata`](https://fonts.google.com/specimen/Inconsolata)

### sway setup

- [`gammastep`](https://gitlab.com/chinstrap/gammastep)
- [`grimshot`](https://github.com/swaywm/sway/blob/master/contrib/grimshot)
- [`kanshi`](https://github.com/emersion/kanshi)
- [`mako`](https://github.com/emersion/mako)
- [`sway`](https://github.com/i3/sway)
- [`waybar`](https://github.com/Alexays/Waybar)
- [`wofi`](https://github.com/tsujp/wofi)

### i3 setup

- [`arandr`](https://christian.amsuess.com/tools/arandr/)
- [`compton`](https://github.com/chjj/compton) / [`picom`](https://github.com/yshui/picom)
- [`dunst`](https://github.com/dunst-project/dunst)
- [`feh`](https://feh.finalrewind.org/)
- [`hsetroot`](https://github.com/himdel/hsetroot)
- [`i3`](https://github.com/i3/i3)
- [`i3blocks`](https://github.com/vivien/i3blocks)
- [`xsecurelock`](https://github.com/google/xsecurelock)
- [`rofi`](https://github.com/DaveDavenport/rofi)
- [`xdotool`](https://www.semicomplete.com/projects/xdotool/)
- [`xkblayout-state`](https://github.com/nonpop/xkblayout-state)

## i3 vs sway

Initial support for `sway` was added @ [!1](https://github.com/krasiyan/dotfiles/pull/1);
both `i3` and `sway` are fully configured.

## Cloning

1. `alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'`
3. `git clone --bare https://github.com/krasiyan/dotfiles.git ~/dotfiles`
4. `dotfiles checkout`
5. `dotfiles config --local status.showUntrackedFiles no`
