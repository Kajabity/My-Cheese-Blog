#!/usr/bin/env bash
# -----------------------------------------------------------------------------------------------
# Shell script to create development WordPress and database containers for My Cheese Blog
# -----------------------------------------------------------------------------------------------

# Load environment variables.
source ./.env

# -----------------------------------------------------------------------------------------------
# Create a bridge network - ensures the containers can talk to each other without '--link'
# -----------------------------------------------------------------------------------------------

echo
echo Creating bridge network...
docker network create --driver bridge cheese_nw

# -----------------------------------------------------------------------------------------------
# Create a data volume for the database - so data can be retained after the containers is removed
# -----------------------------------------------------------------------------------------------

echo
echo Creating data volume...
docker volume create cheese_data

# -----------------------------------------------------------------------------------------------
# Create a MySQL container with a pre-configured WordPress database schema
# -----------------------------------------------------------------------------------------------

echo
echo Creating MySQL container...
docker run \
    --name cheese_db \
    --network cheese_nw \
    --env "MYSQL_ROOT_PASSWORD=${DB_ROOT_PWD}" \
    --env "MYSQL_DATABASE=${DB_NAME}" \
    --env "MYSQL_USER=${DB_USER}" \
    --env "MYSQL_PASSWORD=${DB_PWD}" \
    --publish 3306:3306 \
    --volume cheese_data:/var/lib/mysql \
    --detach \
    mysql:5.7

# -----------------------------------------------------------------------------------------------
# Create a WordPress container connected to the 'cheese_db' container
# -----------------------------------------------------------------------------------------------

echo
echo Creating WordPress container...
docker run \
    --name cheese_web \
    --network cheese_nw \
    --publish 8080:80 \
    --volume "${WP_CONTENT}:/var/www/html" \
    --env WORDPRESS_DB_HOST=cheese_db \
    --env "WORDPRESS_DB_NAME=${DB_NAME}" \
    --env "WORDPRESS_DB_USER=${DB_USER}" \
    --env "WORDPRESS_DB_PASSWORD=${DB_PWD}" \
    --env "WORDPRESS_TABLE_PREFIX=${DB_PREFIX}" \
    --detach \
    wordpress

# -----------------------------------------------------------------------------------------------
# Optional: Create an Adminer MySQL Admin container
# -----------------------------------------------------------------------------------------------

echo
echo Creating Adminer container...
docker run \
    --name adminer \
    --network cheese_nw \
    --publish 8081:8080 \
    --detach \
    adminer

# Adminer works for any database it can access so it's not limited to the My Cheese Blog database.

# -----------------------------------------------------------------------------------------------
# Optional: Create a phpMyAdmin MySQL Admin container - pre-connected to the 'cheese_db' container
# -----------------------------------------------------------------------------------------------

echo
echo Creating phpMyAdmin container...
docker run \
    --name cheese_phpmyadmin \
    --network cheese_nw \
    --env PMA_HOST=cheese_db \
    --env "PMA_USER=${DB_USER}" \
    --env "PMA_PASSWORD=${DB_PWD}" \
    --publish 8082:80 \
    --detach \
    phpmyadmin

# -----------------------------------------------------------------------------------------------
# List the containers (running), networks and volumes
# -----------------------------------------------------------------------------------------------

echo
echo Running containers:
docker ps

echo
echo Networks:
docker network ls

echo
echo Volumes:
docker volume ls