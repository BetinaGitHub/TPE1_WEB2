<?php

class AuthHelper {
    public function __construct() {
    }

    function checkLogged() {
    
        if(session_status() !== PHP_SESSION_ACTIVE) {
            session_start();
           if (!isset($_SESSION)){
                header("Location: " . BASE_URL . 'login');
                die(); 
            }
       }   
    }
        /* 
        if ((isset($_SESSION['ID_USER']) && ($_SESSION['ROL_USER'] == "admin")) { */
      
    /*    $inactivo = 1000;
        if(session_status() !== PHP_SESSION_ACTIVE) session_start();
        //session_start();
         if(isset($_SESSION["timeout"])){
            // Calcula si paso el tiempo de TIMEOUT
            $sessionTO = time() - $_SESSION['TIMEOUT'];
            if($sessionTO > $inactivo){
                session_destroy();
                header("Location: " . BASE_URL . 'login');
            }
        } */
        
    

    function logout() {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL . 'login');
    }    

    function initSession($user) {
       // if(session_status() !== PHP_SESSION_ACTIVE) session_start();
        session_start();
        $_SESSION['ID_USER'] = $user->id;
        $_SESSION['USER_NAME'] = $user->username;
        $_SESSION['EMAIL_USER'] = $user->email;
        
        if ($user->rol == 0 || $user->rol == 1) {
            $_SESSION['ROL_USER'] = 1;
            header("Location: " . BASE_URL . 'abm_tools');
        }
        else {
            $_SESSION['ROL_USER'] = 2;
            header("Location: " . BASE_URL . 'home');
        }
        //$_SESSION['TIMEOUT'] = time();

    }
}