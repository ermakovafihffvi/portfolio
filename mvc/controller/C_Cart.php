<?php

include_once('model/M_Cart.php');

class C_Cart extends C_Base{

    public function getSumPrice(){
        $sumPrice = 0;
        if(array_key_exists('prod_to_cart_id', $_SESSION)){
            $cart = new M_Cart();
            $cart_items = $cart->getCartItems($_SESSION['prod_to_cart_id']);
            foreach($cart_items as $itemId => $infoArr){
                $sumPrice = $sumPrice + $infoArr['price'] * $infoArr['num'];
            }
            return $sumPrice;
        } else {
            return 0;
        }
    }
    public function action_showCart(){
        $this->title = "Cart";

        if(array_key_exists('prod_to_cart_id', $_SESSION)){
            //ищем в базе нужные итемы
            $cart = new M_Cart();
            $cart_items = $cart->getCartItems($_SESSION['prod_to_cart_id']); //возвращает массив из товаров
            $sumPrice = $this->getSumPrice();

            $this->content = 
            $this->Template('view/v_cart.php', array('cart_items' => $cart_items, 'sumPrice' => $sumPrice));

        } else {
            $this->content = 
            $this->Template('view/v_cart.php', array('text' => "Нет товаров в корзине"));
        }
    }

    public function action_checkoutPage(){
        if(isset($_SESSION['user_id'])){
            $user = new M_User();
            $user_ar = $user->getUserById($_SESSION['user_id']); //вернёт либо данные юзера, лмбо false
            $this->content = 
            $this->Template('view/v_checkoutConfirm.php', array('user_info' => $user_ar));
        } else {
            $this->content = 
            $this->Template('view/v_quickSignUp.php', array());                                           
        }
    }

    public function action_confirmorder(){
        //вытащить из сессии информацию о товарах в корзине и записать их в базу
        $cart = new M_Cart();
        if(isset($_SESSION['prod_to_cart_id'])){
            $cartAnswer = $cart->addToUserCart($_SESSION['prod_to_cart_id'], $_SESSION['user_id']);
            unset($_SESSION['prod_to_cart_id']);
            $this->content = 
            $this->Template('view/v_confirmed.php', array());
        }
        //вывести окошко что заказ успешно сформирован его можно смотреть в лк
    }
}