<?php
include_once 'app/models/tool.model.php';
include_once 'app/models/rubro.model.php';
include_once 'app/views/tool.view.php';
include_once 'app/helpers/auth.helper.php';

class ToolController {
    private $model;
    private $model1;
    private $view;
    public $logueado;

    function __construct() {
        $this->model = new ToolModel();
        $this->model1 = new RubroModel();
        $this->view = new ToolView();
        $this->authHelper = new AuthHelper();
    }

    function showHome() {
        $this->authHelper->checkLogged();
        $rubros = $this->model1->getAll();
        $this->view->showRubros($rubros);
        $tools = $this->model->getAll();
        $this->view->showTools($tools);  
    }

    function showHomePagged($pagina = null) {
        $this->authHelper->checkLogged();
        $rubros = $this->model1->getAll();
        $this->view->showRubros($rubros);
        /* Obtengo el total de maquinarias   y defino los item por pagina y la cant tot de paginas*/ 
        $itemsxPagina = 3;
        $tot_tools = $this->model->totTools();
        $tot_paginas = ceil($tot_tools/$itemsxPagina);
        if (!isset($pagina)) {
            $pagina = 1;
        }    
 
        if ($pagina > $tot_paginas) {
                $inicio = 0;
                $pagina = 1;
            }
        else {
            $inicio = ($pagina - 1) * $itemsxPagina;
        };

        $tools = $this->model->toolsPage($inicio, $itemsxPagina);
        if (isset($tools)) {
            $this->view->showToolsPaged($tools, $pagina, $tot_paginas);
        }
    } 
    

    /**
     * Muestra la lista de herramientas
     */
    function showTools() {
        // obtiene las herramientas del modelo
        $tools = $this->model->getAll();
        // actualizo la vista
        $this->view->showTools($tools);
    }

    function abm_tools() {
        $this->authHelper->checkLogged();
        $tools = $this->model->getAll();
        $rubros = $this->model1->getAll();
        $this->view->abm_tools($tools,$rubros);
    }

    function abm_rubros() {
        $this->authHelper->checkLogged();
        $rubros = $this->model1->getAll();
        $this->view->abm_rubros($rubros);
    }

    function showToolsconRubros() {
        // obtiene las herramientas del modelo
    //Betina    $tools = $this->model->getAllconRubros();
    $tools = $this->model->getAll();
        // actualizo la vista
        $this->view->showToolsconRubros($tools);
    }

    function showDetails($id) {
        // obtiene las herramientas del modelo
        $tools = $this->model->getOne($id);
        // actualizo la vista
        $this->view->ShowDetails($tools);
    }
/* 
    function showComentCSR($id) {
        $this->view->showComentCSR($id);
    }
 */
     /**
     * muestra la lista de rubros
     */

    function showRubros() {
        // obtiene los rubros del modelo
        $rubros = $this->model1->getAll();
        // actualizo la vista
        $this->view->showRubros($rubros);
    }

    function showToolsFiltro($id) {
        $rubro =  $this->model1->getOne($id);
        $this->view->showRubrosFiltrados($rubro); 
        $tools = $this->model->getAllporRubro($id);
        $this->view->showToolsconFiltro($tools);
    }

    function showSearchTools() {
        $consulta = $_POST['search'];
        $tools = $this->model->getSearchAll($consulta);
        $rubros = $this->model1->getAll();
        $this->view->abm_tools($tools,$rubros);
    }

    /**
     * Inserta una herramienta en la base
     */
    function addTool() {
        $descripcion = $_POST['descripcion'];
        $notas = $_POST['notas'];
        $rubro = $_POST['rubro'];
        $modelo = $_POST['modelo'];
        $precio = $_POST['precio'];
 
        // verifico si cargó imagen
        if (isset($_FILES['img_name'])){
            /* Carpeta donde quedan las imagenes */
            $uploads = getcwd() . '/uploads';  
            $path =tempnam($uploads,$_FILES['img_name']['name']) ;  
            move_uploaded_file($_FILES['img_name']['tmp_name'],$path); 
            $path=basename($path);
        }
        
        // verifico campos obligatorios
        if (empty($descripcion) || empty($rubro)) {
            $this->view->showError('Faltan datos obligatorios');
            die();
        }
        // inserto la herramienta en la DB
        $this->model->insert($rubro,$descripcion,$modelo,$notas,$precio,$path);
        // redirigimos al listado
        header("Location: " . BASE_URL . "abm-tools"); 
    }
    /**
     * Inserta un rubro en la base de rubros
     */

    function addRubro() {
        $desc_rubro = $_POST['desc_rubro'];
        if (empty($desc_rubro)) {
            $this->view->showError('Faltan datos obligatorios');
            die();
        }
        $this->model1->insert_rubro($desc_rubro);
        header("Location: " . BASE_URL . "modi-rubros"); 
    }
  
    function delRubro($id) {
        $this->model1->remove($id);
        header("Location: " . BASE_URL ."modi-rubros");
    }

    function editRubro($id){
        $rubro = $this->model1->getOne($id);
        $this->view->showRubroEditar($rubro);
    }
    
    function editTool($id){
        $tool = $this->model->getOne($id);
        $tools = $this->model->getAll();
        $rubros = $this->model1->getAll();
        $this->view->showToolEditar($tool,$tools,$rubros);
    }

    function updateRubro(){
        $id = $_POST['idrubro'];
        $descripcion = $_POST['descrubro'];
        $this->model1->updateRubro($id,$descripcion);
        header("Location: " . BASE_URL . "modi-rubros");
    }

    function updateTool(){
        $id = $_POST['id'];
        $descripcion = $_POST['descripcion'];
        $notas = $_POST['notas'];
        $idRubro = $_POST['rubro'];
        $modelo = $_POST['modelo'];
        $precio = $_POST['precio'];

        if (isset($_FILES['img_name'])){
            /* Carpeta donde quedan las imagenes */
            $uploads = getcwd() . '/uploads';  
            $path =tempnam($uploads,$_FILES['img_name']['name']) ;  
            move_uploaded_file($_FILES['img_name']['tmp_name'],$path); 
            $path=basename($path);
        }
 
        $this->model->update($idRubro,$descripcion,$modelo,$notas,$precio,$path,$id);
        header("Location: " . BASE_URL . "abm-tools"); 
    }
    
    /**
     * Elimina la herramienta del sistema
     */
    function deleteTool($id) {
        $this->model->remove($id);
        header("Location: " . BASE_URL . "abm-tools"); 
    } 
}