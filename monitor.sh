#!/usr/bin/env bash

set -e

run() {
    if [ "$running" = true ]; then
        echo "Already running"
    else
        running=true
        "$@" || true
        running=false
    fi
}

while true; do 
    echo -ne "HTTP/1.0 200 OK\r\n\r\n" | nc -Nl -p "$LISTEN_PORT"
    run "$@" &
done
