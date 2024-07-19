# Sphinx

GitLab CI/CD Component to build documentation website with Sphinx.

## Usage

Add

```
include:
  - component: $CI_SERVER_FQDN/rse/docker/images/sphinx-doc/sphinx-doc@2.1.4
    inputs:
      stage: build
      dir: docs
```

to your `.gitlab-ci.yml`.

## Local Usage

### Docker Compose

Add

```
services:
  sphinx-doc:
    image: "docker-private.gesis.intra/rse/docker/images/sphinx-doc:2.1.4"
    volumes:
      - type: bind
        source: docs
        target: /mnt/docs
        read_only: true
      # Create volume to avoid the container overwrite build
      - sphinx-doc-build:/mnt/docs/build
    expose:
      - "8000"
    ports:
      - "8000:8000"
    command: sphinx-autobuild --host 0.0.0.0 /mnt/docs/source /mnt/docs/build

volumes:
  sphinx-doc-build:
```

to your `compose.yml`

### Docker

```bash
cd /path/to/your/sphinx-doc-project
```

```bash
docker run -ti --rm \
  -v $PWD:/mnt \
  docker-private.gesis.intra/rse/docker/images/sphinx-doc:2.1.4 \
  bash -c "cd /mnt && make html"
```
