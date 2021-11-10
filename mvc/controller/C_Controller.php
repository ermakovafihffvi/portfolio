<?php

session_start();

abstract class C_Controller {
    protected abstract function render(); 
    //будущая функция отрисовки внутри которо запускаем Template

    public function Request($action){
        //$this->$before();
        $this->$action();
        $this->render();
    }

    protected function Template($fileName, $vars = array()){
        foreach ($vars as $k => $v)
		{
			$$k = $v;
		}

		ob_start();
		include "$fileName";
		return ob_get_clean();	
    }

    //нет функций IsGet, IsPost __call, before()

}