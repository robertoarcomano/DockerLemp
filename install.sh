#!/bin/bash
# Script to Create a Container for LEMP, using Docker
BRANCH=loadbalancing
IMAGE_WEB=dockerlemp_web
IMAGE_DB=dockerlemp_db
FULL_IMAGE_WEB=robertoarcomano/$IMAGE_WEB
FULL_IMAGE_DB=robertoarcomano/$IMAGE_DB

# 1. Download git repository
git clone -b $BRANCH https://github.com/robertoarcomano/DockerLemp.git /tmp/DockerLemp

# 2. Download Dockerfile_web and create image
docker rmi -f $IMAGE_WEB
docker rmi -f $IMAGE_DB
docker build -t $FULL_IMAGE_WEB -f Dockerfile_web /tmp/DockerLemp
docker build -t $FULL_IMAGE_DB -f Dockerfile_web /tmp/DockerLemp

# 3. Create the container from the image
docker rm -f $FULL_IMAGE_WEB
docker rm -f $FULL_IMAGE_DB
docker create -p 81:80 --name "$IMAGE" $FULL_IMAGE_WEB
docker create -p 3307:3306 --name "$IMAGE" $FULL_IMAGE_DB

# 4. Start the container
docker start $FULL_IMAGE_WEB
docker start $FULL_IMAGE_DB

# 5. Delete /tmp/Dockerfile_web
rm -rf /tmp/DockerLemp
