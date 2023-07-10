#!/bin/bash
chmod -R 777 /etc/motd
cat << EOF >> /etc/motd
#################
#               #
#  slave node   #
#               #
#################
EOF

 
# predefined keys for automatic initial communication. (not secure method)
cat <<EOF >>  /home/vagrant/.ssh/authorized_keys

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvvddbsrJ7hx9egJroubNeOrqy5RLHHGvPfAi5azhCr vagrant@ubuntu2204.localdomain
EOF

# change key permissions
chown vagrant:vagrant -R /home/vagrant





# update for installations
apt update

# change ssh welcome
apt install -y neofetch
cat << EOF >> /home/vagrant/.bashrc

# MY CUSTOM CONFIGURATION *joao-prs*
# you can remove it
neofetch
export HISTTIMEFORMAT="%d/%m/%y %T "
EOF

# installation finally
apt install -y docker.io docker-compose


# check if the file exists
sleep 5
while [ ! -f /home/vagrant/tokenfile.sh ]
do
    chmod 764 /home/vagrant/tokenfile.sh
    chown vagrant:vagrant -R /home/vagrant
    su vagrant -c "cd && bash tokenfile.sh"
    sleep 5
done


chmod 764 /home/vagrant/tokenfile.sh
chown vagrant:vagrant -R /home/vagrant
su vagrant -c "cd && bash tokenfile.sh"
