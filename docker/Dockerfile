FROM alpine:3.20 as sphinx-doc

ENV PATH="$PATH:/root/.local/bin"

RUN echo "Europe/Berlin" > /etc/timezone

COPY apk.list /tmp
COPY pip.list /tmp
RUN grep -v "^#" /tmp/apk.list | xargs apk add --no-cache
RUN pipx install sphinx && grep -v "^#" /tmp/pip.list | xargs pipx inject sphinx

FROM sphinx-doc as sphinx-autobuild

RUN pipx inject --include-apps sphinx sphinx-autobuild