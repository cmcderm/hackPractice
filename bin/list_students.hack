#!/usr/bin/env hhvm

namespace Hack\GettingStarted\Students;

use HH\Lib\Vec;

require_once(__DIR__.'/../vendor/autoload.hack');

<<__EntryPoint>>
async function main_async(): Awaitable<void> {
	\Facebook\AutoloadMap\initialize();

	$students = vec[
		new Student("Connor", "C"),
		new Student("Nikita", "A"),
		new Student("Toffee", "B"),
		new Student("Blargar", "Foobar")
	];

	$hacked_students = Vec\map($students, $student ==> new Student($student->name, "A"));
	$good_students = Vec\filter($students, $student ==> $student->grade == "A");

	echo "\nUnaltered Students:\n";
	foreach($students as $s) {
		echo $s->get_grade()."\n";
	}
	echo "\nHacked Students:\n";
	foreach($hacked_students as $h) {
		echo $h->get_grade()."\n";
	}
	echo "\nGood Students (unaltered):\n";
	foreach($good_students as $g) {
		echo $g->get_grade()."\n";
	}


	echo "\n";
}

