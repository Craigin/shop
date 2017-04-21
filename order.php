<?php
require_once 'lib/ini.php';
$ret = $product->getProduct();
$theme = $ret['theme'];

//验证token
$token =  I("post.token");
if($_SESSION['token'] =="" || $_SESSION['token'] != $token)
{
    exit("Invalid data");
}
unset($_SESSION['token']);

//控制下单频率   1小时超过10单认为是恶意下单
$orders = new lib\order($register);
$ip =  getIp();
$IpCount = $orders->getIpOrderCount($ip);
if($IpCount > 10)
{
    exit("Request frequency too fast, please try again in 1 hours");
}

//写日志
$log  = new \lib\log();
$log->write('order',"用户提交数据==》".print_r($_POST,1));
//判断数据
if(strtoupper($_SERVER['REQUEST_METHOD']) != 'POST' || !$_POST || !$_POST['num'] || !$_POST['name'] ||  !$_POST['address']
     || !$_POST['mob'] ){
    $view->display($theme.'/error.twig',$ret);
    exit;
}

//把大象塞进冰箱
$email = trim(I("post.email"));
if(empty($email))
{
    $email =  time().'-test@qq.com';
}
$time = date('Y-m-d H:i:s',time());
$remark = trim(I("post.guest"));
$number =trim(I("post.num"));
$name =trim(I("post.name"));
$lastName = trim(I("post.last_name"));
$tel = trim(I("post.mob"));
$province_id =   trim(I("post.province"));
$address = trim(I("post.address"));
$postal  = trim(I("post.postal"));
$combo_id = trim(I("post.combo_id"));
$payment_type =   trim(I("post.payment_type"));
$postAttr = I("post.attr");
 //省市信息
$regions = new \lib\region($register);
$region = $regions->getOrderRegion([$province_id]);
$province = $district = $city ="";
if($province_id == 3409 ||$province_id == 63 ||$province_id == 68)
{
    $country= '中国';
    $countryCode =  'CN';
    $province =  $region[$province_id]['region_name'];
    $provinceCode = $region[$province_id]['region_code'];
}
else{
    $country =  $region[$province_id]['region_name'];
    $countryCode =  $region[$province_id]['region_code'];
}
 //计算价钱

$param['num'] = $number;
$param['price'] = $ret['price'];
$param['combo']  = $ret['combo'];
$param['combo_id']  = $combo_id;
$product_attr_price = new \lib\product_attr_price($register,$param);
$price = $product_attr_price->getPrice();
$attr_value =[];
if ($postAttr)
{
    $attr_value =  array_values($postAttr) ;
    $attrs =  $product_attr_price->getAttrNumber($attr_value);
    if(!$attrs)
    {
        die('不存在選擇的商品屬性');
    }
}
 $title = $ret['title'];
//如果有套餐，则循环出产品
if($combo_id)
{

    $combo = $product->getComboOfId($combo_id);
    $combo_goods = $product->getComboGoods($combo_id);
    $title = $combo['title'];
    if(!$combo_goods)
    {
       die('套餐商品不存在');
    }
    $has_main_product = 0;
    foreach ($combo_goods as $key=> $goods)
    {
        $order_products[$key]['id_product'] =  $goods['erp_id']  ;
        $order_products[$key]['product_title'] =  $goods['title']  ;
        $order_products[$key]['sale_title'] =  $goods['title']  ;
        $order_products[$key]['price'] =  '0.00'  ;
        $order_products[$key]['price_title'] =  $ret['currency_code'].'0.00'  ;
        $order_products[$key]['qty'] =  $goods['num'] * $number;
        $order_products[$key]['attrs'] = []  ;
        if($goods['erp_id'] == $ret['erp_number'])
        {
            $order_products[$key]['price'] =  $price['total'] ;
            $order_products[$key]['price_title'] =  $ret['currency_code'].$price['total'];
            $order_products[$key]['attrs'] = $attrs ;
            $has_main_product =1;
        }
    }
    //判断套餐是否包含主产品
    //如果没有主产品，默认第一个给总价
    if(!$has_main_product) {
        $order_products[0]['price'] =  $price['total'] ;
        $order_products[0]['price_title'] =  $ret['currency_code'].$price['total'];
    }
}
else{
    $order_products[] =   [
        'id_product'   =>$ret['erp_number'],
        'product_title' =>$ret['title'] ,
        'sale_title' => $ret['title'],
        'price' => $price['total'] ,
        'price_title' => $ret['currency_code'].$price['total'],
        'qty' => $number,
        'attrs' => $attrs
    ];
}

//组装erp数据
$payment_method = $payment_type == 1 ? 'yjf' : 0;
$user_agent = trim($_SERVER['HTTP_USER_AGENT']);
$processing =  $payment_type ? "Pending":"processing"  ;
$order_data = array(
    'key' => md5($ret['domain'].$time),
    'web_url' => $ret['domain'],
    'first_name' => $name,
    'last_name' => isset($last_name) ?  $last_name : null,
    'tel' => $tel,
    'email' => $email,
    'address' => $address,
    'remark' => $remark,
    'zipcode' => $postal ?:null,//邮编
    'country' => $country,
    'province' =>  $province,
    'city' => $city,
    'area' => $district,
    'products' => $order_products,
    //erp
    'id_zone' => $ret['id_zone'],
    'id_department' =>  $ret['id_department'],
    'id_users' => $ret['ad_member_id'],
    'identify'=>$ret['ad_member_id'],
    'grand_total'  =>$price['total'],
    'currency_code' => $ret['currency'],

    'date_purchase'=> $time,
    'payment_method' => $payment_method,//TF线上支付 代码， 货到付款 为了兼容之前ERP，留空
    'payment_status' => $processing,//Pending:未支付， processing：已经支付   canceled：取消
    'payment_details' => '',
    'created_at' => $time, //int
    'ip' => $ip,
    'user_agent' => $user_agent,
    'number' => $number,
    'expends' => array(),
);
$order_no  =  getOrderNo();
$info['orderNo'] =$order_no ;
$info['ip'] =$ip;
$info['aid'] = $ret['aid'];
$info['product_id'] = $ret['product_id'];
$info['title'] =$ret['title'];
$info['email'] = $email;
$info['tel'] = $tel;
$info['currency']  =$ret['currency'];
$info['domain']  =$ret['domain'];
$info['price'] = $ret['price'];
$info['amount'] = $price['total'];
$info['number'] = $number ;
$info['sku'] = $ret['erp_number'] ;
$info['country'] =  $country;
$info['province']  =  $province;
$info['countryCode'] =  $countryCode;
$info['provinceCode']  =  $provinceCode;
$info['city']    = $city;
$info['district'] = $district;
$info['address']  = $address;
$info['postal']    = $postal;
$info['first_name']    = $name;
$info['goods_list'] = $order_products;
$info['last_name']  = $lastName;
$info['payment_type'] = $payment_type;
$info['post_erp_data'] = json_encode($order_data,JSON_UNESCAPED_UNICODE);
$info['attr_value'] = $attr_value;
$info['add_time'] = date('Y-m-d H:i:s',time());
$addressStr =   $country.' '.$province.' '.$city.' '.$district.' '.$address  ;
if($province_id == 3409||$province_id == 63||$province_id == 68)
{
    $addressStr =  $province.' '.$city.' '.$district.' '.$address  ;
}
$info['addressStr'] =  $addressStr;
// $log->write('order',"传送给ERP数据.".print_r($order_data,1)) ;
// $url = "http://hepxi123.com/Order/Api/create_order/" ;
// $rets = post($url,$order_data);
// $log->write('order',"erp返回结果=》.".print_r($rets,1)) ;
// if($rets['status'])
// {
//      $return = json_decode($rets['return'],true);
//      if($return['status'])
//      {
//          $merchOrderNo =   $return['id_increment'];
//          if(!$merchOrderNo)
//          {
//              $merchOrderNo =  $return['order_id'] ;
//          }
         //插入本地表
//         $info['merchOrderNo'] =$merchOrderNoe ;
         $orders->addOrder($info);
         //判断是否在线支付
         if(!$payment_method)
         {
             //货到付款 返回页面数据
             $ret['order_id'] =   $merchOrderNo;
             $ret['total'] =  $info['amount'];
             $ret['pay_method'] =  $payment_type? $ret['lang']['yijifu']:$ret['lang']['cash_on_delivery'];
             $ret['name'] =  $name ;
             $ret['last_name'] =  $lastName ;
             $ret['mobile'] =  $tel ;
             $ret['title'] = $title;
             $ret['address'] =   $info['addressStr'];
             $ret['shipping']  ='0.00';
             $ret['add_time'] =  $info['add_time'] ;
             $ret['THEME'] =  'theme/'.$ret['theme'];
             $ret['num'] = $number;

             if(money_int($price['price']) != money_int($ret['price']) )
             {
                 $ret['market_price'] = round($price['price'] / ($ret['price'] / $ret['market_price']));
             }
             $ret['price'] = $price['price'];
             if($attr_value)
             {
                 $attr_name = $product_attr_price->getAttrName($attr_value);
                 $ret['attr_name'] = $attr_name;
             }

             $view->display('success.twig',$ret);
             exit;
         }
         //获取易极付帐号信息
//          $payments = new \lib\payment($register);
//          $payment  = $payments->get('yjf') ;
//          //跳转到易极付支付
//          $esp = new \lib\esp();
//          $esp->pay($info,$payment);
//      }
//      else{
//          //记录出错原因
//          $msg = $return['message'];
//          $info['post_erp_msg'] =$msg;
//          $info['erp_status'] ="FAIL_CREATE";
//          $orders->addOrder($info);
//          $view->display('error.twig',$ret);
//      }
// }
// else {
//     //记录出错原因
//     $info['post_erp_msg'] = "post超时".print_r($rets,true);
//     $info['erp_status'] ="FAIL_CREATE";
//     $orders->addOrder($info);
//     $view->display('error.twig',$ret);
//     exit;
// }
