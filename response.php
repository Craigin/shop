<?php
require_once 'lib/ini.php';

//写日志
$log = new \lib\log();
$log->write('yjf',"接收易极付数据=》" . print_r($_REQUEST, 1));

//语言包
$lang = $lang->getLang();
$htmlData['lang'] =  $lang;

$order = new \lib\order($register);
//找支付配置
$payments = new \lib\payment($register);
$payment = $payments->get('yjf');

$status = strtolower(I("status"));
$orderNo = I("orderNo");
$merchOrderNo = I("merchOrderNo") ;
$getSign = I("sign");
$success =   I('success');
//判断此订单是否成功
$orderFind = $order->getOrder($orderNo);
$product = $order->getProduct($orderFind['product_id']);
if($orderFind['order_status'] =='SUCCESS')
{
    //如果是异步回调
    if($_SERVER['REQUEST_METHOD'] =="POST")
    {
        echo "SUCCESS";
    }
    //否则跳转到支付成功页面
    else{

        $htmlData['total'] = round(money_int($orderFind['payment_amount'],'float'));
        $htmlData['pay_method'] =  $orderFind['pay_type']=='易极付'? $htmlData['lang']['yijifu']:$htmlData['lang']['cash_on_delivery'];
        $htmlData['name'] =  $orderFind['name'] ;
        $htmlData['last_name'] =  $orderFind['last_name'] ;
        $htmlData['mobile'] =  $orderFind['mobile'] ;
        $htmlData['address'] =   $orderFind['address'];
        $htmlData['shipping']  ='0.00';
        $htmlData['add_time'] =  $orderFind['add_time'] ;
        $htmlData['title'] =  $orderFind['title'] ;
        $htmlData['num'] =  $orderFind['num'] ;
        $htmlData['order_id'] =  $merchOrderNo;
        $attr_name = $order->getOrderGoodsAttr($orderFind['order_id'],$product['erp_number'])  ;
        $htmlData['attr_name'] = $attr_name;
        $htmlData['currency'] =  $product['currency'];
        $htmlData['currency_code'] =  $product['currency_code'];
        $htmlData['fb_px'] =  $product['fb_px'];
        showSuccessTemplates($view,$htmlData);
    }
    exit;
}

if ($success == 'true') {
    $data['orderNo'] =  $orderNo;
    $data['merchOrderNo']  = $merchOrderNo;
    //判断加密
    if($_REQUEST['a2546_pages'] || $_REQUEST['a2546_times'])
    {
            unset($_REQUEST['a2546_pages']) ;
            unset($_REQUEST['a2546_times']) ;
    }

    ksort($_REQUEST);
    $signSrc="";
    foreach($_REQUEST as $k=>$v)
    {
        if(empty($v)||$v===""||$k=='sign')
            unset($_REQUEST[$k]);
        else
            $signSrc.= $k.'='.$v.'&';
    }
    $signSrc =  substr($signSrc, 0, -1);
    if(get_magic_quotes_gpc()){
        $signSrc = stripslashes($signSrc);
    }
    $signSrc .=$payment['key'];
    $sign = md5($signSrc) ;
    if($sign != $getSign)
    {
        $log->write('order',"加密错误==》计算：".$sign."get：".$getSign."加密窜：".$signSrc) ;
        $msg = $lang['sign_wrong'];
        $order->updateOrder($orderNo,'FAIL',$msg);
        $order->erpTransport($data,$status,$msg);
        $htmlData['lang']['title'] = $lang['sign_wrong'];
        $view->display('error_pay.twig',$htmlData);
        exit;
    }

    if($status == 'fail')
    {
            $msg = $_REQUEST['description'];
            $order->updateOrder($orderNo,'FAIL',$msg);
            $order->erpTransport($data,$status,$msg);
            $htmlData['lang']['title'] = $lang['order_submit_fail'];
            $view->display('error_pay.twig',$htmlData);
            exit;
    }
    if ($status == 'authorizing') {
        //预授权订单通过
        $esp = new \lib\esp();
        $rets =$esp->authAccept($data,$payment);
        if(!$rets['ret'])
        {
            $status = 'FAIL';
            $msg = 'Authorization failure!';
            $order->updateOrder($orderNo,$status,$msg);
            $order->erpTransport($data,$status,$msg);

            $htmlData['lang']['title'] = $msg;
            $view->display('error_pay.twig',$htmlData);
            exit;
        }
    }
    $return = json_decode($ret['return']);
    //更新本地数据库
    $order->updateOrder($orderNo,'SUCCESS',"支付成功");
    //erp通信
    $order->erpTransport($data,'success','支付成功');
    //如果是异步回调
    if($_SERVER['REQUEST_METHOD'] =="POST")
    {
        echo "SUCCESS";
    }
    //否则跳转到支付成功页面
    else{
        $htmlData['total'] =  round(money_int($orderFind['payment_amount'],'float'));
        $htmlData['pay_method'] =  $orderFind['pay_type']=='易极付'? $htmlData['lang']['yijifu']:$htmlData['lang']['cash_on_delivery'];
        $htmlData['name'] =  $orderFind['name'] ;
        $htmlData['last_name'] =  $orderFind['last_name'] ;
        $htmlData['mobile'] =  $orderFind['mobile'] ;
        $htmlData['address'] =   $orderFind['address'];
        $htmlData['shipping']  ='0.00';
        $htmlData['add_time'] =  $orderFind['add_time'] ;
        $htmlData['title'] =  $orderFind['title'] ;
        $htmlData['num'] =  $orderFind['num'] ;
        $htmlData['order_id'] =  $merchOrderNo;
        $htmlData['thumb'] =  $product['thumb'];
        $htmlData['market_price'] = $product['market_price'];
        $htmlData['service_contact_id'] = $product['service_contact_id'];
        $attr_name = $order->getOrderGoodsAttr($orderFind['order_id'],$product['erp_number'])  ;
        $htmlData['attr_name'] = $attr_name;
        $ret['THEME'] = '/theme/'.$ret['theme'];
        $htmlData['currency'] =  $product['currency'];
        $htmlData['currency_code'] =  $product['currency_code'];
        $htmlData['fb_px'] =  $product['fb_px'];
        showSuccessTemplates($view,$htmlData);
      }
}
else{
    $msg = $_REQUEST['resultMessage'];
    $data['orderNo']   = $orderNo;
    //更新本地数据库
    $order->updateOrder($orderNo,'FAIL',$msg);
    $htmlData['lang']['title'] = $msg;
    $view->display('error_pay.twig',$htmlData);
}

function showSuccessTemplates($view,$data)
{
    $view->display('success.twig',$data);
}
function showErrorTemplates($view,$data)
{
    $view->display('error_pay.twig',$data);
}
