<?php
require_once ('libs/smarty/libs/Smarty.class.php');

class AuthView {

    private $smarty; 
    function __construct() {
        $this->smarty = new Smarty();
    }  

    function showFormLogin($error = null) {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/form_login.tpl');
    }
    
    function showFormRegister($error = null) {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/form_registro.tpl');
    }

    function abm_users($users) {
        $smarty = new Smarty();
        $smarty -> assign('users',$users);
        $smarty -> display('templates/abm_users.tpl');
    }

    function show_user_editar($user,$users) {
        $smarty = new Smarty();
        $smarty -> assign('user',$user);
        $smarty -> assign('users',$users);
        $smarty -> display('templates/abm_users.tpl');
    }
    
}
