<?php
require_once 'app/models/comment.model.php';
require_once 'app/api/api.view.php';

class ApiCommentController {

    private $model;
    private $view;

    function __construct() {
        $this->model = new CommentModel();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input");
    }
/* 
    public function getAll(){
     //   $params = [];
    //    $idmaq = $params[':ID'];
        $comments = $this->model->getAll();
        $this->view->response($comments,200);
     //   return $comments;
    }
     */

    public function getAll(){
        $comments = $this->model->getAll();
    //    var_dump($comments);
        $this->view->response($comments,200);
       
    }

    public function getByIdTool($params = null){
        $idtool = $params[':ID'];
        $comments = $this->model->get($idtool);
        $this->view->response($comments,200);
     }
    
    


     public function delete($params = null){
        $idcomment = $params[':ID'];
        $comment = $this->model->get($idcomment);
        if ($comment){       
           $this->view->response("El comentario ha sido borrado ",200);
        }
        else {
           $this->view->response("El comentario con el id=$idcomment no existe",404);
        }
     }

    public function getData() {
        return json_decode($this->data);
    }

     public function insert(){
        $body = $this->getData();

        // inserta la tarea
        $idmaq = $body->idmaq;
        $comment = $body->descripcion;
        $iduser = $body->iduser;
        $puntaje = $body->puntaje;
        
        // verifico campos obligatorios
        if (empty($idmaq) || empty($iduser)|| empty($comment)|| empty($puntaje)) {
            $this->view->response('Faltan datos obligatorios',404);
            die();
        }
        // inserto la herramienta en la DB
        $this->model->insert($idmaq,$iduser,$comment,$puntaje);
        // redirigimos al listado
        //header("Location: " . BASE_URL . "abm-tools"); 
    }
}
