<?php
include_once 'app/helpers/db.helper.php';

class UserModel {
 
    private $db;
    private $dbHelper;    

    function __construct() {
        $this->dbHelper = new DBHelper();
    // 1. Abro la conexión
        $this->db = $this->dbHelper->connect();
    }

    /**
     * Devuelve un usuario dando un email.
     */

    public function getAll() {
        $sql = 'SELECT * FROM usuario';
        $query = $this->db->prepare($sql);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getByEmail($email) {
        $sql = 'SELECT * FROM usuario WHERE email = ?';
        $query = $this->db->prepare($sql);
        $query->execute([$email]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function get($user) {
        $sql = 'SELECT * FROM usuario WHERE id = ?';
        $query = $this->db->prepare($sql);
        $query->execute([$user]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
    public function post($rol,$user) {
        $sql = 'UPDATE usuario SET rol = ?  WHERE id = ?';
        $query = $this->db->prepare($sql);
        $query->execute([$rol,$user]);
    }


    public function insert($username,$email,$passw,$rol) {
        $sql = 'INSERT INTO usuario (username,email,passw,rol) VALUES (?,?,?,?)';
        $query = $this->db->prepare($sql);
        $query->execute([$username,$email,$passw,$rol]);
        return $this->db->lastInsertId();
    }
    public function remove($id) {
        $query = $this->db->prepare('DELETE FROM usuario WHERE id = ?');
        $query->execute([$id]);
    }

}