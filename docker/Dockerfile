FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN apt update
COPY apt.list /tmp
COPY pip.list /tmp
RUN grep -v "^#" /tmp/apt.list | xargs apt-get install -y
RUN grep -v "^#" /tmp/pip.list | pip3 install -r /dev/stdin
