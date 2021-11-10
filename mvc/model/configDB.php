<?php
define('DB_DRIVER','mysql');
define('DB_HOST','localhost');
define('DB_NAME','goods');
define('DB_USER','root');
define('DB_PASS','');

//try{
    //$connect_str = DB_DRIVER . ':host='. DB_HOST . ';dbname=' . DB_NAME;
	//$db = new PDO($connect_str,DB_USER,DB_PASS);
	$db = new PDO('mysql:host=localhost:3309;dbname=goods','root','');
//}
//catch(PDOException $e)
//{
//	die("Error: ".$e->getMessage());
//}

?>