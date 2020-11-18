<?php
require_once 'app/models/tool.model.php';
require_once 'app/models/user.model.php';
require_once 'app/models/rubro.model.php';
require_once 'app/api/api.view.php';

class ApiToolController {

    private $model;
    private $view;

    function __construct() {
        $this->toolmodel = new ToolModel();
        $this->view = new APIView();
        $this->data = file_get_contents("php://input");
    }

