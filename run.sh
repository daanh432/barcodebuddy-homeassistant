#!/bin/sh
function cleanup {
    echo "Syncing between /data/config and /config"
    /usr/bin/unison -batch -auto -silent /data/config /config
}

trap cleanup EXIT

if [ ! -d "/data/config" ] 
then
    echo "Directory /data/config DOES NOT exists." 
    echo "Syncing between /data/config and /config"
    mkdir /data/config
    /usr/bin/unison -batch -auto -silent /data/config /config
else
    echo "Directory /data/config DOES exists."
    echo "Syncing between /data/config and /config"
    /usr/bin/unison -batch -auto -silent /data/config /config
fi

/init
