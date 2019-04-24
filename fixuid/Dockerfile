FROM golang:1.11-alpine3.8 as builder

RUN apk add --no-cache git

WORKDIR /src
RUN git clone https://github.com/boxboat/fixuid 

WORKDIR /src/fixuid
RUN git checkout -b work e4c4a04f89b0ba0d951b1fea961291f760c4275c
RUN ./build.sh

############
FROM ubuntu:18.10

ARG USER=softnautic
ARG USER_ID=1000
ARG GROUP=softnautic
ARG GROUP_ID=1000
ENV FIXUID=/usr/local/bin/fixuid

# Create new user
RUN \
    addgroup --gid ${GROUP_ID} ${GROUP} && \
    adduser --uid ${USER_ID} --ingroup ${GROUP} --disabled-password --gecos "" ${USER}

COPY --from=builder /src/fixuid/fixuid ${FIXUID}
RUN \
    chown root:root ${FIXUID} && \
    chmod 4755 ${FIXUID} && \
    mkdir -p /etc/fixuid && \
    printf "user: ${USER}\ngroup: ${GROUP}\n" > /etc/fixuid/config.yml

ENTRYPOINT ["/usr/local/bin/fixuid"]

