# Frp

## How to use this container

This container is configured by two environment variables:

`$MODE`: configures frp in "server" or "client" mode

`$CONFIG`: inline frp configuration ([documentation](https://github.com/fatedier/frp#configuration-files))

## Example usage

### Server

```bash
CONFIG="
    [common]
    server_port = 7000
"

docker run --rm -it -e MODE="server" -e "CONFIG=$CONFIG" place1/frp
```

### Client

```bash
CONFIG="
    [common]
    server_addr = x.x.x.x
    server_port = 7000

    [web]
    type = http
    local_port = 80
    custom_domains = www.example.com
"

docker run --rm -it -e MODE="client" -e "CONFIG=$CONFIG" place1/frp
```
