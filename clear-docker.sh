#!/bin/bash

echo "Listing containers..."
containers=$(docker ps -qa)
echo "containers: $containers"

if [ ! -z "$containers" ]
then
    echo "Stopping containers..."
    docker stop $containers
    echo "Removing containers..."
    docker rm $containers
else
    echo "No containers found"
fi

echo "Listing images..."
images=$(docker images -qa)
echo "images: $images"

if [ ! -z "$images" ]
then
    echo "Removing images..."
    docker rmi -f $images
else
    echo "No images found"
fi

echo "Listing volumes..."
volumes=$(docker volume ls -q)
echo "volumes: $volumes"

if [ ! -z "$volumes" ]
then
    echo "Removing volumes..."
    docker volume rm $volumes
else
    echo "No volumes found"
fi

echo "Listing networks..."
networks=$(docker network ls -q)
echo "networks: $networks"

if [ ! -z "$networks" ]
then
    echo "Removing networks..."
    docker network rm $networks
else
    echo "No networks found"
fi

echo "These should not output any items:"
docker ps -a
docker images -a 
docker volume ls

echo "This should only show the default networks:"
docker network ls


# docker stop (docker ps -qa);
# docker rm (docker ps -qa);
# docker rmi -f (docker images -qa);
# docker volume rm (docker volume ls -q);
# docker network rm (docker network ls -q);