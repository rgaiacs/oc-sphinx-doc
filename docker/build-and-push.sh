#!/bin/sh

#set -e
#set -o pipefail

REGISTRY_URI=docker-private-snapshots.gesis.intra
if [ -n "`echo $IMAGE_VERSION | grep -e '.*SNAPSHOT'`" ]
  then REGISTRY_URI=docker-private-snapshots.gesis.intra
  else REGISTRY_URI=docker-private-releases.gesis.intra
fi

docker build -t $REGISTRY_URI/$IMAGE_NAME:$IMAGE_VERSION ./docker
docker push     $REGISTRY_URI/$IMAGE_NAME:$IMAGE_VERSION
docker rmi -f   $REGISTRY_URI/$IMAGE_NAME:$IMAGE_VERSION
