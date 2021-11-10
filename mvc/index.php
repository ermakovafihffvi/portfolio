<?php
spl_autoload_register(function ($classname){
    include_once("controller/$classname.php");
});

//site.ru/index.php?act=auth&c=User
//c - controller
//act - action

$action = 'action_';
$action .= (isset($_GET['act'])) ? $_GET['act'] : 'index';

switch ($_GET['c']) {
    case 'start':
        $controller = new C_Page();
        break;
    case 'user':
        $controller = new C_User();
        break;
    case 'lk':
        $controller = new C_Lk();
        break;
    case 'cart':
        $controller = new C_Cart();
        break;
    default:
        $controller = new C_Page();
}

$controller->Request($action);