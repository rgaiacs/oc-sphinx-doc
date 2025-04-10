# Sphinx

GitLab CI/CD Component to build documentation website with Sphinx.

## Usage

Add

```yaml
include:
  - component: $CI_SERVER_FQDN/rse/docker/images/sphinx-doc/sphinx-doc@2.4.0
    inputs:
      stage: build
      dir: docs
```

to your `.gitlab-ci.yml`.

To have the documentation published using GitLab Pages, add

```yaml
pages:
  stage: .post
  dependencies:
    - build sphinx website
  script:
    - echo Publish documentation to GitLab Pages
  artifacts:
    paths:
      - public
```

to your `.gitlab-ci.yml`.

### `autodoc`

Use of [Sphinx built-in extensions `autodoc`](https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html) is supported.

```yaml
include:
  - component: $CI_SERVER_FQDN/rse/docker/images/sphinx-doc/sphinx-doc@2.4.1
    inputs:
      stage: build
      dir: docs
      install_repo: true
```

### Conditional

It is possible to define conditions to when the component will be executed.
For example,

```yaml
include:
  - component: $CI_SERVER_FQDN/rse/docker/images/sphinx-doc/sphinx-doc@2.4.1
    inputs:
      stage: build
      dir: docs
    rules:
      - if: $CI_COMMIT_BRANCH == "master"

pages:
  stage: .post
  rules:
    - if: $CI_COMMIT_BRANCH == "master"
  dependencies:
    - build sphinx website
  script:
    - echo Publish documentation to GitLab Pages
  artifacts:
    paths:
      - public
```

## Local Usage

### Docker Compose

Add

```
services:
  sphinx-doc:
    image: docker-private.gesis.intra/rse/docker/images/sphinx-doc:2.4.1
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
  docker-private.gesis.intra/rse/docker/images/sphinx-doc:2.4.1 \
  bash -c "cd /mnt && make html"
```
