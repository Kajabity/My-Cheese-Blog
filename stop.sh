#!/usr/bin/env bash
# -----------------------------------------------------------------------------------------------
# Shell script to stop development WordPress and database for My Cheese Blog
# -----------------------------------------------------------------------------------------------

# leave the network and volume in place for now

# -----------------------------------------------------------------------------------------------
# Stop the database container
# -----------------------------------------------------------------------------------------------

echo
echo Stopping MySQL container...
docker stop cheese_db

# -----------------------------------------------------------------------------------------------
# Stop the WordPress container
# -----------------------------------------------------------------------------------------------

echo
echo Stopping WordPress container...
docker stop cheese_web

# -----------------------------------------------------------------------------------------------
# Stop the Adminer container
# -----------------------------------------------------------------------------------------------

echo
echo Stopping Adminer container...
docker stop adminer

# -----------------------------------------------------------------------------------------------
# Stop the phpMyAdmin container
# -----------------------------------------------------------------------------------------------

echo
echo Stopping phpMyAdmin container...
docker stop cheese_phpmyadmin

# -----------------------------------------------------------------------------------------------
# List the containers (including stopped ones), networks and volumes
# The 'cheese' containers should have a status of 'Exited'
# -----------------------------------------------------------------------------------------------

echo
echo Running containers:
docker ps -a

echo
echo Networks:
docker network ls

echo
echo Volumes:
docker volume ls