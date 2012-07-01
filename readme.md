WordPress Plugin Tests
======================

A Travis CI compatible unit testing for WordPress plugins that utilizes @nb's [wordpress-tests framework](https://github.com/nb/wordpress-tests) and [PHPUnit](https://github.com/sebastianbergmann/phpunit/)

How it Works
------------
* Automatically fires after every commit (or you can specificy certain branches)
* Downloads and sets up multiple versions of WordPress and PHP (as many as you want to specify)
* Downloads the [WordPress Tests framework](https://github.com/nb/wordpress-tests) if it doesn't already exist in the `tests/wordpress-tests` directory as a submodule
* Runs all the tests and e-mails you on failure

Assumptions
------------
* You have a WordPress plugin in GitHub (and thus a GitHub account)
* You posses basic knowledge of how to add and edit files using git

How to integrate with your plugin
----------------------------------
1. Place [`.travis.yml`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/.travis.yml) file in plugin root folder (you may want to [customize your build settings](http://about.travis-ci.org/docs/user/build-configuration/) here)
2. Create a subfolder of your plugin called `tests/` and copy over the [`all.php`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/All.php), [`bootstrap.php`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/bootstrap.php), and [`phpunit.xml`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/phpunit.xml) files from this repo's [`test/`](https://github.com/benbalter/wordpress-plugin-tests/tree/master/tests) folder
3. Customize the newly coppied [`/tests/bootstrap.php`](https://github.com/benbalter/wordpress-plugin-tests/blob/master/tests/bootstrap.php) with the path to your plugin file 
4. If you want to be able to test locally, add wordpress-tests as a submodule of the `tests/` folder by running the command `git submodule add tests/wordpress-tests https://github.com/nb/wordpress-tests.git` from your plugin's root directory (*optional*)
5. [Activate Travis CI](http://travis-ci.org/profile) for your plugin
6. Add tests to the `tests/` folder following the instructions below

The Tests
---------
* Each test file should live in the `tests/` folder and should be named in the format of `test_{name_of_test}.php`.
* Each test file should contain a single class named in the form of `WP_Test_{name_of_test}` that extends `WP_UnitTestCase`. 
* Example Tests: [WP Document Revisions](https://github.com/benbalter/WP-Document-Revisions/tree/master/tests)

Note
----
There's a seperate branch [`setup.sh`](https://github.com/benbalter/wordpress-plugin-tests/tree/setup) which contains setup and config files which are pulled down on the fly when testing

How to Contribute
-----------------
1. Fork the project to your account, make changes, and submit a pull request
1. Integrate with your plugin and open issues / feature requests as you see fit

Changelog
---------
* 4/16/2012 - Initial commit of skelton based off of (legacy) core testing framework
* 6/30/2012 - Complete rewrite to rely on newer wordpress-tests framework and better PHPUnit integration

Roadmap/todo
------------
* Ability to integrate with plugins as a submodule to allow for update
* Ability to customize configuration as pulled down from `setup.sh`

Contributors
------------
Special thanks to @johnpbloch for doing much of the legwork on the rewrite

