FROM node:4

MAINTAINER Patrice Tisserand <p.tisserand@gmail.com>
LABEL version="0.13.1" \
      description="Node-Red: A visual tool for wiring the Internet of Things" \
      website="http://nodered.org/"

RUN npm install -g node-red@0.13.1

EXPOSE 1880

CMD ["/usr/local/bin/node-red"]

