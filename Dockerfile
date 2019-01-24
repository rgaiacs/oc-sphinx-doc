FROM debian:9

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Europe/Berlin" > /etc/timezone \
        && dpkg-reconfigure -f noninteractive tzdata

RUN apt update

COPY apt.list /tmp
COPY pip.list /tmp

RUN xargs -a /tmp/apt.list apt-get install -y
RUN pip3 install -r /tmp/pip.list