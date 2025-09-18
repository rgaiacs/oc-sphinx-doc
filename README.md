# Sphinx

Container image to build documentation website with [Sphinx](https://www.sphinx-doc.org/).

## Extensions included

- [myst-parser](https://myst-parser.readthedocs.io/)
- [sphinx-autobuild](https://pypi.org/project/sphinx-autobuild/)
- [sphinx-copybutton](https://pypi.org/project/sphinx-copybutton/)
- [sphinx-tabs](https://pypi.org/project/sphinx-tabs/)
- [sphinxcontrib-mermaid](https://pypi.org/project/sphinxcontrib-mermaid/)
- [sphinxcontrib-video](https://pypi.org/project/sphinxcontrib-video/)
- [sphinxcontrib-openapi](https://pypi.org/project/sphinxcontrib-openapi/)
- [sphinxcontrib-programoutput](https://pypi.org/project/sphinxcontrib-programoutput/)

## Themes included

- [GESIS](https://git.gesis.org/rse/gesis-sphinx-theme)
- [Read the Docs](https://sphinx-rtd-theme.readthedocs.io/en/stable/)
- [Material Design](https://pypi.org/project/sphinx-md-theme/)

## Auxiliar applications

- Git
- GNU Make

## Usage

### Docker Compose

1.  Add

    ```
    services:
      sphinx-doc:
        image: docker-private.gesis.intra/rse/oc/sphinx-doc:3.0.0
        volumes:
          - type: bind
            source: docs
            target: /mnt/docs
            read_only: true
          - sphinx-doc-build:/mnt/html
        expose:
          - "8000"
        ports:
          - "8000:8000"
        command: sphinx-autobuild --host 0.0.0.0 /mnt/docs/source /mnt/html

    volumes:
      sphinx-doc-build:
    ```

    to your `compose.yml`.
    
2. Run

    ```bash
    docker compose up
    ```

3. Open http://localhost:8080 with your web browser.

### Docker CLI

1.  Run

    ```bash
    docker run -ti --rm \
      -v $PWD/docs:/mnt/docs \
      docker-private.gesis.intra/rse/oc/sphinx-doc:3.0.0 \
      sh -c "sphinx-autobuild --host 0.0.0.0 /mnt/docs/source /mnt/html"
    ```
2. Open http://localhost:8080 with your web browser.
