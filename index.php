<?php
//phpinfo();exit;
require_once 'lib/ini.php';
//显示页面
//$IP=$_SERVER['REMOTE_ADDR'];
//$IP='118.193.131.45';//香港
$IP=' 202.175.45.210';//澳门
$ret = $product->getProduct($_REQUEST['path'],$IP);
$theme = $ret['theme'];
$region =  new \lib\region($register);
$ret['region']  =$region->getAllRegion();
$ret['THEME'] = '/theme/'.$ret['theme'];
//die(print_r($ret));
$view->display('index.twig',$ret);
