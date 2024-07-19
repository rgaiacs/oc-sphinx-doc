# The current "stable" distribution of Debian is version 12, codenamed bookworm.
# It was initially released as version 12.0 on June 10th, 2023 and its latest update, version 12.6, was released on June 29th, 2024. 
FROM debian:12.6

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN apt update -y
COPY apt.list /tmp
COPY pip.list /tmp
RUN grep -v "^#" /tmp/apt.list | xargs apt-get install -y
RUN pipx install sphinx && grep -v "^#" /tmp/pip.list | xargs pipx inject sphinx
