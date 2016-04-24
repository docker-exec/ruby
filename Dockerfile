FROM        debian:8.0
MAINTAINER  andystanton
RUN         apt-get -qq -y update && \
            apt-get install -y --no-install-recommends ruby && \
            apt-get clean && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD         image-common /tmp/dexec/image-common
VOLUME      /tmp/dexec/build
RUN         apt-get update && apt-get install -y patch
RUN         sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' /root/.profile
ENTRYPOINT  ["bash", "-l", "/tmp/dexec/image-common/dexec-script.sh", "ruby"]
