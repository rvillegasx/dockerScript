#!/bin/bash
if curl -s --unix-socket /var/run/docker.sock http/_ping 2>&1 >/dev/null
then
    docker stop myHttpd > /dev/null 2>&1
    docker stop mySqlDB > /dev/null 2>&1
    rm -rf hostit-html > /dev/null 2>&1
    rm hostit* > /dev/null 2>&1
    docker rm myHttpd > /dev/null 2>&1
    docker rm mySqlDB > /dev/null 2>&1
    echo "docker is up"
    wget https://www.free-css.com/assets/files/free-css-templates/download/page293/hostit.zip
    unzip -o hostit.zip
    docker compose up -d
    docker cp ./hostit-html/. myHttpd:/usr/local/apache2/htdocs/
    docker exec -it myHttpd apt-get update > /dev/null 2>&1
    docker exec -it myHttpd apt-get install -y iputils-ping > /dev/null 2>&1
    if docker exec -it myHttpd ping -c 1 mySqlDB | grep -q '64 bytes'
    then
        echo "mysql is connected"
    else
        echo "mysql is down"
    fi
    rm -rf hostit-html > /dev/null 2>&1
    rm hostit* > /dev/null 2>&1
else
    echo "docker is down"
fi
