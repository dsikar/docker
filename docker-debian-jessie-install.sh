#!/usr/bin

# Commmands pretty much copied and pasted from
# https://docs.docker.com/engine/installation/linux/debian/

# NB sudo su before running

apt-get purge lxc-docker*
apt-get purge docker.io*
apt-get update
apt-get install apt-transport-https ca-certificates -y
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-cache policy docker-engine
apt-get update
apt-get install docker-engine -y
service docker start
docker run hello-world



