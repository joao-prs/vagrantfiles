
############################
#                          #
#    criar phpldapadmin    #
#                          #
############################
#https://computingforgeeks.com/install-and-configure-openldap-phpldapadmin-on-ubuntu/ # tutorial

hostnamectl set-hostname ldap.seasolutions.com

echo "$(hostname -I)ldap.seasolutions.com.br" >> /etc/hosts

sudo apt update

sudo apt -y install slapd ldap-utils

sudo slapcat 

## acho que essa parte da para pular
vim basedn.ldif
dn: ou=people,dc=seasolutions,dc=com
objectClass: organizationalUnit
ou: people
dn: ou=groups,dc=seasolutions,dc=com
objectClass: organizationalUnit
ou: groups

ldapadd -x -D cn=admin,dc=seasolutions,dc=com -W -f basedn.ldif

apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear zip

sudo a2enconf php*-cgi
sudo systemctl reload apache2
apt -y install phpldapadmin

# /usr/share/phpldapadmin                 # change lib and htdocs
sudo vim /etc/php/8.1/apache2/php.ini    # 128MB

# vim /usr/share/phpldapadmin/config/config.php
$servers->setValue('server','name','servidor LDAP');
$servers->setValue('server','host','192.168.121.154');
$servers->setValue('server','base',array('dc=seasolutions,dc=com'));
$servers->setValue('login','bind_id','cn=admin,dc=seasolutions,dc=com');
$config->custom->appearance['hide_template_warning'] = true;

sed -i 's#DocumentRoot /var/www/html#DocumentRoot /usr/share/phpldapadmin/#' /etc/apache2/sites-available/000-default.conf

sudo systemctl restart slapd
sudo systemctl restart apache2

# acesse: ip/phpldapadmin/




















# o servidor deve ser instalado manualmente para este backup funcionar

# apenas faz backup
systemctl stop slapd
cd /var/lib/ldap/
slapcat -l backup-seasolutions02.ldif
mv backup-seasolutions02.ldif /home/vagrant/
systemctl restart slapd
cd -


# esse trecho apenas destroi o banco ativo
systemctl stop slapd
rm -rfv /var/lib/ldap/*
systemctl start slapd


# restaura o backup da home vagrant
systemctl stop slapd
#cd /var/lib/ldap/
rm -rfv /var/lib/ldap/*
slapadd -l /home/vagrant/backup-seasolutions02.ldif
slapindex -v
ls /var/lib/ldap/
ls -lha /var/lib/ldap/
chown openldap:openldap  /var/lib/ldap/*
ls -lha /var/lib/ldap/
systemctl restart slapd
history
