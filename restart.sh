#!/usr/bin/env bash
# -----------------------------------------------------------------------------------------------
# Shell script to re-start development WordPress and database for My Cheese Blog website.
# -----------------------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------------------
# Restart the database container
# -----------------------------------------------------------------------------------------------


echo
echo Re-starting MySQL container...
docker start cheese_db

# -----------------------------------------------------------------------------------------------
# Restart the WordPress container
# -----------------------------------------------------------------------------------------------


echo
echo Re-starting WordPress container...
docker start cheese_web

# -----------------------------------------------------------------------------------------------
# Restart the Adminer container
# -----------------------------------------------------------------------------------------------

echo
echo Re-starting Adminer container...
docker start adminer

# -----------------------------------------------------------------------------------------------
# Restart the phpMyAdmin container
# -----------------------------------------------------------------------------------------------

echo
echo Re-starting phpMyAdmin container...
docker start cheese_phpmyadmin

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