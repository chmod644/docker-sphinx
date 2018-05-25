# Docker image for Sphinx-Docs

## Concepts

* **Simplest usage**
* Clone sphinx source from git repository
* Build sphinx and launch web service

## Usage

You can use immediately this image if you had been push sphinx source to GitHub (or your own git service).

```sh
docker run -p 8080:80 -it dockerrunit/sphinx -r <Your repository of sphinx>


# ex)
docker run -p 8080:80 -it dockerrunit/sphinx -r https://github.com/chmod644/sphinx-example.git
```

And browse http://localhost:8080/sphinx

## Options

You can see usage and other options of this image.

```sh
# Show usage and options
docker run -it dockerrunit/sphinx -h
```

```
Usage: docker run -p 8080:80 -it dockerrunit/sphinx -r <repository> [option...] 

  -r  Git repository of sphinx
  -b  Branch or Tag to checkout
  -d  Directory of builded html

Browse http://localhost:8080/sphinx
```

## Supported theme

For now, this image only supports the sphinx default theme and `sphinx_rtd_theme`.

If you wanna use `sphinx_rtd_theme`, please pull `dockerrunit/sphinx:sphinx_rtd_theme` instead of `latest` image.

