#!/bin/sh
function cleanup {
  echo "Syncing /config to /data/config"
  cp -r /config/* /data/config/
}

trap cleanup EXIT

if [ ! -d "/data/config" ] 
then
    echo "Directory /data/config DOES NOT exists." 
else
    echo "Directory /data/config DOES exists."
    echo "Syncing /data/config to /config"
    cp -r /data/config/* /config/
fi
/init

