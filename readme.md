# Configuration

My configuration/dotfiles. I push mercilessly so fork the repo if you'd like to deriviate these for yourself.
Please *use these in a separate user environment before copying them directly*. This can simply be an `adduser` and `su` combination.

I use [Void](https://voidlinux.org/) with minimal software such as `seatd` and `connman`. `turnstile` is used to start all the services I need to login.

I have a very simple home directory philosophy that lends well to a repository in this format:

- Dotfiles of any depth should never be saved
- Folders are Git repositories
- Files will be moved to a folder in the future

These points mean I can just have a repository with my configuration `stow`ed to my home directory. Backup is simplified too, as all one needs to back up is `~/*`.

Anything that I don't mention here is probably just color-tweaked to look correct on my setup.

## Sway

Windows are more minimal and have no title or gaps, instead only showing how they will split when a new window is launched.

Backgrounds should be stored under `$XDG_DATA_HOME/backgrounds` (`~/.local/share/backgrounds`). I personally use [Ravimo](https://ko-fi.com/D1D54RIXT)'s [Liu artwork](https://drive.usercontent.google.com/download?id=1gQTeX30GvlygCpB-Mwc8NCtG90BkZwuw), which isn't distributed here.

The bar is the regular `swaybar`. I don't like that Sway includes it by default, but since it is, I use it to tell me processor utilization and temperature, memory utilization, graphics utilization, battery, and time. All of these are done using `/sys` and `/proc` paths and may not work on other non-Linux operating systems.

As a menu, I use `tofi`, with some minor tweaks to its [fullscreen configuration](https://github.com/philj56/tofi/blob/master/screenshot_fullscreen.png) that make the display larger and the prompt `>` instead of `run:`.

The keyboard layout is Workman, but modifiers are shifted so that Left Hyper → Escape → Right Alt → Left Control → Tab → Grave → Backspace → Caps, where `→` means "is bound on". To simplify, the left column is rebound as Hyper Tab Backspace Shift AltGr and AltGr is Escape. If it seems that Control has too large a prevalence, it's a relic of my Emacs use, but it still helps in other apps. This configuration does quite well on both editors.

If you have a trackpad, you can switch between layouts (mine and QWERTY, by default) using a four-fingered swipe in either direction. This can be extremely useful in games.

My startup applications are mostly daemons that I only use when in a graphical environment:

- `foot -s`
- `swayidle` / `swaylock` (mostly from the default configuration)
- `gammastep -O`
	- I use `gammastep` at all times to prevent headaches, so it's restarted whenever it's killed by games or by me for color-accurate work.

Sway is meant to be specific to my peripherals, so many things won't get applied to other computers, but you should still double-check that nothing will break if you apply something to your setup.

### Unicode Insertion

Requires `python` and `wtype`. Bound to Super + u

*Insert any Unicode character using your `$menu`.*

Opens a dialog with a list of every Unicode character above 0x20 (space) and inserts it.

### Snippets and Bookmarks

Requires `wtype` and `sed`. Bound to Super + Insert.

*Store lines in `$snippets` to be filled anywhere using your `$menu`.*

Inspired primarily by Luke Smith's "[Bookmarking for Unix Chads](https://youtu.be/d_11QaTlf1I)", but better because it uses `sed` to filter out comments in addition to having an uncommented description.

Each line on the data file is used as the snippet to type. Anything after a hash character will be filtered from the result.

### Cassetteplayer

Requires `mpvpaper` and `yt-dlp`. Bound to Hyper + XF86AudioPlay (the play/pause button; may not be present on some keyboards).

*Use a data file `$cassette` and your `$menu` to play a song immersively.*

Replaces your desktop wallpaper with a YouTube video, selected with your `dmenu`-compatible program

Every line used as data should contain a YouTube ID or URL. Everything after a tab character is a comment and unparsed.

Configuration is reloaded once a video is selected to work around `swaybg`. Sometimes this can create a race condition and you won't be able to see the video; if this happens just reload manually.

Volume is quite low by default, you may wish to make it louder by editing the `mpv` arguments.

## foot

Extremely simple configuration; a translucent (0.65) background, beam cursor, and 12px font (Fira Code).

The colors descend from the bundled `tempus-night` theme.

## fish

Over time, I've begun to more and more enjoy small prompts. The fish prompt is stock, but without the login (`user@host`) or suffix (`>`), which means that the prompt is usually just `~`. Your most frequently used prompt is by default wasting space and repeating information that you already knew, unless you're multiple layers deep into SSH.

Even so, to compensate for the lack of information on the prompt, the greeting has been altered to display the login information, which results in a first output even cleaner in style than just a single `~`.

```
ethan@void
~ 
```

Many abbreviations are defined for navigation and simple scripts. Check `config.fish` for all of these. A few variables are set to prevent home dotfile clutter where possible.
