<?php
    define('ACTION', 0);
    define('PARAMS', 1);
  
    include_once 'web/config/ConfigApp.php';
    include_once 'web/model/Model.php';
    include_once 'web/view/View.php';
    include_once 'web/controller/Controller.php';
    include_once 'web/controller/WebController.php'; 

    function parseURL($url)
    {
        $urlExploded = explode('/', $url);
        $arrayReturn[ConfigApp::$ACTION] = $urlExploded[ACTION];
        $arrayReturn[ConfigApp::$PARAMS] = isset($urlExploded[PARAMS]) ? array_slice($urlExploded,1) : null;
        return $arrayReturn;
    }

    if(isset($_GET['action']))
    {
        $urlData = parseURL($_GET['action']);
        $action = $urlData[ConfigApp::$ACTION];
        if(array_key_exists($action,ConfigApp::$ACTIONS)){
            $params = $urlData[ConfigApp::$PARAMS];
            $action = explode('#',ConfigApp::$ACTIONS[$action]);
            $controller =  new $action[0]();
            $metodo = $action[1];
            if(isset($params) &&  $params != null){
                echo $controller->$metodo($params);
            }
            else{
                echo $controller->$metodo();
            }
        }
    }
?>  