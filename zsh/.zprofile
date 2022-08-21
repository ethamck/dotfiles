export PATH="$PATH:/home/ethamck/.local/bin:/home/ethamck/.guix-profile/bin"
export EDITOR="emacs"
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM="wayland;xcb"
export QT_STYLE_OVERRIDE=adwaita-dark
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
GUIX_PROFILE="/home/ethamck/.guix-profile" . "$GUIX_PROFILE/etc/profile"

# GPU garbage (you probably don't want any of this)
export DRI_PRIME=1
export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi

source .profile

sway
