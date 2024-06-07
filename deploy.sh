#!/bin/bash

# Remove containers
docker rm -f $(docker ps -a -q)

docker network create lab-9-network
# Create volume
docker volume create my_volume
# Build images
docker build -t flask-app-lab-9-image flask-app
docker build -t mysql-lab-9-image db
# Build images (flask-app + mysql)
 
#run the mysql container
docker run -d \
    --name mysql \
    --network lab-9-network \
    mysql-lab-9-image

#run the flask-app container
docker run -d \
    --name flask-app \
    --network lab-9-network \
    -e MYSQL_ROOT_PASSWORD=password \
    flask-app-lab-9-image



#run the nginx container
docker run -d \
    --name my_nginx \
    -p 80:80 \
    --network lab-9-network \
    --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
    nginx:latest


#show running container 

docker ps -a
