#!/bin/bash

echo "####################################################"
echo "RUN AND BUILD SOURCE CODE IN DOCKER CONTAINER."
echo "####################################################"
docker build -t py_craker . > /dev/null

echo "####################################################"
echo "STARTING DOCKER CONTAINER"
echo "####################################################"
docker run -tid --rm --name breaker py_craker

echo "####################################################"
echo "DETACTTACHING CONTAINER FROM  NETWORK INTERFACE"
echo "####################################################"
docker network disconnect bridge breaker
docker network connect none breaker

echo "####################################################"
echo "GETTING A BASH SHELL INSIDE RUNNING CONTAINER"
echo "####################################################"
docker exec -it breaker /bin/bash

#./pyethrecover.py -w ethereum-wallet.json -f passwords.txt