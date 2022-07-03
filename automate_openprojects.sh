#! /bin/bash  -x

sudo apt update
sudo apt upgrade -y
sudo apt install docker.io
sudo service docker start
sudo service docker status
sudo apt install nginx -y
sudo service nginx start
sudo service nginx status
sudo mkdir -p /var/lib/openproject/pgdata
sudo mkdir -p /var/lib/openproject/static
docker run -d -p 8080:80 --name openproject -e SECRET_KEY_BASE=secret \
 -v /var/lib/openproject/pgdata:/var/openproject/pgdata \
 -v /var/lib/openproject/static:/var/openproject/assets \
openproject/community:10

