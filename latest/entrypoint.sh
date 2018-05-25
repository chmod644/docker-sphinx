#!/bin/bash

# help
show_help() {
    echo "Usage: docker run -p 8080:80 -it dockerrunit/sphinx -r <repository> [option...] "
    echo
    echo "  -r  Git repository of sphinx"
    echo "  -b  Branch or Tag to checkout"
    echo "  -d  Directory of builded html"
    echo
    echo "Browse http://localhost:8080/sphinx"
}


# Initialize variables
html_dir="_build/html"
repository=""

# Parse arguments
OPTIND=1

while getopts "hr:b:d:" opt; do
    case "$opt" in
        h)
            show_help
            exit 0
            ;;
        r)  repository=$OPTARG
            ;;
        b)  branch=$OPTARG
            ;;
        d)  html_dir=$OPTARG
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "$repository" ]; then
    show_help
    exit 1
fi

SPHINX_DIR="cloned_repo"
HTML_ROOT_DIR="sphinx"


if [ -z "$branch" ]; then
    git clone ${repository} ${SPHINX_DIR}
else
    git clone ${repository} ${SPHINX_DIR} -b ${branch}
fi

cd ${SPHINX_DIR}
make html

cp -r ${html_dir} /usr/share/nginx/html/${HTML_ROOT_DIR}
echo "Browse http://localhost:8080/sphinx"
nginx -g "daemon off;"
