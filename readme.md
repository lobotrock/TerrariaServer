# Starting a terraria dedicated server in docker in Linux

This will create a dockerized server of Terraria 1.4.0.3 and port 7777.  It saves the world files in the directory `World`.

## Requirements
- [Docker](https://docs.docker.com/get-docker/)
- [Unzip](https://code.launchpad.net/ubuntu/+source/unzip)
- [Curl](https://github.com/curl/curl)
- [Terraria server config file](https://terraria.gamepedia.com/Server#Server_config_file) named `terraria_config.txt`

## How to start server
```bash
./start_server.sh
```

Or to start in a detached screen:
```bash
screen -d -m ./start_server.sh 
```