#!/usr/bin/env bash

cd /usr/share/code 
if [[ ! -f .env ]]; then
  echo >&2 "Missing .env file"
  exit 1 
fi 
source .env

cd /var/www/html
wp --allow-root core install --url="localhost:${HOST_PORT}" \
                             --title="${APP_NAME} Development" \
                             --admin_user="${WP_ADMIN_USER}" \
                             --admin_email="${WP_ADMIN_USER}@example.com" \
                             --admin_password="${WP_ADMIN_PASSWORD}" 
