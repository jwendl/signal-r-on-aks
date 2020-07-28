#!/bin/bash

while getopts ":r:c:t:" arg; do
    case $arg in
        r) RegistryName=$OPTARG;;
        c) ContainerName=$OPTARG;;
        t) Tag=$OPTARG;;
    esac
done

usage() {
    script_name=`basename $0`
    echo "Please use ./$script_name -r container-registry -c container-name -t tag"
}

if [ -z "$RegistryName" ]; then
    usage
    exit 1
fi
if [ -z "$ContainerName" ]; then
    usage
    exit 1
fi
if [ -z "$Tag" ]; then
    usage
    exit 1
fi

pushd ../../src/server/Wearables.SyncService
docker build -t $ContainerName:$Tag .
az acr login --name $RegistryName
docker build -t $RegistryName.azurecr.io/$ContainerName:$Tag .
docker push $RegistryName.azurecr.io/$ContainerName
popd
