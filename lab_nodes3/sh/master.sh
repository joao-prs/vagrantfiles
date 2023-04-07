#!/bin/bash
chmod -R 777 /etc/motd
cat << EOF >> /etc/motd
#################
#               #
#  master node  #
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
cat <<EOF > /home/vagrant/.ssh/id_ed25519
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBr73XW7Kye4cfXoCa6LmzXjq6suUSxxxrz3wIuWs4QqwAAAKg+O2g/Pjto
PwAAAAtzc2gtZWQyNTUxOQAAACBr73XW7Kye4cfXoCa6LmzXjq6suUSxxxrz3wIuWs4Qqw
AAAED4/+/euu+W67tgHFvbqv1RkUaf4I0kc/89TbekU4Pz9WvvddbsrJ7hx9egJroubNeO
rqy5RLHHGvPfAi5azhCrAAAAHnZhZ3JhbnRAdWJ1bnR1MjIwNC5sb2NhbGRvbWFpbgECAw
QFBgc=
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 600 /home/vagrant/.ssh/id_ed25519

cat <<EOF > /home/vagrant/.ssh/id_ed25519.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvvddbsrJ7hx9egJroubNeOrqy5RLHHGvPfAi5azhCr vagrant@ubuntu2204.localdomain
EOF



cat <<EOF > /home/vagrant/file_teste
aplksdfnjkpalsdjfnpasodknfjpKLWNFDPALKSNDFPKLN KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
a mae do david
EOF

# change permissions
chown vagrant:vagrant -R /home/vagrant


su vagrant -c "scp -o StrictHostKeyChecking=no /home/vagrant/file_teste vagrant@10.8.0.103:~/"
