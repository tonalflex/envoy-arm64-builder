#!/bin/bash
set -euo pipefail

echo "🔧 Building base image from Envoy devcontainer..."
docker build -t envoy-devcontainer envoy/.devcontainer

echo "🚀 Building envoy-builder with docker-compose..."
docker-compose up
