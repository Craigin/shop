<?php
namespace admin\helper;

class common{

    public $register;

    public function __construct($register)
    {
        $this->register = $register;
        if(!$_SESSION['admin']['uid'])
        {
            $this->register->get("view")->display('login.twig');
            exit;
        }
    }

    public function __get($key){
        return $this->register->get($key);
    }


}