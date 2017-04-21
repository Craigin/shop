<?php

namespace lib;
class product_attr_price{
     public  $register;
     public $num;
     public $price;
     public $combo = [];
     public $combo_id ;

     public function __construct($register,$product)
     {
         $this->register = $register;
         $this->num =   $product['num'];
         $this->combo =  $product['combo'];
         $this->price =      $product['price'];
         $this->combo_id = $product['combo_id'];
     }

    public function getPrice()
    {
        //如果为0.则没有套餐
        if($this->combo_id ==0)
        {
            $total = $this->price * $this->num ;
            return ['ret'=>1,'price'=>$this->price,'total'=>$total];
        }

         $price = $this->combo[$this->combo_id]['price'];
         $total = $price * $this->num ;
         return ['ret'=>1,'price'=>$price,'total'=>$total];

       }



       //获取编号
       public function getAttrNumber($id =[])
       {
           $map = ['product_attr_id'=>$id];
           $ret = $this->register->get('db')->select('product_attr',['number'],$map);
           $ret = array_column($ret,'number');
           return $ret;
       }

       //获取名称
    public function getAttrName($id =[])
    {
        $map = ['product_attr_id'=>$id];
        $product_attr= $this->register->get('db')->select('product_attr',['name'],$map);
        $ret ='';
        foreach ($product_attr as $value)
        {
             $ret .= $value['name'] .' ';
        }
        return $ret;
    }


}