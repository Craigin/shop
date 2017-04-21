<?php
require_once 'ini.php';

if($_GET['act'] && $_GET['act']=='edit')
{
    $product = new \admin\helper\user($register);
    $uid  = $_GET['uid'];
    $data =  $product->getOneUser($uid);
    $error = [];
    if($data['is_del'])
    {
        array_push($error,['title'=>'FAIL：此用户已删除，禁止修改。']);
        $data['readonly'] =1;
    }
    $data['error']  =   $error;

    $data['admin'] =  $_SESSION['admin'];
    $register->get('view')->display('user.twig',$data);
}
elseif($_GET['act'] && $_GET['act']=='save')
{
         $error = [];
         $uid = $_POST['uid'];
         if($_POST['password'])
         {
             $_POST['password'] = md5($_POST['password']) ;
         }
         else{
             unset($_POST['password']);
         }
          if(!$uid)
          {
              $_POST['add_time'] =  date('Y-m-d H:i:s',time());
              if(!$_POST['username'])
              {
                  array_push($error,['title'=>'FAIL：用户名不能为空']);
                  $data = $_POST;
                  $data['error']  = $error;
                  $data['admin'] =  $_SESSION['admin'];
                  $register->get('view')->display('user.twig',$data);
                  exit;
              }
              if(!$_POST['email'])
              {
                  array_push($error,['title'=>'FAIL：邮箱不能为空']);
                  $data = $_POST;
                  $data['error']  = $error;
                  $data['admin'] =  $_SESSION['admin'];
                  $register->get('view')->display('user.twig',$data);
                  exit;
              }
              if(!$_POST['password'])
              {
                      array_push($error,['title'=>'FAIL：密码不能为空号']);
                      $data = $_POST;
                      $data['error']  = $error;
                      $data['admin'] =  $_SESSION['admin'];
                      $register->get('view')->display('user.twig',$data);
                      exit;
              }
          }


         $product = new \admin\helper\user($register);
         $ret = $product->saveUser($uid,$_POST);
         if(!$ret['ret'])
         {
             array_push($error,['title'=>$ret['msg']]);
             $data = $_POST;
             $data['error']  = $error;
             $data['admin'] =  $_SESSION['admin'];
             $register->get('view')->display('user.twig',$data);
             exit;
         }
         header("location:user.php?");
}
elseif($_POST['act'] && $_POST['act'] =='delete')
{
    $uid = $_POST['uid'];
    $data['is_del'] = $_POST['is_del'];
    $product = new \admin\helper\user($register);
    $ret = $product->deleteUser($uid,$data);

    echo json_encode($ret);

}

else{

    $product = new \admin\helper\user($register);
    $data =  $product->getAlluser();
    $data['admin'] =  $_SESSION['admin'];
    $register->get('view')->display('user_list.twig',$data);
}