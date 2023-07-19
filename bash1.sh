if curl -s --unix-socket /var/run/docker.sock http/_ping 2>&1 >/dev/null
then
    echo "docker is up"
    wget https://www.free-css.com/assets/files/free-css-templates/download/page293/hostit.zip
    docker network rm bash1 > /dev/null 2>&1
    docker network create bash1 > /dev/null 2>&1
    docker stop myHttpd > /dev/null 2>&1
    docker stop mySqlDB > /dev/null 2>&1
    docker rm myHttpd > /dev/null 2>&1
    docker rm mySqlDB > /dev/null 2>&1
    docker run --rm -d -p 8080:80 --name myHttpd --net bash1 httpd
    unzip hostit.zip
    docker run -d --name mySqlDB -e MYSQL_ROOT_PASSWORD=secret --net bash1 mysql
    docker cp ./hostit-html/. myHttpd:/usr/local/apache2/htdocs/
    docker exec -it myHttpd apt-get update > /dev/null 2>&1
    docker exec -it myHttpd apt-get install -y iputils-ping > /dev/null 2>&1
    rm -rf hostit-html > /dev/null 2>&1
    rm hostit* > /dev/null 2>&1
    if docker exec -it myHttpd ping -c 1 mySqlDB | grep -q '64 bytes'
    then
        echo "mysql is connected"
    else
        echo "mysql is down"
    fi
else
    echo "docker is down"
fi