<?php
include_once 'app/views/auth.view.php';
include_once 'app/models/user.model.php';
include_once 'app/helpers/auth.helper.php';

class AuthController {
    private $view;
    private $model;
    private $authHelper;

    public function __construct() {
        $this->model = new UserModel();
        $this->view = new AuthView();
        $this->authHelper = new AuthHelper();
    }

    public function showLogin(){
        $this->view->showFormLogin();
        
    }
    public function showRegister(){
        $this->view->showFormRegister();
    }

    public function loginUser() {
            $email = $_POST['email'];
            $passw = $_POST['passw'];
           // $rol = $_POST['rol'];
            // verifico campos obligatorios
            if (empty($email) || empty($passw)) {
                $this->view->showFormLogin("Faltan datos obligatorios");
                die();
            }
    
            // obtengo el usuario
            $user = $this->model->getByEmail($email);
            // si el usuario existe, y las contraseñas coinciden
            if ($user && password_verify($passw, $user->passw)) {
                // armo la sesion del usuario
                $this->authHelper->initSession($user);
                //$logueado = true;
                //redirigimos al listado
                header("Location: " . BASE_URL .'abm-tools'); 
            } else {
                $this->view->showFormLogin("Usuario Desconocido");
            }
        }

    public function loginNewUser() {
        $username = $_POST['username']; 
        $email = $_POST['email'];
        $password1 = $_POST['password1'];
        $password2 = $_POST['password2'];
        $rol = 2;
        // verifico campos obligatorios
        if (empty($username) ||empty($email) || empty($password1) || empty($password2)){
            $this->view->showFormRegister("Faltan datos obligatorios");
            die();
        }
        else {
            if ($password1 != $password2) {
                $this->view->showFormRegister("Las contraseñas no coinciden");  
                die;  
            }   
        } 
        // si el usuario ya existe le avisa
        $user = $this->model->getByEmail($email);
        if ($user) {
           $this->view->showFormRegister("El email $email ya está registrado");
           die;
        }       
        else {
            $password_hash = password_hash($password1 , PASSWORD_DEFAULT ); 
            $newuser = $this->model->insert($username,$email,$password_hash,$rol);
          //  var_dump($newuser);

            if ($newuser) {
                $user = $this->model->getByEmail($email);
                var_dump($user);
            // die();
                $this->authHelper->initSession($user);
                header("Location: " . BASE_URL .'abm-tools'); 
            }
            else {
                $this->view->showFormRegister("El usuario no pudo ser creado");
                die;
            }
        }   
    }
    function logout() {
        $this->authHelper->logout();
    }

}
 
