<?php
class C_Lk extends C_Base{
    public function action_lkPage(){
        $this->title = "Личный кабинет";
        $this->content = 
        $this->Template('view/v_lk.php', array());
    }
}