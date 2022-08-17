#!/bin/sh
if [ ! -d "/data/config" ] 
then
    echo "Directory /data/config DOES NOT exists." 
    mv /config /data/config
else
    rm -rf /config
fi
ln -sn /data/config /config
/init
