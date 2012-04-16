#!/bin/sh

# WordPress test setup script for Travis CI 
#
# Downloads specified version of WordPress, downloads core unit-test framework, places plugin in mu-plugins folder
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
mkdir -p wordpress
tar --strip-components=1 -zxmf wordpress.tar.gz -C wordpress #note: strip components removes the WordPress-Wordpress-### subdirectory

#grab the testing framework, excluding testdata, testcase, and wp-config same (to prevent overwrite errors)
git svn clone -$(svn log -q --limit 1 http://svn.automattic.com/wordpress-tests/ | awk '/^r/{print $1}') http://svn.automattic.com/wordpress-tests/ --ignore-paths="^wp-config-sample.php|^wp-testcase|^wp-testdata/[^/]+/" ./ 

#put various components in proper folders
mv -f plugin/tests/wp-config.php ./wp-config.php
mv -f plugin/tests ./wp-testcase
mv -f plugin wordpress/wp-content/mu-plugins

#patch wp-test.php to return the proper error code
sed 's/?>/if ( intval( $result->failureCount() ) || intval( $result->errorCount() ) ) exit (1);/' wp-test.php > wp-test-temp.php
mv -f wp-test-temp.php wp-test.php  
