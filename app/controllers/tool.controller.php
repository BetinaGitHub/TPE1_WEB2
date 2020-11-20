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
        $rubros = $this->model1->getAll();
        $this->view->showRubros($rubros);
        $tools = $this->model->getAll();
        $this->view->showTools($tools);
    }

    /**
     * Muestra la lista de herramientas
     */
    function showTools() {
        // obtiene las herramientas del modelo
        $tools = $this->model->getAll();
        // actualizo la vista
        $this->view->showTools($tools);
        //var_dump($tools);
        //die;
    }

    function abm_tools() {
        $this->authHelper->checkLogged();
        $tools = $this->model->getAll();
        $rubros = $this->model1->getAll();
        $this->view->abm_tools($tools,$rubros);
    }

    function abm_rubros() {
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
   //     var_dump($consulta);
    //    die();
        $tools = $this->model->getSearchAll($consulta);
        $this->view->showTools($tools);
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

        // verifico campos obligatorios
        if (empty($descripcion) || empty($rubro)) {
            $this->view->showError('Faltan datos obligatorios');
            die();
        }
        // inserto la herramienta en la DB
        $this->model->insert($rubro,$descripcion,$modelo,$notas,$precio);
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
        $id = $this->model1->insert_rubro($desc_rubro);
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
        $this->model->update($idRubro,$descripcion,$modelo,$notas,$precio,$id);
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