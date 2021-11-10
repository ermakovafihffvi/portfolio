<?php
class M_Catalog {
    function getPopularItems($num) {
        try {
            include('configDB.php');
            $str = $db->prepare("SELECT * FROM `goods` LIMIT :num");
            $str->bindValue(':num', (int) $num, PDO::PARAM_INT);
            $str->execute();
            $rows = $str->fetchAll(PDO::FETCH_ASSOC);
            if($rows){
                //return json_encode($rows);
                return $rows;
            } else {
                return false;
            }

        } catch(PDOException $e)
        {
            die("Error: ".$e->getMessage());
        }

    }

    function getCatalog() {
        try {
            include('configDB.php');
            $str = $db->prepare("SELECT * FROM `goods` LIMIT 2");
            //$str->bindValue(':num', (int) $num, PDO::PARAM_INT);
            $str->execute();
            $rows = $str->fetchAll(PDO::FETCH_ASSOC);
            if($rows){
                //return json_encode($rows);
                return $rows;
            } else {
                return false;
            }

        } catch(PDOException $e)
        {
            die("Error: ".$e->getMessage());
        }
    }

    function getItem($id){
        try {
            include('configDB.php');
            $str = $db->prepare("SELECT * FROM `goods` WHERE id=:id");
            $str->bindValue(':id', (int) $id, PDO::PARAM_INT);
            $str->execute();
            $rows = $str->fetchAll(PDO::FETCH_ASSOC);
            if($rows){
                //return json_encode($rows);
                return $rows;
            } else {
                return false;
            }

        } catch(PDOException $e)
        {
            die("Error: ".$e->getMessage());
        }
    }
}