<?php

class M_Cart{
    function getCartItems($arr){
        //print_r($arr);
        $assocArr = [];
        foreach($arr as $n => $keyId){
            if(array_key_exists("id$keyId", $assocArr)){
                $assocArr["id$keyId"]['num']++;
            } else {
                $assocArr["id$keyId"]['num'] = 1;
                try {
                    include('configDB.php');
                    $str = $db->prepare("SELECT id, title, price, photo FROM `goods` WHERE id=:id");
                    $str->bindValue(':id', (int) $keyId, PDO::PARAM_INT);
                    $str->execute();
                    $rows = $str->fetch(PDO::FETCH_ASSOC);
                    //print_r($rows['title']);
                    $assocArr["id$keyId"]['title'] = $rows['title'];
                    $assocArr["id$keyId"]['price'] = $rows['price'];
                    $assocArr["id$keyId"]['photo'] = $rows['photo'];
                    $assocArr["id$keyId"]['id'] = $rows['id'];
        
                } catch(PDOException $e)
                {
                    die("Error: ".$e->getMessage());
                }
            }
        }
        //print_r($assocArr);
        return $assocArr;
    }

    function addToUserCart($arr, $id){
        include('configDB.php');
        $str = $db->prepare("INSERT INTO `orders` (user_id, status_id) 
                            VALUES (:user_id, :status_id)");
        //$str->bindValue(':user_id', (int) $id, PDO::PARAM_INT);
        $str->execute(array(':user_id' => $id, ':status_id' => 1));
        $len = $db->lastInsertId();

        //echo $len;

        $newarr = array();
        foreach($arr as $n => $keyId){
            if(array_key_exists("$keyId", $newarr)){
                $newarr["$keyId"]['num']++;
            } else {
                $newarr["$keyId"]['num'] = 1;
            }
        }
        //print_r($newarr);

        foreach($newarr as $id => $arrnum){
            try {
                
                include('configDB.php');
                $str1 = $db->prepare("INSERT INTO `orders_content` (no_of_order, good_id, quantity)
                                     VALUES (:no_of_order, :good_id, :quantity)");
                $str1->execute(array(':no_of_order' => $len,
                                     ':good_id' => $id,
                                     ':quantity' => $arrnum['num']));
                //echo $id; 
    
            } catch(PDOException $e)
            {
                die("Error: ".$e->getMessage());
            }
        }
    }
}