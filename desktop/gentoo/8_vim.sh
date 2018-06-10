cp make.conf /etc/portage/
eselect profile list
eselect profile set 18
emerge --ask --update --deep --newuse @world
USE="systemd" emerge --ask --update --deep --newuse @world
USE="systemd" emerge --ask vim dev-vcs/git sudo

USE="systemd gusb introspection policykit systemd" emerge --ask --update --deep --newuse @world
USE="systemd" emerge gdm gnome gnome-terminal nautilus chromium --ask

