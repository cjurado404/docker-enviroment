#!/bin/bash
set -e

BASE_DIR="/var/www/html"
PROJECT_DIR="$BASE_DIR/demo"

# Create the Symfony skeleton only when the base directory has no subdirectories
if [ -z "$(find "$BASE_DIR" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)" ]; then
    composer create-project symfony/skeleton:"6.4.*" "$PROJECT_DIR"
    chown -R www-data:www-data "$PROJECT_DIR"
fi

exec apache2-foreground
