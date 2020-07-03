#!/bin/bash
set -eou pipefail

IMAGE="place1/frp:$(date +%Y.%m.%d)"

docker login
docker build -t "$IMAGE" .
docker push "$IMAGE"

echo "New image pushed: $IMAGE"
