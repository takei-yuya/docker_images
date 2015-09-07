#!/usr/bin/env bash

set -e

# for Mac
if type boot2docker >/dev/null 2>&1; then
  eval `boot2docker shellinit`
fi

: ${docker_username:="$(docker info | sed 's/Username: //p;d')"}
: ${docker_username:?failed to get docker hub username. specify \'docker_username\' environment value, or run \'docker login\'}

for dockerfile in */*/Dockerfile; do
  path="${dockerfile%/Dockerfile}"
  repository="${path%/*}"
  tag="${path#*/}"
  docker build -t "${docker_username}/${repository}:${tag}" "${path}"
  docker push "${docker_username}/${repository}:${tag}"
done
