#!/bin/bash
if curl -s --unix-socket /var/run/docker.sock http/_ping 2>&1 >/dev/null
then
    echo "docker is going down"
    docker stop myHttpd > /dev/null 2>&1
    docker stop mySqlDB > /dev/null 2>&1
fi