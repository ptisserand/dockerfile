FROM ubuntu:18.04
LABEL maintainer="Patrice Tisserand <p.tisserand@gmail.com>"

RUN apt-get update && \
    apt-get install -y curl git openjdk-8-jdk-headless && \
    apt-get clean

RUN useradd -m minecraft
USER minecraft
