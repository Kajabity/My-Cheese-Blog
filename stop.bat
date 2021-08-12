@echo off
REM -----------------------------------------------------------------------------------------------
REM Windows shell script to stop development WordPress and database for My Cheese Blog
REM -----------------------------------------------------------------------------------------------

REM leave the network and volume in place for now

REM -----------------------------------------------------------------------------------------------
REM Stop the database container
REM -----------------------------------------------------------------------------------------------

echo.
echo Stopping MySQL container...
docker stop cheese_db

REM -----------------------------------------------------------------------------------------------
REM Stop the WordPress container
REM -----------------------------------------------------------------------------------------------

echo.
echo Stopping WordPress container...
docker stop cheese_web

REM -----------------------------------------------------------------------------------------------
REM Stop the Adminer container
REM -----------------------------------------------------------------------------------------------

echo.
echo Stopping Adminer container...
docker stop adminer

REM -----------------------------------------------------------------------------------------------
REM Stop the phpMyAdmin container
REM -----------------------------------------------------------------------------------------------

echo.
echo Stopping phpMyAdmin container...
docker stop cheese_phpmyadmin

REM -----------------------------------------------------------------------------------------------
REM List the containers (including stopped ones), networks and volumes
REM The 'cheese' containers should have a status of 'Exited'
REM -----------------------------------------------------------------------------------------------

echo.
echo Running containers:
docker ps -a

echo.
echo Networks:
docker network ls

echo.
echo Volumes:
docker volume ls