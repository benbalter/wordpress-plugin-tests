<?php
/**
 * A simple test to test that that testing framwork is testing tests. Meta, huh?
 * @package wordpress-plugins-tests
 */
class WP_Test_WordPress_Plugin_Tests extends WP_UnitTestCase {
	
	/**
	 * Run a simple test to ensure that the tests are running
	 */
	 function test_tests() {
		 
		 $this->assertTrue( true );
		 
	 }
	
	/**
	 * Verify that WordPress is installed and is the version that we requested
	 */
	function test_wp_version() {
		
		if ( !get_env( 'TRAVIS_PHP_VERSION' ) )
			$this->markTestSkipped( 'Not running on Travis CI' );
			
		$this->assertEquals( get_bloginfo( 'version' ), getenv( 'WP_VERSION' ) );
		
	}
	
}