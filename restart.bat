@echo off
REM -----------------------------------------------------------------------------------------------
REM Windows shell script to re-start development WordPress and database for My Cheese Blog website.
REM -----------------------------------------------------------------------------------------------

REM -----------------------------------------------------------------------------------------------
REM Restart the database container
REM -----------------------------------------------------------------------------------------------


echo.
echo Re-starting MySQL container...
docker start cheese_db

REM -----------------------------------------------------------------------------------------------
REM Restart the WordPress container
REM -----------------------------------------------------------------------------------------------


echo.
echo Re-starting WordPress container...
docker start cheese_web

REM -----------------------------------------------------------------------------------------------
REM Restart the Adminer container
REM -----------------------------------------------------------------------------------------------

echo.
echo Re-starting Adminer container...
docker start adminer

REM -----------------------------------------------------------------------------------------------
REM Restart the phpMyAdmin container
REM -----------------------------------------------------------------------------------------------

echo.
echo Re-starting phpMyAdmin container...
docker start cheese_phpmyadmin

REM -----------------------------------------------------------------------------------------------
REM List the containers (running), networks and volumes
REM -----------------------------------------------------------------------------------------------

echo.
echo Running containers:
docker ps

echo.
echo Networks:
docker network ls

echo.
echo Volumes:
docker volume ls