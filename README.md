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
# run image
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

```
