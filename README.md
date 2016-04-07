Running docker on Ubuntu Precise
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
. ~/docker/docker-install.sh
```

