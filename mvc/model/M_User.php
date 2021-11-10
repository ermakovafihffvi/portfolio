<?php

class M_User{
    function getUser($login, $password){
        $password = md5($password);
        try {
            include('configDB.php');
            $str = $db->prepare('SELECT * FROM `users` WHERE login=:logi AND pass=:pass');
            $str->execute(array(':logi'=>"$login", ':pass'=>"$password"));
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

    function getUserByLogin($login){
        try {
            include('configDB.php');
            $str = $db->prepare('SELECT * FROM `users` WHERE login=:logi');
            $str->execute(array(':logi'=>"$login"));
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

    function getUserById($id){
        try {
            include('configDB.php');
            $str = $db->prepare('SELECT * FROM `users` WHERE id=:id');
            $str->execute(array(':id'=>"$id"));
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

    function regUser($name, $login, $pass, $tel, $email, $adress){
        $pass = md5($pass);
        try {
            include('configDB.php');
            $str = $db->prepare('INSERT INTO `users` (name, login, pass, tel, email, adress) 
                                VALUES (:nam, :logi, :pass, :tel, :email, :adress)');
            return $str->execute(array(':logi'=>"$login", 
                                ':nam'=>"$name", 
                                ':pass'=>"$pass", 
                                ':tel'=>$tel, 
                                ':email'=>"$email", 
                                ':adress'=>"$adress"));
        } catch(PDOException $e)
        {
            die("Error: ".$e->getMessage());
        }
    }

    function getUserOrders($id){
        try {
            include('configDB.php');
            $str = $db->prepare("SELECT * FROM `orders_s` WHERE user_id=:id ORDER BY date DESC");
            $str->bindValue(':id', (int) $id, PDO::PARAM_INT);
            $str->execute();
            $rows = $str->fetchAll(PDO::FETCH_ASSOC);
            if($rows){
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

?>