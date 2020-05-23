# Starting a terraria dedicated server in docker in Linux

This will create a dockerized server of Terraria in the latest verion, and run at port 7777.  It saves the world files in the directory `World`.


## Requirements
- [Docker](https://docs.docker.com/get-docker/)
- [Terraria server config file](https://terraria.gamepedia.com/Server#Server_config_file) named `terraria_config.txt`

## How to start server
```bash
./start_server.sh
```

Or to start in a detached screen:
```bash
screen -d -m ./start_server.sh 
```

You may have to change the owner of the `Linux` directory to the current user using the command `sudo chown -R $(id -u):$(id -g) Linux/`.
