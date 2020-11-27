<?php
require_once 'libs/Router.php';
require 'app/api/api-comment.controller.php';


// creo el router
$router = new Router();

 // armo la tabla de ruteo
 
$router->addRoute('comentarios/:ID', 'GET', 'ApiCommentController', 'getByIdTool');
$router->addRoute('comentarios', 'GET', 'ApiCommentController', 'getAll');

$router->addRoute('comentarios/:ID', 'DELETE', 'ApiCommentController', 'remove');
$router->addRoute('comentarios', 'POST', 'ApiCommentController', 'insert');
$router->setDefaultRoute('ApiCommentController','show404');
// rutea
$router->route($_REQUEST['resource'],  $_SERVER['REQUEST_METHOD']);
