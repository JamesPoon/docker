# create bridge network
docker network create -d bridge --gateway 172.16.18.1 --subnet 172.16.18.0/24 hadoop

