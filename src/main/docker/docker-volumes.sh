# Run in virtualbox/vmware!

# Exercise 1
docker create --name data-container -v /opt/database ubuntu:14.04 /bin/bash
docker inspect container data-container
docker rm data-container

# Exercise 2
mkdir $HOME/docker
docker run --name data-container --rm -v $HOME/docker:/opt/database ubuntu:14.04 /bin/bash -c "touch /opt/database/touched.txt"
ll $HOME/docker
rm $HOME/docker/touched.txt

# Exercise 3
docker create --name data-container -v /opt/database ubuntu:14.04 /bin/bash
# Note that we didn't start data-container

docker run --rm --name server-container --volumes-from data-container ubuntu:14.04 /bin/bash -c "touch /opt/database/touched.txt"
docker run --rm --name server-container --volumes-from data-container ubuntu:14.04 /bin/bash -c "ls /opt/database"
sudo ls `docker inspect --format='{{(index .Mounts 0).Source}}' data-container`
