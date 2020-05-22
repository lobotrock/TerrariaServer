#!/bin/bash

if [ ! -d "Linux" ]; then
  # Downloading server
  curl -X GET https://terraria.org/system/dedicated_servers/archives/000/000/037/original/terraria-server-1403.zip?1590018631 --output terraria-server.zip

  # Unzip downloaded server
  unzip -o terraria-server.zip

  # Move Linux resources to current directory
  mv 1403/Linux .

  # Clean up files
  rm -rf 1403
  rm -rf terraria-server.zip
fi

# Creating World Directory if it doesn't exist
mkdir -p World

# Build and run Docker image
docker build -t terraria .
docker run -it -v $(pwd)/World:/terraria/World -p 7777:7777 terraria