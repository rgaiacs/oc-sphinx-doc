FROM python:3.13.7-alpine3.22

ENV PATH="$PATH:/root/.local/bin"

COPY apk.list /tmp
COPY pip.list /tmp
RUN grep -v "^#" /tmp/apk.list | xargs apk add --no-cache
RUN grep -v "^#" /tmp/pip.list | xargs python -m pip install --no-cache-dir