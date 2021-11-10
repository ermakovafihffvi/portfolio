<?php
include_once('model/M_User.php');

class C_User extends C_Base{
    public function action_enterPage(){
        $this->title = "Enter";
        $this->content = 
        $this->Template('view/v_enter.php', array());
    }

    public function action_enter(){
        if($_POST['submit']){
            //print_r($_POST);
            $login = $_POST['login'];
            $password = $_POST['password'];
            $user = new M_User();
            $user_ar = $user->getUser($login, $password); //вернёт либо данные юзера, лмбо false
            if($user_ar){
                $_SESSION['user_id'] = $user_ar[0]['id'];
                $orders = $user->getUserOrders($user_ar[0]['id']);
                $this->content = $this->Template('view/v_lk.php', array('login' => $user_ar[0]['login'],
                                                                   'name' => $user_ar[0]['name'],
                                                                   'adress' => $user_ar[0]['adress'],
                                                                   'tel' => $user_ar[0]['tel'],
                                                                   'email' => $user_ar[0]['email'],
                                                                   'orders' => $orders));
                //echo $user_ar['login'];
            } else {
                $this->content = 
                $this->Template('view/v_enter.php', array('text' => "Не верный логин или пароль!"));
            }

        } elseif(isset($_SESSION['user_id'])) {
            $user = new M_User();
            $user_ar = $user->getUserById($_SESSION['user_id']);
            $orders = $user->getUserOrders($_SESSION['user_id']);
            $this->content = $this->Template('view/v_lk.php', array('login' => $user_ar[0]['login'],
                                                                   'name' => $user_ar[0]['name'],
                                                                   'adress' => $user_ar[0]['adress'],
                                                                   'tel' => $user_ar[0]['tel'],
                                                                   'email' => $user_ar[0]['email'],
                                                                   'orders' => $orders));
        }
    }

    public function action_signup(){
        $this->title = "Sign Up";
        $this->content = 
        $this->Template('view/v_signup.php', array());
        if($_POST['submit']) {
            $login  = $_POST['login'];
            $user = new M_User();
            $user_ar = $user->getUserByLogin($login);
            if($user_ar) {
                $this->content = $this->Template('view/v_signup.php', array('text' => "Такой логин уже есть."));
            } else {
                if($user->regUser($_POST['name'], $_POST['login'], $_POST['pass'], $_POST['tel'], $_POST['email'], $_POST['adress'])) {
                    $this->content = 
                    $this->Template('view/v_enter.php', array('text' => "Вы успешно зерегистрировались! Войдите в лк:"));
                } else {
                    echo "что-то пошло не так...";
                }
            }
        }
    }

    public function action_quicksignup(){
        if($_POST['submit']) {
            $login  = $_POST['login'];
            $user = new M_User();
            $user_ar = $user->getUserByLogin($login);
            if($user_ar) {
                $this->content = $this->Template('view/v_quickSignUp.php', array('text' => "Такой логин уже есть."));
            } else {
                if($user->regUser($_POST['name'], $_POST['login'], $_POST['pass'], $_POST['tel'], $_POST['email'], $_POST['adress'])) {
                    //$login = $_POST['login'];
                    $password = $_POST['pass'];
                    $newuser = new M_User();
                    $newuser_ar = $newuser->getUser($login, $password); 
                    $_SESSION['user_id'] = $newuser_ar[0]['id'];
                    $this->content = 
                    $this->Template('view/v_checkoutConfirm.php', array('user_info' => $newuser_ar));
                } else {
                    echo "что-то пошло не так...";
                }
            }
        }
    }

    function action_logout(){
        session_destroy();
        header("Location: index.php");
    }
}