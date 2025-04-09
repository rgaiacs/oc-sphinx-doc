FROM alpine:3.21.3

ENV PATH="$PATH:/root/.local/bin"

RUN echo "Europe/Berlin" > /etc/timezone

COPY apk.list /tmp
COPY pip.list /tmp
RUN grep -v "^#" /tmp/apk.list | xargs apk add --no-cache
RUN pipx install sphinx && pipx inject --include-apps sphinx sphinx-autobuild && grep -v "^#" /tmp/pip.list | xargs pipx inject sphinx