<?php
include_once 'app/helpers/db.helper.php';

class CommentModel {

    private $db;
    private $dbHelper;

    function __construct() {
        $this->dbHelper = new DBHelper();
        
         // 1. Abro la conexión
        $this->db = $this->dbHelper->connect();
    }

    function getAll() {
        // 2. Enviar la consulta (2 sub-pasos: prepare y execute)
      $sql = 'SELECT * FROM comentarios';
      $query = $this->db->prepare($sql);
      $query->execute();
      $comments = $query->fetchAll(PDO::FETCH_OBJ); 
     // var_dump($comments);
    //  die();
      return $comments;
    }

    function get($id) {
     // 2. Enviar la consulta (2 sub-pasos: prepare y execute)
      $sql = 'SELECT * FROM comentarios where idmaq = ?';
      $query = $this->db->prepare($sql);
      $query->execute([$id]);
      $comments = $query->fetchAll(PDO::FETCH_OBJ); 
      var_dump($comments);
      die();
      return $comments;
    }

    function remove($id) {
         $sql = 'DELETE FROM comentarios WHERE id = ?';
         $query = $this->db->prepare($sql);
         $query->execute([$id]);
         return $query;
       }

    function insert($idmmaq,$iduser,$comment,$puntaje) {
        $sql = 'INSERT INTO comentarios (idmmaq,iduser,comment,puntaje) VALUES (?,?,?,?)';
        $query = $this->db->prepare($sql);
        $query->execute([$idmmaq,$iduser,$comment,$puntaje]);
        return $this->db->lastInsertId();
    }   
}