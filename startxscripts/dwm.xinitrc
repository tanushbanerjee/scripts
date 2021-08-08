# xinitrc runs automatically when you run startx
# There are some small but important commands that need to be run when we start the graphical environment,
# I keep those commands in ~/.xprofile


nitrogen --restore
xcompmgr &
dwmblocks &
dunst &
unclutter &
# This script is called on startup to remap keys.
# Increase key speed via a rate change
xset r rate 300 50
# Map the caps lock key to super...
setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
# Map the menu button to right super as well.
xmodmap -e 'keycode 135 = Super_R'
# Turn off the caps lock if on since there is no longer a key for it.
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock
# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)

# Here we start DynamicWM
# The loop is just to enable DynamicWM restart feature

while :; do
	ssh-agent dwm || break
done
