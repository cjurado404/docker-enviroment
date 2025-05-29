#!/bin/bash
set -e

BASE_DIR="/var/www/html"
PROJECT_DIR="$BASE_DIR/demo"

# Always (re)create the Symfony skeleton in the mounted directory
composer create-project symfony/skeleton:"6.4.*" "$PROJECT_DIR"
chown -R www-data:www-data "$PROJECT_DIR"
exec apache2-foreground
