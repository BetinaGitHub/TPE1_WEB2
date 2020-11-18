<?php
require_once 'libs/Router.php';
require_once 'app/api/api.controller.php';

// creo el router
$router = new Router();

// armo la tabla de ruteo
$router->addRoute('tareas', 'GET', '
', 'getAll');
$router->addRoute('tareas/:ID', 'GET', 'ApiTaskController', 'get');
$router->addRoute('tareas/:ID', 'DELETE', 'ApiTaskController', 'delete');

$router->addRoute('tareas', 'POST', 'ApiTaskController', 'add');
$router->addRoute('tareas/:ID', 'PUT', 'ApiTaskController', 'update');


$router->setDefaultRoute('ApiTaskController','show404');

// rutea
$router->route($_REQUEST['resource'],  $_SERVER['REQUEST_METHOD']);
