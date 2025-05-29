#!/bin/bash
set -e

# Install Docker if not present
if ! command -v docker >/dev/null 2>&1; then
    apt-get update && apt-get install -y docker.io docker-compose-plugin
fi

# Start Docker service if available
if command -v systemctl >/dev/null 2>&1; then
    systemctl start docker || true
else
    service docker start || true
fi

docker compose up -d --build
