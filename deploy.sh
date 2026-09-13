#!/bin/bash

set -e

IMAGE_NAME="${IMAGE_NAME:-devops-app:latest}"

echo "===================================="
echo "Deploying Application"
echo "Image: ${IMAGE_NAME}"
echo "===================================="

docker compose down

export IMAGE_NAME="${IMAGE_NAME}"

docker compose up -d

echo ""
echo "Deployment completed successfully."

docker ps
