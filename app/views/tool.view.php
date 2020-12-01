<?php
require_once ('libs/smarty/libs/Smarty.class.php');



class ToolView {

    function showTools($tools) {
        $smarty = new Smarty();
        $smarty -> assign('tools',$tools);
        $smarty -> display('templates/show_tools_filtradas.tpl');
    }

    function showToolsPaged($tools, $pagina, $tot_paginas)
    {
        $smarty = new Smarty();
        $smarty->assign('tools',$tools);
        $smarty->assign('actual_page', $pagina);
        $smarty->assign('tot_paginas',$tot_paginas);
        $smarty->display('templates/showToolsPag.tpl');
    } 

    function showRubros($rubros) {
        $smarty = new Smarty();
        $smarty -> assign('rubros',$rubros);
        
        $smarty -> display('templates/show_rubros.tpl');
    }
    function showRubrosFiltrados($id) {
        $smarty = new Smarty();
        $smarty -> assign('rubro',$id);
        $smarty -> display('templates/show_rubros_filtrados.tpl');
    }

    function showToolsconRubros($tools) {
        $smarty = new Smarty();
        $smarty -> assign('tools',$tools);
        $smarty -> display('templates/show_tools_filtradas.tpl');
    }

    function showRubroEditar ($rubro){
        $smarty = new Smarty();
        $smarty -> assign('rubro',$rubro);
        $smarty -> display('templates/show_rubro_editar.tpl');
    }

    function showToolsconFiltro($tools) {  
        $smarty = new Smarty();
        $smarty -> assign('tools',$tools);
        $smarty -> display('templates/show_tools_filtradas.tpl');
    }

    function showDetails($tools) {
        $smarty = new Smarty();
        $smarty -> assign('tools',$tools);
        $smarty -> display('templates/show_details_csr.tpl');
    }
/* 
    function showComentCSR($id) {
        $smarty = new Smarty();
        $smarty -> assign('idmaq',$id);
        $smarty->display('templates/show_coment_csr.tpl');  
    } */

    function showError($msg) {
        echo "<h1> ERROR!</h1>";
        echo "<h2> $msg </h2>";
    }
    
    function abm_tools($tools,$rubros) {
        $smarty = new Smarty();
        $smarty -> assign('tools',$tools);
        $smarty -> assign('rubros',$rubros);
        $act = "insert-tool";
        $smarty -> assign('accion',$act);
        $boton = "Agregar";
        $smarty -> assign('boton',$boton);
        $smarty -> display('templates/abm_tools.tpl');
    }
    
    function showToolEditar ($tool,$tools,$rubros){
        $smarty = new Smarty();
        $smarty -> assign('tool',$tool);       
        $smarty -> assign('tools',$tools);
        $smarty -> assign('rubros',$rubros);
        $act = "update-tool";
        $smarty -> assign('accion',$act);
        $boton = "Modificar";
        $smarty -> assign('boton',$boton);
        $smarty -> display('templates/abm_tools.tpl');
    }

    function abm_rubros($rubros) {
        $smarty = new Smarty();
        $smarty -> assign('rubros',$rubros);
        $smarty -> display('templates/abm_rubros.tpl');
    }
 }
