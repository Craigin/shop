<?php
namespace lib;

class view{
    public $path;
    public $root_path;
    public $view;

    public function __construct($path,$root_path)
    {
              $this->path = $path;
              $this->root_path = $root_path;
              $loader = new \Twig_Loader_Filesystem([$this->path,$this->root_path]);
              $this->view =  new \Twig_Environment($loader);
    }

    public function display($template,$arg=[]){

        $this->view->display($template,$arg);
    }




}