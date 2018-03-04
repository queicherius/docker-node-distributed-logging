#!/bin/sh

echo "[SETUP] Waiting for elasticsearch to start"
until wget -qO- http://elasticsearch:9200/ >/dev/null 2>&1
do
  sleep 1
done

echo "[SETUP] Writing cronjob configuration"
export FILTERS='[{"filtertype":"age","source":"creation_date","direction":"older","unit":"days","unit_count":45}, {"filtertype":"pattern","kind":"prefix","value":"logs"}]'
echo "0 1 * * * curator_cli --host elasticsearch delete_indices --filter_list '$FILTERS'" > /etc/crontabs/root

echo "[SETUP] Starting cronjob"
crond -f
