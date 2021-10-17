#!/bin/bash

# Don prince 2021/01/17

echo ######## install packages
sudo apt update && sudo apt -y install xorg lightdm xfce4 tango-icon-theme gnome-icon-theme dbus-x11 tightvncserver xfonts-base thunar-volman udisks2 gvfs

echo ######## start vncserver and set password
touch ~/.Xresources
vncserver :1
ps -ef | grep Xtightvnc
vncserver -kill :1

echo ######## xstartup script
cat <<EOF | sudo tee ~/.vnc/xstartup
#!/bin/sh

xrdb $HOME/.Xresources
#xsetroot -solid grey
#x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#x-window-manager &
# Fix to make GNOME work
export XKL_XMODMAP_DISABLE=1
#/etc/X11/Xsession
#xfce4-session&
/etc/X11/Xsession /usr/bin/startxfce4 &
EOF
chmod 755 /home/vnc/.vnc/xstartup

echo ######## vnc start/stop/restart script
cat <<'EOF' | sudo tee /usr/local/bin/tightvncserver
#!/bin/bash
PATH="$PATH:/usr/bin/"
DISPLAY="1"
DEPTH="16"
GEOMETRY="1024x768"
OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY}"

case "$1" in
start)
/usr/bin/vncserver ${OPTIONS}
;;

stop)
/usr/bin/vncserver -kill :${DISPLAY}
;;

restart)
$0 stop
$0 start
;;
esac
exit 0
EOF
sudo chown root:root /usr/local/bin/tightvncserver
sudo chmod 755 /usr/local/bin/tightvncserver