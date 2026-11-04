#!/bin/sh

set -eu

if [ "$#" -ne 2 ]; then
    echo "Usage: ./builder.sh <github-repo> <docker-image>"
    exit 1
fi

REPO="https://github.com/$1.git"
IMAGE="$2"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

git clone --depth 1 "$REPO" "$WORKDIR"
docker build -t "$IMAGE" "$WORKDIR"
echo "${DOCKER_PWD:?}" | docker login -u "${DOCKER_USER:?}" --password-stdin
docker push "$IMAGE"