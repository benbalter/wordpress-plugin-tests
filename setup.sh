#!/bin/sh

# WordPress test setup script for Travis CI 
#
# Author: Benjamin J. Balter ( ben@balter.com | ben.balter.com )
# License: GPL3

# Init Database
mysql -e 'create database wordpress_test;' -uroot   

# Normalize plugin folder name
mkdir ../plugin   
mv * ../plugin
cd ..

#grab specified version of WordPress from Git and unzip
wget -O wordpress.tar.gz https://github.com/WordPress/WordPress/tarball/$WP_VERSION
mkdir -p wp
tar --strip-components=1 -zxmf wordpress.tar.gz -C wp #note: strip components removes the WordPress-Wordpress-### subdirectory

#put various components in proper folders
mv -f plugin/tests ./tests
cd ./tests

#grab unittsets-config and move into framework folder
wget https://raw.github.com/benbalter/wordpress-plugin-tests/setup/unittests-config.php
mv unittests-config.php framework/unittests-config.php