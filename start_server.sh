#!/bin/bash

if [ ! -d "Linux" ]; then
  # Downloading server
  curl -X GET https://terraria.org/system/dedicated_servers/archives/000/000/036/original/terraria-server-1402.zip?1589675482 --output terraria-server-1402.zip

  # Unzip downloaded server
  unzip -o terraria-server-1402.zip

  # Move Linux resources to current directory
  mv 1402/Linux .

  # Clean up files
  rm -rf 1402
  rm -rf terraria-server-1402.zip
fi

# Creating World Directory if it doesn't exist
mkdir -p World

# Build and run Docker image
docker build -t terraria .
docker run -it -v $(pwd)/World:/terraria/World -p 7777:7777 terraria