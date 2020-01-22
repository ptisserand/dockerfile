#!/bin/bash -ex

UBUNTU_VERSION=$1
NAME=$2

sed -e "s|@UBUNTU_VERSION@|${UBUNTU_VERSION}|g" \
	-e "s|@USER@|${NAME}|g" \
	-e "s|@GROUP@|${NAME}|g" Dockerfile.in > Dockerfile

DOCKER_BUILDKIT=1 docker build -t ${NAME}/ubuntu-fixuid:${UBUNTU_VERSION} .


