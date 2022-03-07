#!/bin/bash -ex

UBUNTU_VERSION=$1
NAME=$2

TAG="${NAME}/ubuntu-fixuid:${UBUNTU_VERSION}"
: ${PLATFORMS:="linux/amd64,linux/arm,linux/arm64"}

sed -e "s|@UBUNTU_VERSION@|${UBUNTU_VERSION}|g" \
	-e "s|@USER@|${NAME}|g" \
	-e "s|@GROUP@|${NAME}|g" Dockerfile.in > Dockerfile

PUSH_ARG=""
if [ "x${PUSH}" = "xy" ]; then
	PUSH_ARG="--push"
	echo "Enabled pushing for multi arch build"
fi

if [ "x${MULTI_ARCH}" != "xy" ]; then
	DOCKER_BUILDKIT=1 docker build -t ${TAG} .
else
	echo "Building for platforms: ${PLATFORMS}"
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --platform ${PLATFORMS} -t ${TAG} . ${PUSH_ARG}
fi

