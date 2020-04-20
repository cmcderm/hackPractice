#!/usr/bin/env hhvm

namespace Hack\GettingStarted\RouterTest;

require_once(__DIR__.'/../vendor/autoload.hack');

use type Facebook\HackRouter\{BaseRouter, HttpMethod};

type TResponder = (function(dict<string, string>):string);

final class RouterTest extends BaseRouter<TResponder> {
	<<__Override>>
	protected function getRoutes(	
	): ImmMap<HttpMethod, ImmMap<string, TResponder>> {
		return ImmMap {
			HttpMethod::GET => ImmMap {
				'/' =>
					($_params) ==> 'Hello, world',
				'/user/{user_name}' =>
					($params) ==> 'Hello, '.$params['user_name'],
			},
			HttpMethod::POST => ImmMap {
				'/' => ($_params) ==> 'Hello, POST world',
			}
		};
	}
}

function get_example_inputs(): ImmVector<(HttpMethod, string)> {
	return ImmVector {
		tuple(HttpMethod::GET, '/'),
		tuple(HttpMethod::GET, '/user/foo'),
		tuple(HttpMethod::GET, '/user/bar'),
		tuple(HttpMethod::POST, '/')
	};
}

<<__EntryPoint>>
function main(): noreturn {
	$router = new RouterTest();
	foreach (get_example_inputs() as $input) {
		list($method, $path) = $input;

		list($responder, $params) = $router->routeMethodAndPath($method, $path);
		\printf(
			"%s %s\n\t%s\n",
			$method,
			$path,
			$responder(dict($params)),
		);
	}
	exit(0);
}