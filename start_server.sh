#!/bin/bash

if [ ! -d "Linux" ]; then
  # Find latest server download
  docker build -t download-latest-terraria -f ./download_latest_server/Dockerfile ./download_latest_server
  docker run -it -v $(pwd):/output download-latest-terraria
fi

# Creating World Directory if it doesn't exist
mkdir -p World

# Build and run Docker image
docker build -t terraria .
docker run -it -v $(pwd)/World:/terraria/World -p 7777:7777 terraria