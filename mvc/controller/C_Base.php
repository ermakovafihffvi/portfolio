<?php

include_once('model/M_User.php');

abstract class C_Base extends C_Controller {
    protected $title;
    protected $content;
    //protected $keyWords;

    public function render(){
        $user = new M_User();
        if(isset($_SESSION['user_id'])) {
            $user_ar = $user->getUserById($_SESSION['user_id']); //вернёт либо данные юзера, лмбо false
        } else {
            $user_ar = false;
        }

        if(array_key_exists("prod_to_cart_id", $_SESSION)){
            $l = count($_SESSION['prod_to_cart_id']); //пересчитваем длину массива
        } else {
            $l = 0;
        }

        $vars = array('title' => $this->title,
                      'content' => $this->content,
                      'user' => $user_ar,
                      'numer_cart_items' => $l);
        $page = $this->Template('view/v_main.php', $vars);
        echo $page;
    }
}