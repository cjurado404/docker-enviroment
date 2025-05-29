#!/bin/bash
set -e
PROJECT_DIR=/var/www/html/${PROJECT}
if [ ! -d "$PROJECT_DIR" ] || [ -z "$(ls -A "$PROJECT_DIR" 2>/dev/null)" ]; then
  composer create-project symfony/skeleton:"${SYMFONY_VERSION}" "$PROJECT_DIR"
fi
exec apache2-foreground

