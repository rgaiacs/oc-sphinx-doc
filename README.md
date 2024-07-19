# `docker-private.gesis.intra/rse/docker/images/sphinx-doc`

This is a experimental fork of [`docker-private.gesis.intra/docker/images/sphinx-doc`](https://git.gesis.org/docker/images/sphinx-doc).

## Usage

```bash
cd /path/to/your/sphinx-doc-project
```

```bash
docker run -ti --rm \
  --env CI_COMMIT_SHORT_SHA=dev \
  --env VERSION=dev \
  -v $PWD:/mnt \
  docker-private.gesis.intra/rse/docker/images/sphinx-doc:1.1 \
  bash -c "cd /mnt && make html"
```
