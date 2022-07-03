#! /bin/bash  -x

# To udate and upgradeubuntu environment
sudo apt update
sudo apt upgrade -y

# To install docker  and  start
sudo apt install docker.io
sudo service docker start
sudo service docker status

# To  install nginx, starting and checking status
sudo apt install nginx -y
sudo service nginx start
sudo service nginx status

# To create two directories on openproject
sudo mkdir -p /var/lib/openproject/pgdata
sudo mkdir -p /var/lib/openproject/static

# To run openproject on docker container
docker run -d -p 8080:80 --name openproject -e SECRET_KEY_BASE=secret \
 -v /var/lib/openproject/pgdata:/var/openproject/pgdata \
 -v /var/lib/openproject/static:/var/openproject/assets \
openproject/community:10
