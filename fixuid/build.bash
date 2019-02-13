#!/bin/bash -ex

UBUNTU_VERSION=$1
sed "s|@UBUNTU_VERSION@|${UBUNTU_VERSION}|g" Dockerfile.in > Dockerfile

docker build -t softnautic/ubuntu-fixuid:${UBUNTU_VERSION} .


