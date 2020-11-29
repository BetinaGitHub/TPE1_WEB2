<?php

class AuthHelper {
    public function __construct() {
    }
    

    function checkLogged() {
        $inactivo = 1000;
 /*       if(session_status() !== PHP_SESSION_ACTIVE) session_start();
        //session_start();
         if(isset($_SESSION["timeout"])){
            // Calcula si paso el tiempo de TIMEOUT
            $sessionTO = time() - $_SESSION['TIMEOUT'];
            if($sessionTO > $inactivo){
                session_destroy();
                header("Location: " . BASE_URL . 'login');
            }
        } */
        if(session_status() !== PHP_SESSION_ACTIVE) session_start();
        if (!isset($_SESSION['ID_USER']) ) {
            header("Location: " . BASE_URL . 'login');
            die(); 
        }
    }   

    function logout() {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL . 'login');
    }    

    function initSession($user) {
        //if(session_status() !== PHP_SESSION_ACTIVE) session_start();
        session_start();
        $_SESSION['ID_USER'] = $user->id;
        $_SESSION['USER_NAME'] = $user->username;
        $_SESSION['EMAIL_USER'] = $user->email;
        $_SESSION['ROL_USER'] = $user->rol;
        $_SESSION['TIMEOUT'] = time();
     }

/*      session_start();
     // Establecer tiempo de vida de la sesión en segundos
     $inactividad = 1000;
     // Comprobar si $_SESSION["timeout"] está establecida
     if(isset($_SESSION["timeout"])){
         // Calcular el tiempo de vida de la sesión (TTL = Time To Live)
         $sessionTTL = time() - $_SESSION["timeout"];
         if($sessionTTL > $inactividad){
             session_destroy();
             header("Location: " . BASE_URL . 'login');
         }
     }
     // El siguiente key se crea cuando se inicia sesión
     $_SESSION["timeout"] = time(); */

}