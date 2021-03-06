FROM ubuntu:15.04
MAINTAINER Patrice Tisserand <p.tisserand@gmail.com>

RUN apt-get install -y software-properties-common && apt-add-repository ppa:webupd8team/java && apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java7-installer

# Install Deps
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python curl unzip

# Install Android SDK
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R root.root android-sdk-linux

# Android SDK environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools


COPY tools /opt/tools
ENV PATH ${PATH}:/opt/tools

RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk --no-ui --all --filter platform-tools,tools,build-tools-23,build-tools-23.0.1,build-tools-23.0.1,android-19,android-21,android-22,android-23,addon-google_apis_x86-google-21,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-23"]
# Android SDK tools CLI updating is broken in 24.4.1
RUN ["/opt/tools/android-sdk-update-fix.sh"]

# To have X display
RUN apt-get install -y libswt-gtk-4-java

# Cleaning
RUN apt-get clean

