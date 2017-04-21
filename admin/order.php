<?php
require_once 'ini.php';
$order = new \admin\helper\order($register);
if($_POST['act'] && $_POST['act'] =="erpTransport" ){
     $order_id = $_POST['order_id'];
     $ret = $order->erpTransport($order_id);
     echo json_encode($ret);
     exit;
}
$filter =[];
if($_GET['order_no'])
{
    $filter['OR'] = ['order_no'=>$_GET['order_no'],'erp_no'=>$_GET['order_no']];

}
if($_GET['order_status'])
{
    $filter['order_status'] =  $_GET['order_status'];

}
if($_GET['erp_status'])
{
    $filter['erp_status'] =  $_GET['erp_status'];

}
$data = $order->orderList($filter);
$data['admin'] =  $_SESSION['admin'];
$data['filter'] = $filter;

$register->get('view')->display('order_list.twig',$data);
