<?php
namespace admin\helper;

use admin\helper\common;

class product extends common {
			 
              public function getAllProduct($filter='')
              {
                   $map =  ['aid'=>$_SESSION['admin']['uid'],'ORDER'=>['add_time'=>"DESC",'product_id'=>"DESC"]];
                   if($filter)
                   {
                       $filter = ['AND'=>$filter];
                       $map = array_merge($map,$filter);
                   }
                   $data =  $this->db->pageSelect('product','*',$map,20);
                   if($data['goodsList'])
                   {
                       foreach ($data['goodsList'] as $value)
                       {
                           $value['price'] = money_int($value['price'],'float');
                           $value['market_price'] = money_int($value['market_price'],'float');
                           $value['discount'] = money_int($value['discount'],'float');
                           $ret[] =     $value;
                       }
                       $data['goodsList'] = $ret ;
                   }

                   return $data;
              }

              public function getProduct()
              { 
                  $map =  ['aid'=>$_SESSION['admin']['uid'],'is_del'=>0,'ORDER'=>['add_time'=>"DESC",'product_id'=>"DESC"]];
                  $data =  $this->db->select('product','*',$map);
                  return $data;
              }

              public function getOneProduct($product_id)
              {	  
                  $ret = $this->db->get('product',"*",['product_id'=>$product_id]);
                  $ret['price'] = money_int($ret['price'],'float');
                  $ret['market_price'] = money_int($ret['market_price'],'float');
                  $ret['discount'] = money_int($ret['discount'],'float');

                  return $ret;
              }

              public function saveProduct($product_id ,$data=[])
              {

                     if($product_id)
                     {
                         return  $this->db->update('product',$data,['product_id'=>$product_id]);

                     }
                     else{
//                      	$log = new \lib\log();
//                      	$log->write('product','产品入库==》'.print_r($data,1));
                          $this->db->insert("product",$data);
//                          $log->write('product','入库结果==》'.print_r($this->db->id(),1));
                          return $this->db->id();
                     }
              }

              public function productCheck($domain,$product_id)    {

                      $map = ["AND"=>['domain'=>$domain,'product_id[!]'=>$product_id,'is_del'=>0]];
                      $ret = $this->db->get('product','*',$map);

                      if($ret)
                      {
                          return  ['ret'=>0,'msg'=>'域名不能重复'];
                      }

                      return ['ret'=>1];
              }
              /*
               * 域名重复验证（加上二级域名）
               */
              public function domainCheck($domain,$identity_tag,$product_id)    {

                    $map = ["AND"=>['domain'=>$domain,'product_id[!]'=>$product_id,'is_del'=>0,'identity_tag'=>$identity_tag]];
                    $ret = $this->db->get('product','*',$map);

                    if($ret)
                    {
                        return  ['ret'=>0,'msg'=>'域名和二级域名不能同时重复'];
                    }

                    return ['ret'=>1];
              }
             public function productNumberCheck($number,$product_id)    {

                $map = ["AND"=>['erp_number'=>$number,'product_id[!]'=>$product_id,'is_del'=>0]];
                $ret = $this->db->count('product',$map);

                if($ret)
                {
                    return  ['ret'=>0,'msg'=>'产品erp编号不能重复'];
                }

               return ['ret'=>1];
        }



          public function getProduct_attr($product_id)
            {
                $map =['product_id'=>$product_id,'ORDER'=>["sort",'product_attr_id']];
                $attr = $this->db->select('product_attr','*',$map);
                return $attr;
            }

            public function getAttrGroup()
            {
                $map = ['ORDER'=>['sort','attr_group_id']];
                $attr_group =  $this->db->select('attr_group','*',$map);


                return $attr_group;
            }

            public function deleteAttr($id)
            {
                   $map =['product_attr_id'=>$id];

                   $ret = $this->db->delete('product_attr',$map);
                   if(!$ret)
                   {
                       return ["ret"=>0,"msg"=>"删除失败"];
                   }
                   return ["ret"=>1,"msg"=>"OK"];
            }

            public function addProductAttr($data)
            {
                $ret = $this->db->insert('product_attr',$data);
                return $ret;
            }

            public function saveProductAttr($product_attr_id,$data)
            {
                $map =['product_attr_id'=>$product_attr_id]  ;
                $ret =  $this->db->get('product_attr',['thumb'],$map);
                if($ret['thumb'])
                {
                   // $thumb =  app_path. $ret['thumb'];
                   // @unlink($thumb) ;
                }
                $this->db->update('product_attr',$data,$map);


            }

            public function delProduct($product_id,$data)
            {
                  $map = ['product_id'=>$product_id];
                  $product = $this->db->get('product',['domain','identity_tag'],$map);
                  if(!$data['is_del'])
                  {
                      $ret = $this->domainCheck($product['domain'],$product['identity_tag'],$product_id);
                      if(!$ret['ret'])
                      {
                          return ['ret'=>0,'msg'=>"恢复失败。=》".$ret['msg']];
                      }
                  }


                  $ret = $this->db->update('product',$data,$map);
                  if(!$ret)
                  {
                       return ['ret'=>$ret,'msg'=>"恢复失败。=》数据库更改失败"];
                  }

                   return ['ret'=>1,'msg'=>"OK"];
            }
}
