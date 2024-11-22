<?php

/**
 *  Site entry point
 */

session_start();

define('WWW', __DIR__);
define('ROOT', dirname(__DIR__));
define('CORE', __DIR__ . '/vendor/amorpha/kalinger-framework/framework/src');
define('APPLICATION', __DIR__ . '/application');
define('HOST', 'https://centrmd.ru/');
require __DIR__ . '/vendor/autoload.php';

require __DIR__ . '/init_eloquent.php';

use Kalinger\Router;

/**
 * Run router
 */
$router = new Router;
$router->run();