<?php
require_once 'app/models/comment.model.php';
require_once 'app/api/api.view.php';

class ApiCommentController {

    private $model;
    private $view;

    function __construct() {
        $this->model = new CommentModel();
        $this->view = new ApiView();
    }

    public function getAll($params = null){
        $params = [];
        $comments = $this->model->getAll($params);
        $this->view->response($comments,200);
     //   return $comments;
    }
  

    public function get($params = null){
        $idmaq = $params[':ID'];
        $comment = $this->model->get($idmaq);
        if ($comment){
            $this->view->response($comment,200);
        }
        else {
            $this->view->response('No hay comentarios',404);
        }
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

     public function insert($params = null){
        $idmaq = $_POST['idmaq'];
        $iduser = $_POST['iduser'];
        $comment = $_POST['comment'];
        $puntaje = $_POST['puntaje'];
        
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