<?php
namespace admin\helper;

use admin\helper\common;

class combo extends common {

           public function findCombo($product_id)
           {
               $map['product_id'] =$product_id;
               $ret = $this->db->select('combo',"*",$map);
               $combo=[];
               if($ret)
               {
                   $combo_id = array_column($ret, 'combo_id') ;
                   $comboGoods =  $this->getComboGoods($combo_id);

                   foreach ($ret as $value)
                   {
                       $value['price']  = money_int($value['price'],'float');
                       foreach ($comboGoods as $goods)
                       {
                           if($goods['combo_id'] == $value['combo_id'])
                           {
                               $value['goodsList'][] =  $goods;
                           }

                       }
                       $combo[] = $value;
                   }
               }
               return $combo;

           }
           public function getComboGoods($combo_id)
           {

               $map['combo_id'] = $combo_id;
               $ret = $this->db->select('combo_goods',"*",$map);

               return $ret;
           }

           public function delCombo($combo_id)
           {
               $map['combo_id'] = $combo_id;
               $this->db->delete('combo',$map);
               $this->db->delete('combo_goods',$map);

               return ['ret'=>1,"msg"=>'OK'];
           }
}