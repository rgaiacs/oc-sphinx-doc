# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Demo'
copyright = '2024, Raniere Gaia Costa da Silva'
author = 'Raniere Gaia Costa da Silva'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["gesis_sphinx_theme"]

templates_path = ['_templates']
exclude_patterns = []



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "gesis"
html_static_path = ['_static']
html_logo = "img/sphinx-doc-logo.png"  #  its width should not exceed 200 pixels
html_favicon = "img/sphinx-doc-favicon.png"  # it should be a 16-by-16 pixel icon
