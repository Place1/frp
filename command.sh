#!/bin/sh
set -eo pipefail

echo "$CONFIG" > /frp.ini

case $MODE in
  "server")
    frps -c "/frp.ini"
  ;;
  "client")
    frpc -c "/frp.ini"
  ;;
  *)
    echo "'\$MODE' must be either 'server' or 'client' but was set to '$MODE'"
    exit 1
  ;;
esac
