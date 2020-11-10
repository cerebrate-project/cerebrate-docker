#!/bin/bash
MYDIR=./app

echo "purging dir."
rm -rf $MYDIR
mkdir $MYDIR

echo "download code"
wget -P  $MYDIR --no-check-certificate https://github.com/cerebrate-project/cerebrate/archive/main.zip

echo "unzip code"
unzip -oqq $MYDIR/main.zip -d $MYDIR 

echo "move initial db setup."
mkdir -p $MYDIR/dbinit 
cp $MYDIR/cerebrate-main/INSTALL/mysql.sql $MYDIR/dbinit/mysql.sql

echo "starting solution"
docker-compose up -d