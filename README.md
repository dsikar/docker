Running docker on debian jessie
==============

To clone this script:  
```
sudo apt-get update
sudo apt-get install git-core
# copy your github private key to .ssh then
chmod 600 ~/.ssh/gihub_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_rsa
git clone git@github.com:dsikar/docker.git
```

Then run 
```
sudo su
. docker/docker-debian-jessie-install.sh
```
