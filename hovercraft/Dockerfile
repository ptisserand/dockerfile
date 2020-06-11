FROM python:3.8

LABEL maintainer="Patrice Tisserand <p.tisserand@gmail.com>" \
      version="2.7" \
      description="Hovercraft" \
      webiste="https://hovercraft.readthedocs.org"

ARG USER=rob
ARG USER_ID=1000
ARG GROUP=rob
ARG GROUP_ID=1000

RUN pip3 install hovercraft==2.7

# Added local user
RUN addgroup --gid ${GROUP_ID} ${GROUP} \
      && adduser --uid ${USER_ID} --ingroup ${GROUP} --disabled-password --gecos "" ${USER}

USER ${USER}
WORKDIR /workdir
ENTRYPOINT ["/usr/local/bin/hovercraft"]
CMD []

