#!/bin/sh

# WordPress test setup script for Travis CI 
#
# Author: Benjamin J. Balter ( ben@balter.com | ben.balter.com )
# License: GPL3

# Init Database
mysql -e 'create database wordpress_test;' -uroot   

# Normalize plugin folder name
plugin_slug=$( echo "${PWD##*/}" | tr -s  '[:upper:]'  '[:lower:]' )
mkdir ../plugin   
mv * ../plugin
cd ..

#grab specified version of WordPress from Git and unzip
wget -O wordpress.tar.gz https://github.com/WordPress/WordPress/tarball/$WP_VERSION
mkdir -p wp
tar --strip-components=1 -zxmf wordpress.tar.gz -C wp #note: strip components removes the WordPress-Wordpress-### subdirectory

#put various components in proper folders
mv -f plugin/tests ./tests
mv -f plugin wp/wp-content/plugins/$plugin_slug
cd ./tests

if [ ! -d "./wordpress-tests" ]; then
	wget -O wordpress-tests.tar.gz https://github.com/nb/wordpress-tests/tarball/master
	mkdir wordpress-tests
	tar --strip-components=1 -zxmf wordpress-tests.tar.gz -C wordpress-tests
fi

#grab unittsets-config and move into framework folder
wget https://raw.github.com/benbalter/wordpress-plugin-tests/setup/unittests-config.php
mv unittests-config.php wordpress-tests/unittests-config.php
