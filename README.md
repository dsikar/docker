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
