WordPress Plugin Tests
======================

Provides automatic unit testing of WordPress plugins hosted on GitHub using Travis CI

What it does
------------
* Automatically fires after every commit (or you can specificy certain branches)
* Downloads and sets up multiple versions of WordPress (as many as you want)
* Downloads and patches the [WordPress unit test framework](http://unit-tests.trac.wordpress.org/browser)
* Places plugin in the `mu-plugins` folder
* Runs tests and e-mails you on failure

Usage
-----
* Place `.travis.yml` file in plugin root folder
* Place all tests in the `tests` folder
* [Activate Travis CI for your plugin](http://travis-ci.org/profile)

The Tests
---------
* Tests should be a class that extends `WPTestCase`. [[Examples](http://unit-tests.trac.wordpress.org/browser/wp-testcase)] 

