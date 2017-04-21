<?php
require_once 'ini.php';
if(environment !='office'){
    //判断域名是否符合条件
    $thisDomain=$_SERVER['SERVER_NAME'];
    if(!in_array($thisDomain,$config['domainList'])){
        $view = new \lib\view('../public/theme',app_path);
        $view->display('error_template.twig');
        exit;
        //echo "<script type='text/javascript'> alert('没有权限');window.history.back(-1); </script>";die;
    }
}


if($_POST['act'] && $_POST['act']=='login')
{
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $password = md5($password);

    $map =["and"=>["email"=>$email,"password"=>$password]];
    $ret = $register->get('db')->get("user","*",$map);
    if(!$ret)
    {
        $data['error'] ='用户名或密码错误！';
        $register->get("view")->display('login.twig',$data);
        exit;
    }
    $_SESSION['admin'] = $ret;
    header("Location: index.php?");
}
else if($_GET['act'] && $_GET['act']=='logout')
{
    $_SESSION['admin']  =null;
    $register->get("view")->display('login.twig');
}

else{

    if(!$_SESSION['admin']['uid'])
    {
        $register->get("view")->display('login.twig');
    }
    else{
        $data =  $_SESSION;
        //查询订单和产品
        $allOrderNum = $register->get("db")->count('order');
        $data['allOrderNum'] = $allOrderNum;
        $map =['add_time[<>]'=>[date("Y-m-d 00:00:00"),date("Y-m-d H:i:s")]];
        $dayOrderNum =    $register->get("db")->count('order',$map);
        $data['dayOrderNum'] = $dayOrderNum;

        $product =   $register->get("db")->count('product');
        $data['product'] =   $product;
        $dayProduct =   $register->get("db")->count('product',$map);
        $data['dayProductNum'] = $dayProduct;

        $failNum   =     $register->get("db")->count('order',['erp_status'=>['FAIL','CREATE_FAIL']]);
        $data['failNum'] = $failNum;
        $register->get("view")->display('index.twig',$data);
    }


}

