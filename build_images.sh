#!/usr/bin/env bash

set -e

if type boot2docker >/dev/null; then
  eval `boot2docker shellinit`
fi

docker_hub_user="$(docker info | sed 's/Username: //p;d')"

declare -a tags=()
for dockerfile in */*/Dockerfile; do
  path="${dockerfile%/Dockerfile}"
  repository="${path%/*}"
  tag="${path#*/}"
  tags[${#tags[@]}]="${docker_hub_user}/${repository}:${tag}"
  docker build -t "${docker_hub_user}/${repository}:${tag}" "${path}"
  docker push "${docker_hub_user}/${repository}:${tag}"
done
