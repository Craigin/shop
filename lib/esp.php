<?php

namespace lib;

class esp{

    const testUrl ='https://openapi.yijifu.net/gateway.html';
    const  uri = 'https://openapiglobal.yiji.com/gateway.html';

    public function  pay($data,$payment)
    {
        $domain =  $data['domain'];
        if(strpos($domain,'www') !==false)
        {
            $domain  = str_replace('www.',"",$domain);
        }
        $info = array(
            'orderNo' => $data['orderNo'],
            'merchOrderNo' => $data['merchOrderNo'],
            'version' => '1.0',
            'protocol' => "httpPost",
            'service' => "espOrderPay",
            'notifyUrl' =>  getHttpHost(false, true).'/response.php',
            'returnUrl' =>  getHttpHost(false, true).'/response.php',
            'signType' => 'MD5',
            'partnerId' => $payment['account'],

            //业务参数
            'goodsInfoList' => array(), //商品列表
            'orderDetail' => array(),//订单扩展信息
            'userId' => $payment['account'],	//
            'currency' => $data['currency'],//原始订单币种
            'amount' => $data['amount'],
            'webSite' =>$domain,//所属网站 阿法贝迪
            'deviceFingerprintId' => md5($data['orderNo']), //设备指纹
            'memo' => '',//备注
            // 'orderAmount' => '1',//原始订单金额
            'acquiringType' => 'CRDIT',//收单类型,CRDIT：信用卡；YANDEX： 网银方式
            // 'orderExtends' => '',//系统扩展字段，json存储
            // 'merchOrderNo'=>date('YmdHis').rand(100,999), //新增参数，商户外部订单号
        );
        $goodsInfoList =[];
        foreach ($data['goods_list'] as $key=>$good)
        {
            $goodsInfoList[$key]['goodsNumber']  =  $good['id_product'];  //货号
            $goodsInfoList[$key]['goodsName']  =   $good['product_title']; //货物名称
            $goodsInfoList[$key]['goodsCount']  =  $data['number'];   //货物数量
            $goodsInfoList[$key]['itemSharpProductcode']  = "ST"; //商品分类
            $goodsInfoList[$key]['itemSharpUnitPrice']  =  $good['price']; //商品单价
        }

        //账单、收货等其它信息
        $orderDetail = array (
            'ipAddress' => $data['ip'], //IP地址
            'billtoCountry' => $data['countryCode'],  //账单国家
            'billtoState' => $data['provinceCode'],   //账单州
            'billtoCity' => $data['city'],    //账单城市
            'billtoPostalcode' => $data['postal'],    //账单邮编
            'billtoEmail' => $data['email'],    //账单邮箱

            'billtoFirstname' => $data['first_name'],   //接收账单人员名
            'billtoLastname' => $data['first_name'], //接收账单人员姓
            'billtoPhonenumber' => $data['tel'],    //账单电话
            'billtoStreet' => $data['address'],    //账单街道

            'shiptoCountry' => $data['countryCode'],  //收货国家
            'shiptoState' => $data['provinceCode'],   //收货州
            'shiptoCity' => $data['city'],    //收货城市
            'shiptoPostalcode' => $data['postal'],    //收货邮编
            'shiptoFirstname' => $data['first_name'],   //收货人姓
            'shiptoLastname' => $data['first_name'], //收货人名
            'shiptoEmail' => $data['email'],    //收货邮箱
            'shiptoPhonenumber' =>  $data['tel'],    //收货电话
            'shiptoStreet' => $data['address'],    //收货街道

            'logisticsFee' => '0.00',   //物流费
            'logisticsMode' => 'EMS',   //物流方式
            'cardType' => 'Visa',   //卡类型
            'customerEmail' => $data['email'],  //购买者邮箱
            'customerPhonenumber' => $data['tel'],  //购买者电话
            'merchantEmail' => $data['email'],  //商户邮箱
            'merchantName' => 'ST有限公司', //商户名
            'addressLine1' => $data['address'],    //卡地址1
            'addressLine2' => ''    //卡地址2
        );
        $info['goodsInfoList']	 = json_encode($goodsInfoList, JSON_UNESCAPED_UNICODE);
        $info['orderDetail']	 = json_encode($orderDetail, JSON_UNESCAPED_UNICODE);

        $log = new \lib\log();
        $log->write('yjf',"发送易极付数据=》".print_r($info,1));

        //加密
        ksort($info);
        $signSrc="";
        foreach($info as $k=>$v)
        {
            if(empty($v)|| $v==="")
               unset($info[$k]);
            else
                $signSrc.= $k.'='.$v.'&';
        }
        if(get_magic_quotes_gpc()){
            $signSrc = stripslashes($signSrc);
        }
        $signSrc =  substr($signSrc, 0, -1);
        $signSrc .= $payment['key'];
        $log->write('yjf',"签名字符串==》".$signSrc);
        $info['sign'] = md5($signSrc) ;

         $html='<form name="dinpayForm" id="dinpayForm" method="POST" action="'.self::testUrl.'" >';
            foreach($info as $k => $v){
                $html .='<input type="hidden" name="'.$k.'" value="'.htmlentities($v,ENT_QUOTES,"UTF-8").'"/>';
            }
            $html.="<script> document.dinpayForm.submit(); </script>";
            $html .='</form>';

          $log->write('yjf',"发送易极付数据from=》".print_r($html,1));
          echo $html;
    }

    public function authAccept($data,$payment)
    {
        $isAccept = 'true';
        $auth_data = array(
            'version' => '1.0',
            'protocol' => "httpPost",
            'service' => 'espOrderJudgment',
            'notifyUrl' => getHttpHost(false, true) . '/response.php',
            'returnUrl' => getHttpHost(false, true) . '/response.php',
            'signType' => 'MD5',
            'partnerId' => $payment['account'],
            //'userId' => $payment['partnerId'],
            'orderNo' => $data['orderNo'] . rand(0, 99),
            'merchOrderNo' => $data['merchOrderNo'],
            'resolveReason' => '接收交易',
            'isAccept' => $isAccept,
        );
        ksort($auth_data);
        $signSrc = "";
        foreach ($auth_data as $k => $v) {
            if (empty($v) || $v === "")
                unset($auth_data[$k]);
            else
                $signSrc .= $k . '=' . $v . '&';
        }
        $signSrc = trim($signSrc, '&') . $payment['key'];
        $auth_data['sign'] = md5($signSrc);

        $log = new \lib\log();
        $log->write('yjf',"发送易极付授权数据=》".print_r($auth_data,1));
        $ret = post(self::testUrl,$auth_data) ;
        $log->write('yjf',"发送易极付授权反回数据=》".print_r($auth_data,1));
        return $ret;
    }
}