#!/bin/bash
set -e

PROJECT_DIR="/var/www/html/demo"

if [ ! -d "$PROJECT_DIR" ] || [ -z "$(ls -A "$PROJECT_DIR" 2>/dev/null)" ]; then
    composer create-project symfony/skeleton:"6.4" "$PROJECT_DIR"
    chown -R www-data:www-data "$PROJECT_DIR"
fi

exec apache2-foreground
