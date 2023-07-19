**DOCKER LAB**

For this lab we require to build a web server publishing a website, you can chose one free css template from sites like this <https://www.free-css.com/free-css-templates>, download the zip file with the assets and use them to build your container image

-   Write a bash file to perform the following tasks:

-   Create a container image using a web server base that contains this website and can be used to publish it just matching the ports

-   Using the Docker CLI, create a container using this image and mapping the port 8080 from the host.

-   Using the Docker CLI, create a MYSQL container linked with the website container. Try to validate the connection between the website container and the mysql container ← extra points

-   Create a docker compose YAML file to build the same infrastructure using the website container image and the mysql container in a different network than the previous containers

-   Create a bash file to deploy this docker compose infrastructure

At the end of this labs you will have two bash files and a docker compose YAML file