<?php

namespace admin\helper;
class comment extends common {

      public function index($filter)
      {
          $map =  ['aid'=>$_SESSION['admin']['uid'],'ORDER'=>['add_time'=>"DESC",'comment_id'=>"DESC"]];
          if($filter)
          {
              $filter = ['AND'=>$filter];
              $map = array_merge($map,$filter);
          }
          $data =  $this->db->pageSelect('product_comment','*',$map,20);
          if($data['goodsList'])
          {
              $product_id = array_unique(array_column($data['goodsList'],'product_id'));
              $product = $this->getProduct($product_id);
              foreach ($data['goodsList'] as $value)
              {
                  $value['title'] = $product[$value['product_id']]['title'];
                  $ret[] =     $value;
              }
              $data['goodsList'] = $ret ;
          }
          return $data;

      }

      public function getProduct($product_id)
      {
          $map['product_id'] = $product_id;
          $data =  $this->db->select("product",['currency_code','thumb','product_id','title'],$map);
          $data = array_column($data,NULL,'product_id');
          return $data;
      }
    public  function deleteUser($uid,$data)
    {
        $map = ['comment_id'=>$uid];
        $ret = $this->db->update('product_comment',$data,$map);
        if(!$ret)
        {
            return ['ret'=>$ret,'msg'=>"失败=》数据库更改失败"];
        }

        return ['ret'=>1,'msg'=>"OK"];

    }

      public function getComment($comment_id)
      {
          $map['comment_id'] = $comment_id;
          $comment = $this->db->get('product_comment','*',$map);

          if($comment)
          {
              $thumbs =   $this->db->select('product_comment_thumb','*',$map);
              $comment['thumbs'] = $thumbs;
          }

          return    $comment;
      }

}