# Configuration

My configuration/dotfiles. I push mercilessly so fork the project if you'd like to deriviate these for yourself.
Please *use these in a separate user environment before copying them directly*. This can simply be an `adduser` and `su` combination.

I use [Void](https://voidlinux.org/) with minimal software such as `seatd` and `connman`. Some configuration here is necessary to start the system, and is littered throughout these files. Primarily, check the `fish` and `sway` configurations, which work in tandem to start everything I use on my system.

I have a very simple home directory philosophy that lends well to a repository in this format:

* Dotfiles of any depth should never be saved
* Folders are Git repositories
* Files will be moved to a folder in the future

These points mean I can just have a repository with my configuration `stow`ed to my home directory. Backup is simplified too, as all one needs to back up is `~/*`.

Generally, changes that I make to stock configuration of apps are usually just those that change keybindings to `readline`/`emacs`.
I'll aknowledge that vi bindings are better on QWERTY, but I use Workman, which unintentionally moves all common Emacs shortcuts to a more comfortable position, and intentionally makes hjkl super awkward to use.
*Yes, I'm aware that you don't often use hjkl in **vi**, but you certainly do in any app tweaked to use its keybindings.*

Anything that I don't mention here is probably just color-tweaked to look correct on my setup.

To that effect,

## sway

Windows are more minimal and have no title or gaps, instead only showing how they will split when a new window is launched.

Backgrounds should be stored under `$XDG_DATA_HOME/backgrounds` (`~/.local/share/backgrounds`). I use macOS Catalina wallpapers that I took from a Macintosh machine, but as far as I know those cannot be legally redistributed here.

The bar is the regular `swaybar`. I don't like that sway includes it by default, but since it is, I use it to tell me processor utilization and temperature, memory utilization, graphics utilization, battery, and time. All of these are done using `/sys` and `/proc` paths and may not work on other non-Linux operating systems.

As a menu, I use `tofi`, with some minor tweaks to its [fullscreen configuration](https://github.com/philj56/tofi/blob/master/screenshot_fullscreen.png) that make the display larger and the prompt `>` instead of `run:`.

The keyboard layout is Workman, but modifiers are shifted so that Hyper → Control → Tab → Grave/Tilde → Backspace, where `→` means "is bound on". Some applications don't respect keyboard layout properly and have trouble with rebound modifiers. For this, Hyper (Control) + Tilde (Backspace) is bound to Backspace (using sway).

My startup applications are mostly daemons that are not packaged as servers:

* `foot -s`
* `emacs --daemon`
* `swayidle` / `swaylock` (stock command)
* `pipewire`, `wireplumber`, `pipewire-pulse`
* `gammastep -O`
	* I use `gammastep` at all times to prevent headaches. If you use it based on sunset times, you'll need to manually change the code near the bottom.

Sway's config is, if you stop for nothing else, most likely the one you should triple-check. The applications are hardcoded into the file, so if you use a different terminal, menu, audio server, etc., you *really should* edit almost everything in it.

### Snippets and Bookmarks

Requires `wtype` and `sed`. Bound to Super + Insert.

*Store lines in `$snippets` to be filled anywhere using your `$menu`.*

Inspired primarily by Luke Smith's "[Bookmarking for Unix Chads](//youtu.be/d_11QaTlf1I)", but better because it uses `sed` to filter out comments in addition to having an uncommented description.

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
ethamck@helium1
~ 
```

Many abbreviations are defined for navigation and simple scripts. Check `config.fish` for all of these.

## emacs (no-x)

As I use a tiling window manager, the Emacs daemon is running at all times, and Super+Shift+Enter is a keybind to open `dired`. I doubt that it will ever look as sweet as some have neovim on a tiling window manager, but Emacs can open file trees in its own window manager, provided you can keep in your head what is running where.

Additionally, since Emacs is always started as a client, the kill-ring is shared between all instances, which means you don't have to copy and paste on a terminal level.

Justification over, my configuration is incredibly simple, mostly just toggling default settings, lending to how productive my workflow is outside of the Emacs ecosystem. In other words, I don't take advantage of the full power of Emacs because I don't need it.

Most adornments are disabled to look cleaner in a terminal emulator, including the menu bar and mode line. Tabs are enabled by default, but since Emacs is addicted to alignment instead of indentation, a few lines to attempt this change is an uphill battle. Some other minor tweaks, like line numbers and word wrap, are enabled as well.

All backups are now located in `~/.cache/backups` (**not** changed based on environment variables, if you set `$XDG_CACHE_HOME` to something else, you *must* change it here too)

Colors are tweaked to be readable with a translucent terminal, but may appear too monotone on flat backgrounds.
