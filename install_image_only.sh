#!/bin/bash
# Script to Create a Container for LEMP, using Docker

# 1. Download git repository
git clone https://github.com/robertoarcomano/DockerLemp.git /tmp/DockerLemp

# 2. Download Dockerfile and create image
docker rmi -f robertoarcomano/dockerlemp
docker build -t robertoarcomano/dockerlemp /tmp/DockerLemp

# 3. Delete /tmp/Dockerfile
rm -rf /tmp/DockerLemp
