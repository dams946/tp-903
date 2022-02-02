#!/bin/bash

export GIT_SHA=$(git rev-parse --short HEAD)
sudo docker login

if [ $? -ne 0 ]
then
    echo "failled to login"
    exit 1
else 
    echo "login succes"
fi

echo "------------------------------------------------------------------"



sudo docker build -t damsdock/motd_ds:$GIT_SHA
if [ $? -ne 0 ]
then
    echo "failled to build"
    exit 1
else 
    echo "build succes"
fi

echo "------------------------------------------------------------------"
sudo docker push damsdock/motd_ds:$GIT_SHA
if [ $? -ne 0 ]
then
    echo "failled to push"
    exit 1
else 
    echo "push succes"
fi