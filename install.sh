#!/bin/bash
# Script to Create a Container for LEMP, using Docker
IMAGE=dockerlemp
FULL_IMAGE=robertoarcomano/$IMAGE

# 1. Download git repository
git clone https://github.com/robertoarcomano/DockerLemp.git /tmp/DockerLemp

# 2. Download Dockerfile and create image
docker rmi -f $FULL_IMAGE
docker build -t $FULL_IMAGE /tmp/DockerLemp

# 3. Create the container from the image
docker rm -f $IMAGE
docker create -p 81:80 --name "$IMAGE" $FULL_IMAGE

# 4. Start the container
docker start $IMAGE

# 5. Delete /tmp/Dockerfile
rm -rf /tmp/DockerLemp
