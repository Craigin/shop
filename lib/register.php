<?php

namespace lib;

class register{

     public $register;

     public   function set($key,$value)
     {
         $this->register[$key] = $value;

     }

     public function get($key)
     {
         return     $this->register[$key];
     }


}