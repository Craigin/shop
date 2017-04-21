<?php
require_once 'lib/ini.php';
//$IP=$_SERVER['REMOTE_ADDR'];
//$IP='118.193.131.45';//香港
$IP=' 202.175.45.210';//澳门
$ret = $product->getProduct($_REQUEST['path'],$IP);
if($_POST['act'] &&  $_POST['act'] =='getAttrPrice')
{
      $data = $_POST;
      $data['price'] = $ret['price'];
      $data['combo']  = $ret['combo'];
      $class = new \lib\product_attr_price($register,$data);
      $ret = $class->getPrice();
      echo json_encode($ret);
      exit;
}
//显示页面
$theme = $ret['theme'];
$ret['THEME'] = '/theme/'.$ret['theme'];

//判断是是否选择属相，显示对应属性图片
if(I("get.proto"))
{
     $attr =    I("get.proto");
     if(strpos($attr,'|') !==false)
     {
         $exAttr = explode('|',$attr);
         foreach ($exAttr as $row)
         {
             list($attr_group,$id) = explode('-',$row);
             $ids[] = $id;
         }
     }
     else{
         list($attr_group,$id) = explode('-',$attr);
         $ids[] = $id;
     }

     $value = $register->get("db")->select('product_attr',['thumb'],['product_attr_id'=>$ids]);
     $thumb='';
      foreach ($value as $item)
      {
          if(empty($item['thumb']))
          {
             continue;
          }

          $thumb = $item['thumb'];
      }
      if($thumb)
      {
          $ret['thumb'] = $thumb;
      }

}
$view->display('checkout.twig',$ret);
