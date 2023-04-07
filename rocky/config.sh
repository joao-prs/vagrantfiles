# install Cockpit for you to access the web console
# you password & user is "vagrant"
dnf install -y cockpit
systemctl start cockpit.socket
systemctl enable cockpit.socket

# change ssh welcome
dnf install -y neofetch
cat <<EOF>> /home/vagrant/.bashrc

# MY CUSTOM CONFIGURATION *joao-prs*
# you can remove it
neofetch
EOF