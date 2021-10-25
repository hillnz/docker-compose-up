#!/usr/bin/env bash

set -e

while true; do 
    echo -ne "HTTP/1.0 200 OK\r\n\r\n" | nc -Nl -p "$LISTEN_PORT"
    "$@" &
done
