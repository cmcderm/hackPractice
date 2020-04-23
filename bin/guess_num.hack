#!/usr/bin/env hhvm

use HH\Lib\IO;

require_once(__DIR__.'/../vendor/autoload.hack');

<<__EntryPoint>>
async function main_async(): Awaitable<void> {
	\Facebook\AutoloadMap\initialize();

	$num = 5;
	$done = false;

	echo "Welcome to the guessing game!\nGuess a Number 0-10!\n";

	while(!$done) {
		try {
			$_in = IO\request_input();
		
			$guess = trim(await $_in->readLineAsync());

			if(!is_numeric($guess)) {
				// Just to test out throwing and catching exceptions
				throw new Exception("Error Processing Input!", 1);
			}
			$num_guess = (int)$guess;
		}
		catch(\Exception $ex) {
			printf("%s Try Again!\n", $ex->getMessage());
			continue;
		}
		
		if($num_guess == $num) {
			$done = true;
			continue;
		} else if ($num_guess < $num) {
			echo "Sorry, too low! Try again :)\n";
		} else {
			echo "Sorry, too high! Try again (:\n";
		}
	}
	echo "Nice! You did it, you must be a master guesser!\n";

	return;
}