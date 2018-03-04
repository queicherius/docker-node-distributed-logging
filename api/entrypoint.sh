#!/bin/sh

echo "[SETUP] Waiting for elasticsearch to start"
until wget -qO- http://elasticsearch:9200/ >/dev/null 2>&1
do
  sleep 1
done

echo "[SETUP] Running server"
node src/index.js
