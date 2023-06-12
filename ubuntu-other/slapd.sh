
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

apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear

sudo a2enconf php*-cgi
sudo systemctl reload apache2
apt -y install phpldapadmin

# /usr/share/phpldapadmin                 # change lib and htdocs
sudo vim /etc/php/8.1/apache2/php.ini    # 128MB

# /usr/share/phpldapadmin/config/config.php
$servers->setValue('server','name','servidor LDAP');
$servers->setValue('server','host','192.168.121.154');
$servers->setValue('server','base',array('dc=seasolutions,dc=com'));
$servers->setValue('login','bind_id','cn=admin,dc=seasolutions,dc=com');
$config->custom->appearance['hide_template_warning'] = true;

sudo systemctl restart slapd

# acesse: ip/phpldapadmin/