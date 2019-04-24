FROM python:3.7.3-alpine as base
LABEL maintainer="Patrice Tiserand <p.tisserand@gmail.com>"

##########
FROM base as builder

RUN mkdir /install
WORKDIR /install
RUN pip install --install-option="--prefix=/install" mcrcon

##########
FROM base
LABEL org.opencontainers.image.description="Python module for communication within Minecraft server"

COPY --from=builder /install /usr/local
