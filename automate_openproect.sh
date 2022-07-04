#! /bin/bash  -x

# To update ubuntu environment
sudo apt update

# To upgrade ubuntu environment
sudo apt upgrade -y

# To install docker
sudo apt install docker.io

# To start docker
sudo service docker start

# To check the status of docker container if it is running
sudo service docker status

# To install the webserver nginx
sudo apt install nginx -y

# To start nginx webserver
sudo service nginx start

# To check the status of nginx if it is running
sudo service nginx status

# To create directories openproject directories
sudo mkdir -p /var/lib/openproject/pgdata
sudo mkdir -p /var/lib/openproject/static

# To run openproject on a docker container
docker run -d -p 8080:80 --name openproject -e SECRET_KEY_BASE=secret \
 -v /var/lib/openproject/pgdata:/var/openproject/pgdata \
 -v /var/lib/openproject/static:/var/openproject/assets \
openproject/community:10
