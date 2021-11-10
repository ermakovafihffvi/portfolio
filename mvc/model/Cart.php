<?php
session_start();
if(isset($_POST['id'])){
    $id = $_POST['id'];
    //$arr = array();
    //array_push($_COOKIE, $id);
    //$_SESSION['cart_id'] = $id;
    if(array_key_exists("prod_to_cart_id", $_SESSION)){
        $l = count($_SESSION['prod_to_cart_id']); //пересчитваем длину массива
    } else {
        $l = 0;
    }
    
    $_SESSION['prod_to_cart_id'][$l] = $id; //дописываем последний элемент
    //array_push($_SESSION['prod_to_cart_id'], $id);
    //print_r($_SESSION);
    echo ++$l;
}

if(isset($_POST['idPlus'])){
    $id = $_POST['idPlus'];
    $l = count($_SESSION['prod_to_cart_id']); //пересчитваем длину массива
    $_SESSION['prod_to_cart_id'][$l] = $id; //дописываем последний элемент
    //print_r($_SESSION);
    echo ++$l;
}

if(isset($_POST['idMinus'])){
    $id = $_POST['idMinus'];
    $n = array_search($id, $_SESSION['prod_to_cart_id']);
    unset($_SESSION['prod_to_cart_id'][$n]);
    //print_r($_SESSION['prod_to_cart_id']);
    echo count($_SESSION['prod_to_cart_id']);
}

if(isset($_POST['clearCart'])){
    unset($_SESSION['prod_to_cart_id']);
    print_r($_SESSION);
}

/*if(isset($_POST['confirm_order'])){
    include "../controller/C_Cart.php";
    $cart = new C_Cart();
    $cart->action_confirmorder();
    print_r($_SESSION);
}*/