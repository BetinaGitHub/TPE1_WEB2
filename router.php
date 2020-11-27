<?php
include_once 'app/controllers/tool.controller.php';
include_once 'app/controllers/auth.controller.php';

// defino la base url para la construccion de links con urls semánticas
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

// lee la acción
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home'; // acción por defecto si no envían
}

// parsea la accion 
$params = explode('/', $action);

// determina que camino seguir según la acción
switch ($params[0]) {
    // Mostrar todas las maquinarias    
    case 'home':
        $controller = new ToolController();
        $controller->showHome();
    break;

    //Manejo de Usuarios
    case 'login':
        $controller = new AuthController();
        $controller->showLogin();
        break;
    case 'verify':
        $controller = new AuthController();
        $controller->loginUser();
    break;    
    case 'logout':
        $controller = new AuthController();
      //  $controller->logout();
        break;
        
    // ABM de maquinarias    
    case 'abm-tools':
        $controller = new ToolController();
        $controller->abm_tools();
    break;
    
    case 'editar-tool': 
        $controller = new ToolController();
     //   $id = $params[1];
        $controller->editTool($params[1]);
    break;

    case 'update-tool':
        $controller = new ToolController();
        $controller->updateTool();
    break;  
    
    // Mostrar detalles de una maquinaria
    case 'detalles':
        $controller = new ToolController();
        $id = $params[1];
        $controller->showDetails($id);
    break;
  /* 
    case 'listar-csr':
        $controller = new ToolController();
        $id = $params[1];
        $controller->showComentCSR($id);
    break;
 */
    case 'insert-tool':
        $controller = new ToolController();
        $controller->addTool();
        break;

    case 'eliminar': // eliminar/:ID
        $controller = new ToolController();
        $id = $params[1];
        $controller->deleteTool($id);
    break;          

    // Listar rubros
    case 'listar-rubros':
        $controller = new ToolController();
        $controller->showRubros();
    break;

    // ABM de rubros
    case 'modi-rubros':
        $controller = new ToolController();
        $controller->abm_rubros();
    break;

    case 'insertar-rubro':
        $controller = new ToolController();
        $controller->addRubro();
    break;
    
    case 'editar-rubro': 
        $controller = new ToolController();
     //   $id = $params[1];
        $controller->editRubro($params[1]);
    break;
  
    case 'upd-rubro':
        $controller = new ToolController();
        $controller->updateRubro();
    break;

    case 'eliminar-rubro': // eliminar/:ID
        $controller = new ToolController();
        $id = $params[1];
        $controller->delRubro($id);
    break;

    case 'filtrar': // filtrar/:ID
        $controller = new ToolController();
      //  $id = $params[1];
        $controller->showToolsFiltro($params[1]);
    break;

    case 'search-tools': 
        $controller = new ToolController();
    //    $id = $params[1];
        $controller->showSearchTools();
    break;

    default:
        header("HTTP/1.0 404 Not Found");
        echo('404 Page not found');
    break;
}