#needed that gnome-terminal must not be started with dbus-launch gnome-terminal
echo "LANG=en_US.UTF-8" > /etc/default/locale

cp make.conf /etc/portage/
eselect profile list
eselect profile set 18
emerge --ask --update --deep --newuse @world
USE="systemd" emerge --ask --update --deep --newuse @world
USE="systemd" emerge --ask vim dev-vcs/git sudo

USE="systemd gusb introspection policykit systemd" emerge --ask --update --deep --newuse @world
USE="systemd" emerge gdm gnome gnome-terminal nautilus chromium --ask

