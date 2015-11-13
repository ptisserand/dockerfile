FROM ptisserand/android-sdk
MAINTAINER Patrice Tisserand <p.tisserand@gmail.com>

# Required for java workaround when using awesome wm
RUN apt-get -y install suckless-tools

# Install Android Studio
RUN cd /opt && wget --output-document=android-studio.zip --quiet https://dl.google.com/dl/android/studio/ide-zips/1.4.1.0/android-studio-ide-141.2343393-linux.zip && unzip android-studio.zip && rm -f android-studio.zip

COPY tools /opt/tools

RUN apt-get clean

# Android studio require SDK source code download
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk --no-ui --all --filter build-tools-23.0.2,source-23"]

CMD ["/opt/tools/awesome-android.sh"]

