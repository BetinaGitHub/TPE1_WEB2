﻿<?php
include_once 'app/helpers/db.helper.php';

class ToolModel {

    private $db;
    private $dbHelper;

    function __construct() {
        $this->dbHelper = new DBHelper();
        
         // 1. Abro la conexión
        $this->db = $this->dbHelper->connect();
    }
    /**
     * Devuelve todas las herramientas de la base de datos.
     */
    function getAll() {
        // 2. Enviar la consulta (2 sub-pasos: prepare y execute)
        $sql = 'SELECT maquinaria.*, rubro.descripcion as descrubro FROM maquinaria inner join rubro on maquinaria.idrubro = rubro.id';
        $query = $this->db->prepare($sql);
        $query->execute();
        // 3. Obtengo la respuesta con un fetchAll (porque son muchos)
        $tools = $query->fetchAll(PDO::FETCH_OBJ); // arreglo de herramientas
        return $tools;
    }
    /*  Devuelve todas las herramientas de la base de datos.
       function getAllconRubros() {
           $query = $this->db->prepare('SELECT rubro.descripcion as descrubro, maquinaria.id, maquinaria.descripcion, maquinaria.modelo, maquinaria.notas FROM maquinaria join rubro on maquinaria.idrubro = rubro.id');
           $query->execute();
           $tools = $query->fetchAll(PDO::FETCH_OBJ); // arreglo de herramientas
         return $tools;
       }
    */
    /*  Antes se llamaba function getAllconFiltro($id) */
       function getAllporRubro($idRubro) {
        $query = $this->db->prepare('SELECT id, descripcion, modelo, notas FROM maquinaria where idRubro = ?');
        $query->execute([$idRubro]);
        $tools = $query->fetchAll(PDO::FETCH_OBJ); 
        return $tools;
    }
    
  /* Antes de llamaba  function getconRubro($id) { */
    function getOne($id) {
    //   var_dump($id);
    //    die;
        $sql = 'SELECT maquinaria.*, rubro.descripcion as descrubro FROM maquinaria inner join rubro on maquinaria.idrubro = rubro.id where maquinaria.id = ?';
        $query = $this->db->prepare($sql);
 //      $query = $this->db->prepare("SELECT id,idRubro,descripcion, modelo, notas, foto FROM maquinaria where id = $id");
        $query->execute([$id]);
        $tools = $query->fetch(PDO::FETCH_OBJ); 
        return $tools;
    }
    
    /**
     * Inserta la herramienta en la base de datos
     */
    function insert($rubro,$descripcion,$modelo,$notas,$precio) {
        // 2. Enviar la consulta (2 sub-pasos: prepare y execute)
        $query = $this->db->prepare('INSERT INTO maquinaria (idRubro,descripcion,modelo,notas,precio) VALUES (?,?,?,?,?)');
        $query->execute([$rubro,$descripcion,$modelo,$notas,$precio]);
 
        // 3. Obtengo y devuelo el ID de la herramienta nueva
        return $this->db->lastInsertId();
        die;
    }
    function update($rubro,$descripcion,$modelo,$notas,$precio,$id) {
            $sql ='UPDATE maquinaria SET idRubro=?,descripcion=?,modelo=?,notas=?,precio=? where id=?';
            $query = $this->db->prepare($sql);
            $query->execute([$rubro,$descripcion,$modelo,$notas,$precio,$id]);
        return;
    }  


 
    function remove($id) {  
        $query = $this->db->prepare('DELETE FROM maquinaria WHERE id = ?');
        $query->execute([$id]);
    }
}