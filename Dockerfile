FROM ubuntu:20.04

COPY Linux/ /terraria
RUN chmod +x /terraria/TerrariaServer
RUN chmod +x /terraria/TerrariaServer.bin.x86
RUN chmod +x /terraria/TerrariaServer.bin.x86_64

COPY terraria_config.txt /terraria/terraria_config.txt

WORKDIR /terraria/

EXPOSE 7777

CMD ["./TerrariaServer", "-config terraria_config.txt"]