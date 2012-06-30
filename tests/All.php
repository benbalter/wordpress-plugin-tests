<?php

class All extends PHPUnit_Framework_TestSuite {
	public static function suite(){
		$suite = new All();
		// Add all your test cases like below
		$suite->addTestFile('/path/to/your/test.php');
		return $suite;
	}
}
