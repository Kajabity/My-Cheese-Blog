@echo off
REM -----------------------------------------------------------------------------------------------
REM Windows shell script to clean up development WordPress and database for cheese blog website.
REM -----------------------------------------------------------------------------------------------

REM Ensures that the containers are stopped before removing them.

REM -----------------------------------------------------------------------------------------------
REM Stop and remove the WordPress container
REM -----------------------------------------------------------------------------------------------

echo.
echo Purging WordPress container...
docker stop cheese_web
docker rm cheese_web

REM -----------------------------------------------------------------------------------------------
REM Stop and remove the database container
REM -----------------------------------------------------------------------------------------------

echo.
echo Purging MySQL container...
docker stop cheese_db
docker rm cheese_db

REM -----------------------------------------------------------------------------------------------
REM Stop and remove the Adminer container
REM -----------------------------------------------------------------------------------------------

echo.
echo Purging Adminer container...
docker stop adminer
docker rm adminer

REM -----------------------------------------------------------------------------------------------
REM Stop and remove the phpMyAdmin container
REM -----------------------------------------------------------------------------------------------

echo.
echo Purging phpMyAdmin container...
docker stop cheese_phpmyadmin
docker rm cheese_phpmyadmin

REM -----------------------------------------------------------------------------------------------
REM Finally, remove the data volume and network.
REM -----------------------------------------------------------------------------------------------

echo.
echo Removing network...
docker network rm cheese_nw

REM ***********************************************************************************************
REM WARNING: Only uncomment to delete all data in the database.
REM ***********************************************************************************************

REM echo.
REM echo Removing data volume...
REM docker volume rm cheese_data

REM -----------------------------------------------------------------------------------------------

REM -----------------------------------------------------------------------------------------------
REM List the containers (including stopped ones), networks and volumes
REM There should be no cheese containers
REM The 'cheese' volume should still be there (unless uncommented above)
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