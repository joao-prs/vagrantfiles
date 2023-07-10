# run as root

mkdir -p /home/vagrant/portainer/volume
cat << EOF >> /home/vagrant/portainer/docker-compose.yaml
version: "3"
services:
  portainer:
    image: portainer/portainer-ce:latest
    ports:
      - 9000:9000
    volumes:
      - data:/data
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
volumes:
  data:
EOF
cd /home/vagrant/portainer
#docker-compose up -d
docker stack deploy --compose-file docker-compose.yaml portainer

###############################################################

mkdir -p /home/vagrant/nginx/vol
cat << EOF >> /home/vagrant/nginx/docker-compose.yaml
version: "3"
services:
  web:
    image: nginx
    volumes:
    - ./templates:/etc/nginx/templates
    ports:
    - "80:80"
    environment:
    - NGINX_HOST=foobar.com
    - NGINX_PORT=80
    volumes:
    - /home/vagrant/nginx/vol:/usr/share/nginx/html
EOF
cd /home/vagrant/nginx
#docker-compose up -d
docker stack deploy --compose-file docker-compose.yaml nginx

###############################################################

mkdir /home/vagrant/phpipam
cat << EOF >> /home/vagrant/phpipam/docker-compose.yaml
version: '3.3'
services:
  mysql:
    image: 'mysql:5.6'
    restart: always
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_USER=user
      - MYSQL_PASSWORD=password
      - MYSQL_DATABASE=phpipam
    volumes:
      - mysql_data:/var/lib/mysql
  ipam:
    depends_on:
      - mysql
    image: pierrecdn/phpipam
    ports:
      - "8080:80"
    environment:
      - MYSQL_ENV_MYSQL_ROOT_PASSWORD=password
      - MYSQL_ENV_MYSQL_USER=user
      - MYSQL_ENV_MYSQL_HOST=mysql
      - MYSQL_ENV_MYSQL_DB=phpipam
    volumes:
      - ipam_data:/var/www/html
volumes:
  mysql_data:
    driver: local
  ipam_data:
    driver: local
    driver_opts:
      type: none
      device: "/home/vagrant/volumes/phpipam"
      o: bind
EOF
cd /home/vagrant/phpipam
#docker-compose up -d
docker stack deploy --compose-file docker-compose.yaml phpipam

###############################################################

mkdir -p /home/vagrant/grafana/volume
cat << EOF >> /home/vagrant/grafana/docker-compose.yaml
version: '3.3'
services:
  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - "3000:3000"
    volumes:
      - grafana-mil-grau:/usr/share/grafana
volumes: 
  grafana-mil-grau:
    driver: local
    driver_opts:
      type: none
      device: "/home/vagrant/grafana/volume"
      o: bind
EOF
cd /home/vagrant/grafana
#docker-compose up -d
docker stack deploy --compose-file docker-compose.yaml grafana

###############################################################