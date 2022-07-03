#! /bin/bash  -x

# To update and upgrade ubuntu environment
sudo apt update
sudo apt upgrade -y

# To install docker, start and to check status
sudo apt install docker.io
sudo service docker start
sudo service docker status

# To install nginx, starte and to check status
sudo apt install nginx -y
sudo service nginx start
sudo service nginx status

# To create directories in openproject and run docker
sudo mkdir -p /var/lib/openproject/pgdata
sudo mkdir -p /var/lib/openproject/static
docker run -d -p 8080:80 --name openproject -e SECRET_KEY_BASE=secret \
 -v /var/lib/openproject/pgdata:/var/openproject/pgdata \
 -v /var/lib/openproject/static:/var/openproject/assets \
openproject/community:10
