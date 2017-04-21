<?php
namespace lib;

class lang{

    public $theme;
    public $lang ;
    public function __construct($lang,$theme)
    {
              $this->theme =$theme;
              $this->lang = $lang;
    }

    public function getLang()
    {

        $_LANG =[];
        //引入通用的语言包
        if(file_exists(app_path.'/lang/'.$this->lang.'.php') )
        {
            require app_path.'/lang/'.$this->lang.'.php';
        }

        if(file_exists(app_path.'/theme/'.$this->theme.'/lang/'.$this->lang.'.php') )
        {
            require  app_path.'/theme/'.$this->theme.'/lang/'.$this->lang.'.php';
        }

        return $_LANG;
    }
}