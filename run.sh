#!/bin/sh
function cleanup {
    echo "Syncing between /data/config and /config"
    /usr/bin/unison -batch -auto -silent -log -logfile /config/unison.log /data/config /config
}

trap cleanup EXIT

if [ ! -d "/data/config" ] 
then
    echo "Directory /data/config DOES NOT exists." 
else
    echo "Directory /data/config DOES exists."
    echo "Syncing between /data/config and /config"
    /usr/bin/unison -batch -auto -silent -log -logfile /config/unison.log /data/config /config
fi
/init
