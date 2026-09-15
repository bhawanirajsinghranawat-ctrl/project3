#!/bin/bash

set -e

IMAGE_NAME="${IMAGE_NAME:-bhawani608/project3-prod:latest}"

echo "===================================="
echo "Deploying Application"
echo "Image: ${IMAGE_NAME}"
echo "===================================="

echo "Pulling latest Docker image..."
docker pull "${IMAGE_NAME}"

echo "Stopping existing application..."
docker compose down

echo "Starting application..."
export IMAGE_NAME="${IMAGE_NAME}"
docker compose up -d

echo ""
echo "Deployment completed successfully."

docker ps
