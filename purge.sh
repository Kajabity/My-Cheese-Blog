#!/usr/bin/env bash
# -----------------------------------------------------------------------------------------------
# SHell script to clean up development WordPress and database for cheese blog website.
# -----------------------------------------------------------------------------------------------

# Ensures that the containers are stopped before removing them.

# -----------------------------------------------------------------------------------------------
# Stop and remove the WordPress container
# -----------------------------------------------------------------------------------------------

echo
echo Purging WordPress container...
docker stop cheese_web
docker rm cheese_web

# -----------------------------------------------------------------------------------------------
# Stop and remove the database container
# -----------------------------------------------------------------------------------------------

echo
echo Purging MySQL container...
docker stop cheese_db
docker rm cheese_db

# -----------------------------------------------------------------------------------------------
# Stop and remove the Adminer container
# -----------------------------------------------------------------------------------------------

echo
echo Purging Adminer container...
docker stop adminer
docker rm adminer

# -----------------------------------------------------------------------------------------------
# Stop and remove the phpMyAdmin container
# -----------------------------------------------------------------------------------------------

echo
echo Purging phpMyAdmin container...
docker stop cheese_phpmyadmin
docker rm cheese_phpmyadmin

# -----------------------------------------------------------------------------------------------
# Finally, remove the data volume and network.
# -----------------------------------------------------------------------------------------------

echo
echo Removing network...
docker network rm cheese_nw

# ***********************************************************************************************
# WARNING: Only uncomment to delete all data in the database.
# ***********************************************************************************************

# echo
# echo Removing data volume...
# docker volume rm cheese_data

# -----------------------------------------------------------------------------------------------

# -----------------------------------------------------------------------------------------------
# List the containers (including stopped ones), networks and volumes
# There should be no cheese containers
# The 'cheese' volume should still be there (unless uncommented above)
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