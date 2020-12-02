<?php
include_once 'app/helpers/db.helper.php';

class CommentModel {

    private $db;
    private $dbHelper;

    function __construct() {
        $this->dbHelper = new DBHelper();
        $this->db = $this->dbHelper->connect();
    }

    function getAll() {
      $sql = 'SELECT * FROM comentarios';
      $query = $this->db->prepare($sql);
      $query->execute();
      $comments = $query->fetchAll(PDO::FETCH_OBJ); 
      return $comments;
    }

    function get($id) {
      $sql = 'SELECT * FROM comentarios where idmaq = ?';
      $query = $this->db->prepare($sql);
      $query->execute([$id]);
      $comments = $query->fetchAll(PDO::FETCH_OBJ); 
      return $comments;
    }

    function remove($id) {
         $sql = 'DELETE FROM comentarios WHERE id = ?';
         $query = $this->db->prepare($sql);
         $query->execute([$id]);
         return $query;
       }

    function insert($idmaq,$iduser,$comment,$puntaje) {
        $sql = 'INSERT INTO comentarios (idmaq,iduser,comment,puntaje) VALUES (?,?,?,?)';
        $query = $this->db->prepare($sql);
        $query->execute([$idmaq,$iduser,$comment,$puntaje]);
        return $this->db->lastInsertId();
    }   
}