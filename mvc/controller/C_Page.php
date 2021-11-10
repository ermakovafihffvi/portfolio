<?php

include_once('model/M_Catalog.php');

class C_Page extends C_Base{
    public function action_index(){
        $this->title = "Старт";
        $items = new M_Catalog();
        $popular = $items->getPopularItems(3); //возвращает массив из товаров или false
        $this->content = 
        $this->Template('view/v_index.php', array('popular' => $popular));
    }

    public function action_showCatalog(){
        $items = new M_Catalog();
        $catalog = $items->getCatalog();
        $this->content = 
        $this->Template('view/v_catalog.php', array('catalog' => $catalog));
        //$_POST['lastId'] = end($catalog)['id'];
    }

    public function action_showItem(){
        $id_prod = $_GET['id'];
        $item = new M_Catalog();
        $prod_item = $item->getItem($id_prod);
        $this->content = 
        $this->Template('view/v_prodItem.php', array('prod_item' => $prod_item));
    }

}