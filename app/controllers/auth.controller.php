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

    public function loginUser() {
        if (isset($_POST['ingresar'])){
            $email = $_POST['email'];
            $password = $_POST['password'];
            $rol = $_POST['rol'];
            echo $rol;
            // verifico campos obligatorios
            if (empty($email) || empty($password)) {
                $this->view->showFormLogin("Faltan datos obligatorios");
                die();
            }
    
            // obtengo el usuario
            $user = $this->model->getByEmail($email);
    
            // si el usuario existe, y las contraseñas coinciden
            if ($user && password_verify($password, $user->password)) {
                
                // armo la sesion del usuario
                $this->authHelper->login($user);
                //$logueado = true;
    
                // redirigimos al listado
                   header("Location: " . BASE_URL .'abm-tools'); 
            } else {
                $this->view->showFormLogin("Usuario Desconocido");
            }
        }
          else {
             $this->view->showFormRegister(); 
             $username = $_POST['username']; 
             $email = $_POST['email'];
             $password1 = $_POST['password1'];
             $password2 = $_POST['password1'];
             $rol = 2;
             // verifico campos obligatorios
             if (empty($username) ||empty($email) || empty($password1) || empty($password2)){
                 $this->view->showFormLogin("Faltan datos obligatorios");
                 die();
             }
                else {
                    if ($password1 != $password2) {
                        $this->view->showFormLogin("Las contraseñas no coinciden");    
                    }   
                } 
            }


             // si el usuario existe, y las contraseñas coinciden
             if ($user && password_verify($password, $user->password)) {
                 
                 // armo la sesion del usuario
                 $this->authHelper->login($user);
                 //$logueado = true;
     
                 // redirigimos al listado
                    header("Location: " . BASE_URL .'abm-tools'); 
             } else {
                 $this->view->showFormLogin("Usuario Desconocido");
             }
 

          }
    }

   /*  function logout() {
        $this->authHelper->logout();
    }
 */
