Running docker on debian jessie
==============

To clone this script and update from wherever you are:  
```
sudo apt-get update
sudo apt-get install git-core -y
# copy your github private key to .ssh then
chmod 600 ~/.ssh/gihub_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_rsa
git clone git@github.com:dsikar/docker.git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global push.default simple
```

Then run 
```
. ~/docker/docker-debian-jessie-install.sh
```

Once installed:  

```
# add yourself to docker group
sudo usermod -aG docker dsikar
# search images
docker search httpd
# run container
docker run hello-world
# run in detached mode (background)
docker run -d -P tomcat:7
docker run -d -P httpd
docker run -d -P nginx
# determine port mapping
docker ps
```

![Docker images running in detached mode](https://c2.staticflickr.com/2/1616/25690945623_1c5a231d0d_o.png)

More options:
```
# map port
docker run -d -p 80:80 nginx:1.7
# run command 
docker run -d centos:7 ping 127.0.0.1 -c 10
# create image by committing
docker commit 62011d37c135 dsikar/myhttpd:1.0
# list images
docker images
# create Dockerfile and build
docker build -t dsikar/testimage:1.0 .
# use CMD and ENTRYPOINT in Dockerfile
# run container
docker run -it dsikar/testimage:1.1
# stop all containers
docker ps | awk '{ system("docker stop " $1) }'
# remove all containers
docker ps -a | awk '{ system("docker rm " $1) }'
# delete all local images
docker images | awk '{ system("docker rmi " $3) }'
# push an image
# 1. create repository on hub.docker.com
# 2. create image with same repository name as in 1.
# 3. login to docker
docker login
# push
docker push dsikar/supa-repo:1.0
# pull
docker pull dsikar/supa-repo:1.0
# mount local directory to container
docker run -itv /home/dsikar/docker:/test/docker test:1.0 bash
# linking containers (and naming)
docker run -d --name database mysql
docker run -it --name www --link database:db ubuntu:14.04 bash
# inside container
cat /etc/hosts
# outside container ~ local IPs match
docker inspect database

# access running container
docker exec -it a11f94e58463 bash

# automated builds with github
# 1. create github repository ~ must contain Dockerfile
# 2. link hub.docker.com repo with github repo
# 3. commit changes ~ docker will autobuild

# viewing logs
 docker logs -f --tail 1 stupefied_archimedes

 # inspect JSON output
 docker inspect --format='{{.NetworkSettings.IPAddress}}' backstabbing_noether

 # kill docker
 sudo kill $(pidof docker)



```
