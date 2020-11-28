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
        $sql = 'SELECT * FROM usuario WHERE email = ?';
        $query = $this->db->prepare($sql);
        $query->execute([$email]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function insert($username,$email,$passw,$rol) {
        $sql = 'INSERT INTO usuario (username,email,passw,rol) VALUES (?,?,?,?)';
        $query = $this->db->prepare($sql);
        $query->execute([$username,$email,$passw,$rol]);
        return $this->db->lastInsertId();
    }

/*     function addUser (){
        $this->view->showRegisterform();
         if (    (isset($_REQUEST['email']) && ($_REQUEST['email'] != null)) && 
        (isset($_REQUEST['password']) && ($_REQUEST['password'] != null)) &&
        (isset($_REQUEST['rePassword']) && ($_REQUEST['rePassword'] != null))){ 

        $newUser=$_POST['email'];
        $newPass=$_POST['password'];
        $newRepass=$_POST['rePassword'];
            $newUser=$_POST['email'];
            $newPass=$_POST['password'];
            $newRepass=$_POST['rePassword'];

        if($newPass==$newRepass){

          $encryptPass= password_hash ($newPass , PASSWORD_DEFAULT );  
          $success=$this->model->insertnewUser($newUser,$encryptPass);
            if($newPass==$newRepass){
              $encryptPass= password_hash ($newPass , PASSWORD_DEFAULT );  
              $success=$this->model->insertnewUser($newUser,$encryptPass);

            if ($success){
                $this->view->showConfirmLogin('addUser','Se creó usuario');
                $user = $this->model->getByEmail($newUser);
                $this->authHelper->login($user);
            }
            else{
                $this->view->showErrorLogin('addUser','No se pudo crear el usuario');
                if ($success){
                    $this->view->showConfirmLogin('addUser','Se creó usuario');
                    $user = $this->model->getByEmail($newUser);
                    $this->authHelper->login($user);
                }
                else{
                    $this->view->showErrorLogin('addUser','No se pudo crear el usuario');
                }
            }
             else {
                 $this->view->showErrorLogin('addUser','No coinciden contraseñas');
             }
        }
        else {
            $this->view->showErrorLogin('addUser','No coinciden contraseñas');
        }
     }
    } */


}