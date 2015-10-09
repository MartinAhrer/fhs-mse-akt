docker create --name ubuntu-container -v /opt/database ubuntu:14.04 /bin/bash
docker inspect container ubuntu-container
docker rm ubuntu-container

mkdir $HOME/docker
docker run --name ubuntu-container -v $HOME/docker:/opt/database ubuntu:14.04 /bin/bash -c "touch /opt/database/touched.txt"
ll $HOME/docker
