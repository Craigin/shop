<?php
require_once 'ini.php';
$comment =  new \admin\helper\comment($register);
 if($_GET['act'] && $_GET['act'] =='edit')
 {

     $comment_id = I('get.comment_id');
     if($comment_id)
     {
         $data = $comment->getComment($comment_id) ;
     }
     $product = new \admin\helper\product($register);
     $data['product'] = $product->getProduct();
     $data['admin'] =  $_SESSION['admin'];
     $register->get('view')->display('comment.twig',$data);
 }
 elseif($_POST['act'] && $_POST['act'] =='save'){
     $photos = $_FILES['photos'];
     $data = I('post.');

     unset($data['act']) ;
      $comment_id =  $data['comment_id'];
     if($comment_id)
     {
         unset($data['comment_id']);
         //编辑
         $map = ['comment_id'=>$comment_id] ;
         $db->update('product_comment',$data,$map);
     }
     else{
         //新增
         $data['aid'] =$_SESSION['admin']['uid'];
         $comment_id =  $db->insert('product_comment',$data);
     }

     if($_FILES['photos'] && $_FILES['photos']['size'][0] >0)
     {
         $photos =[];
         $rootPath = app_path."upload/";
         $path =  'comment/'.date('y-m-d',time()).'/';
         $uploadHandler = new \Sirius\Upload\Handler($rootPath.$path);
         $result = $uploadHandler->process($_FILES['photos']);

         foreach ($result as $key=>$value)
         {
             if($value->name)
             {
                 $photos[$key]['thumb']=  '/upload/'.$path.$value->name;
                 $photos[$key]['comment_id'] = $comment_id;
             }

         }
         $result->confirm();
         //插入图集
         if(count($photos) >0)
         {
             $db->insert('product_comment_thumb',$photos);
         }

     }

     header('location:comment.php');


 }
 elseif($_POST['act'] && $_POST['act'] =='del')
 {
     $uid = $_POST['comment_id'];
     $data['is_del'] = $_POST['is_del'];
     $product = new \admin\helper\comment($register);
     $ret = $product->deleteUser($uid,$data);

     echo json_encode($ret);
 }
 else{
     $comment =  new \admin\helper\comment($register);
     $filter =[];
     $data = $comment->index($filter);
     $data['admin'] =  $_SESSION['admin'];

     $register->get('view')->display('comment_list.twig',$data);
 }