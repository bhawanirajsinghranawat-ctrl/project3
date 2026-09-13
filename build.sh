#!/bin/bash

set -e

IMAGE_NAME="devops-app"
TAG="${1:-latest}"

echo "===================================="
echo "Building Docker Image"
echo "Image: ${IMAGE_NAME}:${TAG}"
echo "===================================="

docker build -t "${IMAGE_NAME}:${TAG}" .

echo ""
echo "Docker image built successfully:"
docker images "${IMAGE_NAME}"
