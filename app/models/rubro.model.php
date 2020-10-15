<?php
include_once 'app/helpers/db.helper.php';
class RubroModel {

    private $db;
    private $dbHelper;

    function __construct() {
	    $this->dbHelper = new DBHelper();	
        
	// 1. Abro la conexión
        $this->db = $this->dbHelper->connect();
    }

    /**
    * AHORA LA CONEXION a la BASE DE DATOS SE ABRE EN en db.helper.php COMO public;
    * private function connect() {
    *    $db = new PDO('mysql:host=localhost;'.'dbname=db_maqagricolas;charset=utf8', 'root', '');
    *    return $db;
    *} 
    */

    /**
     * Devuelve todas las herramientas de la base de datos.
     */
    function getAll() {
    // 2. Enviar la consulta (2 sub-pasos: prepare y execute)
        $query = $this->db->prepare('SELECT * FROM rubro');
        $query->execute();
    // 3. Obtengo la respuesta con un fetchAll (porque son muchos)
        $rubros = $query->fetchAll(PDO::FETCH_OBJ); // arreglo de herramientas
    //    var_dump($rubros);
    //   die;
        return $rubros;
    }
    function getOne($id) {
        $query = $this->db->prepare("SELECT * FROM rubro where rubro.id=$id");
        $query->execute();
        $rubro = $query->fetch(PDO::FETCH_OBJ); // arreglo de herramientas
    //    var_dump($rubros);
    //   die;
        return $rubro;
    }

    /**
     * Inserta la herramienta en la base de datos
     */
    function insert_rubro($descripcion) {
    // 2. Enviar la consulta (2 sub-pasos: prepare y execute)
        $query = $this->db->prepare('INSERT INTO rubro (descripcion) VALUES (?)');
        $query->execute([$descripcion]);
      //  var_dump($query);
    // 3. Obtengo y devuelo el ID de la herramienta nueva
        return $this->db->lastInsertId();
        die;
    }

    function updateRubro($id,$descripcion){
        $query = $this->db->prepare('UPDATE rubro SET descripcion = ? WHERE id = ?');
        $query->execute([$descripcion,$id]); 

        return;
    }

    function remove($id) { 
        $query = $this->db->prepare('DELETE FROM rubro WHERE id = ?');
        $query->execute([$id]);
      

    }
}