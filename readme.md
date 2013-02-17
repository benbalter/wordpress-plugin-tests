WordPress Plugin Tests
======================

A Travis CI compatible unit testing architecture for WordPress plugins that use [WordPress core's official unit-testing framework](http://unit-tests.trac.wordpress.org/browser/trunk/includes) and [PHPUnit](https://github.com/sebastianbergmann/phpunit/)

[![Build Status](https://secure.travis-ci.org/benbalter/wordpress-plugin-tests.png)](http://travis-ci.org/benbalter/wordpress-plugin-tests)

How it Works
------------
* Automatically fires after every commit (or you can specificy certain branches)
* Downloads and sets up multiple versions of WordPress and PHP (as many as you want to specify)
* Runs all the tests and e-mails you on failure

Assumptions
------------
* You have a WordPress plugin in GitHub (and thus a GitHub account)
* You posses basic knowledge of how to add and edit files using git

How to integrate with your plugin
----------------------------------
1. Place [`.travis.yml`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/.travis.yml) file in your plugin's root folder (you may want to [customize your build settings](http://about.travis-ci.org/docs/user/build-configuration/) here)
2. Create a subfolder of your plugin called `tests/` and copy over the [`bootstrap.php`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/bootstrap.php) and [`phpunit.xml`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/phpunit.xml) files from this repo's [`test/`](https://github.com/benbalter/wordpress-plugin-tests/tree/master/tests) folder
3. Customize the newly coppied [`/tests/bootstrap.php`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/bootstrap.php) with the path to your plugin file 
4. Set up the tests library as a [submodule](http://git-scm.com/book/en/Git-Tools-Submodules): `git submodule add git://github.com/scribu/wp-tests-lib.git tests/lib`
5. [Activate Travis CI](http://travis-ci.org/profile) for your plugin
6. Add tests to the `tests/` folder following the instructions below

Running the tests locally
----------------------------------
All you need to do is set up a `wp-tests-config.php` file inside the `tests` directory. ([sample](https://unit-tests.svn.wordpress.org/trunk/wp-tests-config-sample.php))

Then, run the tests:

```bash
cd /path/to/your-plugin
phpunit
```

The Tests
---------
* Each test file should live in the `tests/` folder and should be named in the format of `test_{name_of_test}.php`.
* Each test file should contain a single class named in the form of `WP_Test_{name_of_test}` that extends `WP_UnitTestCase`. 
* Example Tests: [WP Document Revisions](https://github.com/benbalter/WP-Document-Revisions/tree/master/tests)

Note
----
There's a separate branch [`setup`](https://github.com/benbalter/wordpress-plugin-tests/tree/setup) which contains setup and config files which are pulled down on the fly when testing.

How to Contribute
-----------------
1. Fork the project to your account, make changes, and submit a pull request
1. Integrate with your plugin and open issues / feature requests as you see fit

Changelog
---------
* 2013-01-19 - Mandate plugins have [wp-tests-lib](https://github.com/scribu/wp-tests-lib) as a submodule.
* 2012-09-15 - Removed `wordpress-tests` submodule in favor of core's SVN.
* 2012-04-16 - Initial commit of skelton based off of (legacy) core testing framework.
* 2012-06-30 - Complete rewrite to rely on newer wordpress-tests framework and better PHPUnit integration.

Contributors
------------
Special thanks to @johnpbloch and @scribu for doing much of the legwork on the rewrite.
