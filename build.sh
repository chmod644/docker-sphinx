#!/bin/bash

docker build -t dockerrunit/sphinx:latest .

docker build -t dockerrunit/sphinx:sphinx_rtd_theme . -f Dockerfile.sphinx_rtd_theme
