#!/bin/bash

# log dir
mkdir -p ./logs

# make dir for app
mkdir -p ./app/

# cloning latest cerebrate
echo "Cloning latest cerebrate..."
git clone https://github.com/cerebrate-project/cerebrate.git ./app/cerebrate

# move files for database setup
echo "Copy initial db setup files..."
mkdir -p ./app/dbinit
cp ./app/cerebrate/INSTALL/clean.sql ./app/dbinit/clean.sql
cp ./app/cerebrate/INSTALL/mysql.sql ./app/dbinit/mysql.sql
echo "Done. Start now using ./start.sh"

# building images..
echo "Building docker image"
./build-image.sh
