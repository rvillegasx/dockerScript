docker stop myHttpd > /dev/null 2>&1
docker stop mySqlDB > /dev/null 2>&1
docker rm myHttpd > /dev/null 2>&1
docker rm mySqlDB > /dev/null 2>&1
wget https://www.free-css.com/assets/files/free-css-templates/download/page293/hostit.zip
unzip hostit.zip
rm hostit* > /dev/null 2>&1
docker run --rm -d -p 8080:80 --name myHttpd httpd
docker cp ./hostit-html/. myHttpd:/usr/local/apache2/htdocs/
rm -rf hostit-html > /dev/null 2>&1
docker run -d --name mySqlDB -e MYSQL_ROOT_PASSWORD=secret mysql
docker exec -it myHttpd apt-get update > /dev/null 2>&1
docker exec -it myHttpd apt-get install -y iputils-ping > /dev/null 2>&1
if docker exec -it myHttpd ping -c 1 172.17.0.3 | grep -q '64 bytes'
then
    echo "mysql is connected"
else
    echo "mysql is down"
fi