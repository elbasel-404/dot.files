#!/bin/sh
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin && \
docker pull ghcr.io/elbasel42/temp-portal-repo-github:main && \
docker run -p 3000:3000 ghcr.io/elbasel42/temp-portal-repo-github:main
