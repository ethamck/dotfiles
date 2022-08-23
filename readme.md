# Configuration

My configuration/dotfiles. I push mercilessly so please fork the project if you'd like to deriviate these for yourself.  
**Please** (in case it wasn't obvious), *use these in a virtual machine before using them directly* (unless you have some sweet `nix-shell`-fu or something). I (and my computer) are very specific/picky and my configuration is definitely not for everyone.

Personally, I have a simple home directory format philosophy:

* Dotfiles of any depth should not be saved
* Folders are git repositories
* Files are temporary but worth saving

Basically, this means I can have a repository (this one) with all my configuration which is `stow`ed to my home. I barely even have to worry about my system, as long as this repository is safe.

Because of this, backups are also really simple and fast: backup `~/*`. No dotfiles. No need for btrfs (which I use still but ext4 is noticeably faster at full-disk encryption on some distros).

**IMPORTANT NOTICE**: all the keybindings are changed to resemble Emacs. Leave now if you will have a servere allergic reaction to `C-f`. This includes `sway`, `zsh` (and therefore `kitty`), `emacs`, and `mc` (obviously). I do this mainly because Emacs is superior and I'm on Workman so I prefer not to tweak the system keyboard layout to switch to QWERTY each time I hold `C` (which is on Caps Lock in the `sway` configuration).  
On Workman, actually, a few tweaks are in order to make it *better* for Emacs: Control is Hyper, Capslock is Control, Tab is Backspace, Tilde is Tab, and Backspace is Tilde. This basically means normal Workman is shifted up by one on the modifier keys. Good thing capslock is useless.

Generally, my configuration is made to be run on a clean install of an application. Sway


## sway

The Sway configuration prefers to keep it simple. Not much was really tweaked, but the keybindings now resemble Emacs instead of Vim.

The backgrounds used are under `.local/share/backgrounds` (where they're supposed to be). To change that, just edit the sway configuration directly. As far as I know,
* [`interstellar.jpg`](//artstation.com/artwork/xYr0yW) was made by [Vadim Sadovski (ArtStation)](//artstation.com/vadimsadovski).
* [`seattle.jpg`](//commons.wikimedia.org/wiki/File:Seattle_Center_as_night_falls.jpg) was made by [Jeffery Hayes (personal)](//jeffery-hayes.com/needle.html) under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).

*Why is my `gammastep` broken?:* I get headaches looking at screens that don't have some redshift, so my sway configuration executes gammastep oneshot at 3500K. You may consider either removing this line (it's near the end) or adding `killall gammastep; gammastep -l lat:lon` to your `.profile`.


## kitty

The configuration here basically just cleans up the interface, makes the font size bigger, and makes the background slightly transparent. The sizes and type are loosely dependent on Fira Code (for its superb support for `┌` and `└`). A few font styles are applied as well for Fira.


## zsh

Common aliases, basic configuration, and a simple / SWEET (bash-compatible!) prompt:

```
┌ ~
└ $ _
```

(for those worrying that they can't see the username or hostname through SSH, just don't use this configuration on anything but your main user on your main computer)

`.zprofile` also sources `.profile` for any private things you're fine with loosing, like API keys that you can just retrieve again from the web.

Some artifacts for using [Gnuix (GNU GuixSD)](//guix.gnu.org) can be found here. I don't use it anymore due to its horribly bad number of packages. I love the concept of it (Nix but Lisp), though.


## mc

Due to aformentioned issues, `ranger` will not be used in this configuration. Midnight Commander is already made by GNU. My configuration here specifies a theme which makes the background transparent with `kitty`. No idea how it looks on other terminals.


## emacs

Read the files for changes. There aren't many. Mainly, some colors were tweaked to look better with the wallpaper and translucent `kitty`.

As mentioned before, the keyboard layout was further tweaked in order to support Emacs better.


## minecraft

Minecraft configuration uses [`portablemc` (`mindstorm38`)](//pypi.org/project/portablemc) and has a few moving parts. This configuration loosely depends on my `zsh` files as `.zshrc` defines a function to run the instances with my email.

First, configuration is `stow`ed to the `.minecraft` directory, and instances are created with `.minecraft/.sh <name> <version>`. The creation script will also make a running wrapper you can use with `.minecraft/_name/.sh <arguments>`. My `zsh` configuration defines `minecraft`, which launches Minecraft instances with my account (`minecraft <name>`) and basically just gets the instance path under `.minecraft` and runs it with `-ml ethamck@protonmail.com`.

This area of the configuration contains the script necessary to create new instances and instance configuration I'd like to persist across computers, like configuration, mods, and resourcepacks. I don't actually save the run script inside of the instances as to force you to install all the plugins of `portablemc`. My instances use Forge and Fabric. (I'd like to slim this down to **Vanilla** and [**Quilt**](//quiltmc.org) only, but that takes time. I dislike both Forge and Fabric for different reasons (bloat and management), of which the Quilt project mostly addresses.)

I understand including `jar` files in the `mods` folder may be against the license of some packages. If this is the case, please email me at `ethamck@pm.me` with the path of the file you believe is not allowed legally to be included in the repository. You must include the location to its license which prohibits me from hosting the file or your request will be ignored. (F##k you, OptiFine.)
