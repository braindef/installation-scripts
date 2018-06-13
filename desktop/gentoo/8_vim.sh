#needed that gnome-terminal must not be started with dbus-launch gnome-terminal
echo "LANG=en_US.UTF-8" > /etc/default/locale

cp make.conf /etc/portage/

nano /etc/portage/make.conf

eselect profile set 18

emerge --update --deep --newuse @world

emerge --update vim dev-vcs/git sudo

emerge --update --deep --newuse @world

#emerge --update gdm gnome gnome-terminal nautilus

