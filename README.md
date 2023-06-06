# docker-private.gesis.intra/docker/images/sphinx-doc

* This image serves as base image for GESIS Sphinx documentation sites
* See an example usage of this image at [devops.git.gesis.org](https://git.gesis.org/devops/devops.git.gesis.org)


## Usage

```
cd /path/to/your/sphinx-doc-project
docker run -ti --rm \
  --env CI_COMMIT_SHORT_SHA=dev \
  --env VERSION=dev \
  -v $PWD:/mnt \
  docker-private.gesis.intra/docker/images/sphinx-doc:1.1 \
  bash -c "cd /mnt && make html"
```
