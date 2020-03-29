#!/usr/bin/env bash

echo "Configuring docker compose environment"
echo "Please provide values:"
for var in APP_NAME HOST_PORT DB_USER DB_PASSWORD WP_ADMIN_USER WP_ADMIN_PASSWORD; do 
    echo -n "  $var? "
    eval read $var
done

root=$(cd "$(dirname $0)"/..; pwd)
ofile="$root"/.env

cat > "$ofile" << EOF
# This file is used by docker-compose
# and the scripts in bin/

HOST_PORT=${HOST_PORT}

# Wordpress container
WORDPRESS_DB_HOST=db
WORDPRESS_DB_NAME=wp_${APP_NAME}
WORDPRESS_DB_USER=${DB_USER}
WORDPRESS_DB_PASSWORD=${DB_PASSWORD}

# Database
MYSQL_DATABASE=wp_${APP_NAME}
MYSQL_USER=${DB_USER}
MYSQL_PASSWORD=${DB_PASSWORD}
MYSQL_ROOT_PASSWORD=${DB_PASSWORD}

# Wordpress app
APP_NAME=${APP_NAME}
ADMIN_USER=${WP_ADMIN_USER}
ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
EOF

echo ""
echo "Created vars in $ofile:"
cat $ofile