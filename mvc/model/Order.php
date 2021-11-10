<?php
if(isset($_POST['id'])){
    $id = $_POST['id'];
    include_once("configDB.php");
    $str = $db->prepare("SELECT * FROM `orders_content_full` WHERE no_of_order=:id");
    $str->execute(array(':id' => $id));
    $rows = $str->fetchAll(PDO::FETCH_ASSOC);
    $rows = json_encode($rows);
    //print_r($rows);
    echo $rows;
}