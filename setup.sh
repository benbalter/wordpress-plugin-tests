#!/bin/sh

# WordPress test setup script for Travis CI 
#
# Author: Benjamin J. Balter ( ben@balter.com | ben.balter.com )
# License: GPL3

export WP_CORE_DIR=/tmp/wordpress
export WP_TESTS_DIR=/tmp/wordpress-tests

# Init database
mysql -e 'CREATE DATABASE wordpress_test;' -uroot

# Normalize plugin folder name
plugin_slug=$( echo "${PWD##*/}" | tr -s  '[:upper:]'  '[:lower:]' )
mkdir ../plugin
mv * ../plugin
cd ..

# Grab specified version of WordPress from github
wget -O wordpress.tar.gz https://github.com/WordPress/WordPress/tarball/$WP_VERSION
mkdir -p $WP_CORE_DIR
tar --strip-components=1 -zxmf wordpress.tar.gz -C $WP_CORE_DIR

# Set up testing framework
svn co --ignore-externals http://unit-tests.svn.wordpress.org/trunk/ $WP_TESTS_DIR

wget -O $WP_TESTS_DIR/wp-tests-config.php https://raw.github.com/scribu/wordpress-plugin-tests/setup/wp-tests-config.php

# Put various components in proper folders
mv -f plugin/tests ./tests
mv -f plugin $WP_CORE_DIR/wp-content/plugins/$plugin_slug

cd tests
