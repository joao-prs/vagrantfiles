#!/bin/bash
chmod -R 777 /etc/motd
cat << EOF >> /etc/motd
#################
#               #
#  slave node   #
#               #
#################
EOF

#apt update

# change ssh welcome
#apt install -y neofetch
cat << EOF >> /home/vagrant/.bashrc

# MY CUSTOM CONFIGURATION *joao-prs*
# you can remove it
neofetch
export HISTTIMEFORMAT="%d/%m/%y %T "
EOF



# predefined keys for automatic initial communication. (not secure method)
cat <<EOF >>  /home/vagrant/.ssh/authorized_keys

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvvddbsrJ7hx9egJroubNeOrqy5RLHHGvPfAi5azhCr vagrant@ubuntu2204.localdomain
EOF

# change key permissions
chown vagrant:vagrant -R /home/vagrant
