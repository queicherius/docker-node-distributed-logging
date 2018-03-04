#!/bin/sh

echo "[SETUP] Waiting for elasticsearch to start"
until curl -f http://elasticsearch:9200/ >/dev/null 2>&1
do
  sleep 1
done

echo "[SETUP] Setting node name to '$(cat /etc/hostname)'"
export NODE_NAME=$(cat /etc/hostname)

echo "[SETUP] Running metricbeat"
metricbeat -system.hostfs=/hostfs
