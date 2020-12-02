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
    // Mostrar todas las maquinarias con Paginado   
    case 'home':
        $controller = new ToolController();
         if (!isset($params[1])){
            $pagina = 1;
        }
        else {
            $pagina = $params[1];
        };  
        $controller->showHomePagged($pagina);
    break;    
 
    //Manejo de Usuarios
    //tpl de logueo de Usuarios
    case 'login':
        $controller = new AuthController();
        $controller->showLogin();
        break;
    //Verificacion de Usuarios
    case 'verify':
            $controller = new AuthController();
            $controller->loginUser();
    break;   
    //tpl de registro de nuevos Usuarios 
    case 'register':
            $controller = new AuthController();
            $controller->showRegister();
            break; 
    //Verificacion de Nuevos Usuarios
    case 'verifyNewUser':
        $controller = new AuthController();
        $controller->loginNewUser();
    break;
    //Loguot de usuarios   
    case 'logout':
        $controller = new AuthController();
        $controller->logout();
        break;

    //Manejo de Maquinarias    
    // ABM de maquinarias (Aca va cuando ingresa como Aministrador)    
    case 'abm-tools':
        $controller = new ToolController();
        $controller->abm_tools();
    break; 

    case 'editar-tool': 
        $controller = new ToolController();
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
 
    case 'insert-tool':
        $controller = new ToolController();
        $controller->addTool();
        break;

    case 'eliminar': // eliminar/:ID
        $controller = new ToolController();
        $id = $params[1];
        $controller->deleteTool($id);
    break;          

    //Manejo de usuarios
    case 'abm-users':
        $controller = new AuthController();
        $controller->abm_users();
    break; 
    case 'updateRol':
        $controller = new AuthController();
        $controller->update_rol();
    break; 
    case 'eliminar-user':
        $controller = new AuthController();
        $controller->eliminar_user($params[1]);
    break; 
    case 'modi-rol':
        $controller = new AuthController();
        $controller->modi_rol($params[1]);
    break; 
   
    //Manejo de Rubros
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

    // Manejo de Herramientas Filtradas
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