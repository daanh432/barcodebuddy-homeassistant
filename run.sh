#!/bin/sh
function cleanup {
  echo "Syncing /config to /data/config\n"
  cp -r /config/* /data/config/
}

trap cleanup EXIT

if [ ! -d "/data/config" ] 
then
    echo "Directory /data/config DOES NOT exists.\n" 
else
    echo "Directory /data/config DOES exists.\n"
    echo "Syncing /data/config to /config\n"
    cp -r /data/config/* /config/
fi
/init

