<?php

if(isset($_POST['start_id'])){
    $start_id = $_POST['start_id'];
    $limit = $_POST['limit'];

    include "configDB.php";
    $str = $db->prepare("SELECT * FROM `goods` where id >= :start_id limit :lim");
    $str->bindValue(':start_id', (int) $start_id, PDO::PARAM_INT);
    $str->bindValue(':lim', (int) $limit, PDO::PARAM_INT);
    $str->execute();
    $rows = $str->fetchAll(PDO::FETCH_ASSOC);
    //если последний id это последний элемент в таблице, то включить флажок-добавить "end" в массив
    //SELECT MAX(`id`) FROM `goods`
    $str1 = $db->prepare("SELECT MAX(`id`) as id FROM `goods`");
    $str1->execute();
    if(end($rows)['id'] == ($str1->fetch())['id']){
        array_push($rows, "end");
    } 
    echo json_encode($rows);
    //$id = ($str1->fetch())['id'];
    //$id = end($rows)['id'];
    //print_r($id);


    /*$query = mysqli_query($link, $sql);
    while($data = mysqli_fetch_assoc($query)){
        $files[] = $data;
    }
    echo json_encode($files);*/
    //$files = "jhkhk";
    //$start_id = $_POST["start_id"];
    //echo json_encode($_POST['start_id']);
}

/*$files = "jhkhk";
echo $files;*/