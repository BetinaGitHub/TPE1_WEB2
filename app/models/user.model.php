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
    public function getByEmail($email) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE email = ?');
        $query->execute([$email]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

}