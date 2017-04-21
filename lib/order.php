<?php
namespace lib;

class order{
    public $register;

    public function __construct($register)
    {
        $this->register = $register;
    }

    public function insert($data= [])
    {
        $ret = $this->register->get('db')->insert('order',$data);
        return $ret;
    }

    public function insertGoods($data)
    {
       return $this->register->get('db')->insert('order_goods',$data);
    }

    public function getOrder($order_no)
    {
        $map =['order_no'=>$order_no];
        return $this->register->get('db')->get('order',"*",$map);
    }

    public function getOrderGoodsAttr($order_id,$erp_id)
    {
        $map =['order_id'=>$order_id,'erp_id'=>$erp_id];
        $order_goods = $this->register->get('db')->get('order_goods',['order_goods_id'],$map);
        $ret ='';
        if($order_goods)
        {
                $map = ['order_goods_id'=>$order_goods['order_goods_id']] ;
                $info = $this->register->get('db')->select('order_goods_attr',['product_attr_id'],$map);
                $product_attr_id = array_column($info,'product_attr_id');

                if($product_attr_id)
                {
                    $map = ['product_attr_id'=>$product_attr_id];
                    $product_attr= $this->register->get('db')->select('product_attr',['name'],$map);
                    foreach ($product_attr as $value)
                    {
                        $ret .= $value['name'] .' ';
                    }
                }
        }
        return $ret;
    }
    public function getProduct($product_id)
    {
        $map = ['AND'=>['product_id'=>$product_id,'is_del'=>0]] ;
        $product =  $this->register->get('db')->get('product','*',$map);

        return $product;
    }

    public function addOrder($data)
    {
        $number = $data['number'];
        $attr_value = $data["attr_value"];
        $order_products =  $data['goods_list'];
        $order_no = $data['orderNo'];
        $orderData =[
            'order_no'=>  $order_no,
            'name'=>$data['first_name'],
            'last_name'=> $data['last_name'],
            'email'=>$data['email'],
            'mobile'=>$data['tel'],
            'title'=>$data['title'],
            'address'=>  $data['addressStr'],
            'order_msg'=>"下单未付款",
            'payment_amount' =>money_int($data['amount']),
            'pay_type' => $data['payment_type']?"易极付":"货到付款",
            'erp_no'=> $data['merchOrderNo'],
            'add_time' =>$data['add_time'],
            'product_id' =>$data['product_id'],
            'ip'=>$data['ip'],
            'aid'=>$data['aid'],
            'post_erp_data'=>$data['post_erp_data'] ,
             'post_erp_msg' => $data['post_erp_msg'] ,
            'erp_status'=> $data['erp_status'] ?:"SUCCESS",
            'num' =>$number,

        ];
        $lastOrderId = $this->insert($orderData);

        foreach ($order_products as $k=>$g)
        {
            $orderGoods['title'] = $g['product_title'];
            $orderGoods['num'] = $number;
            $orderGoods['price'] = money_int($g['price']);
            $orderGoods['total'] = money_int($g['price'] * $number);
            $orderGoods['order_id'] = $lastOrderId;
            $orderGoods['erp_id'] = $g['id_product'];
            //插入订单商品表
            $goods_id = $this->insertGoods($orderGoods);
            if(count($g['attrs']) > 0)
            {
                foreach ($attr_value as $a)
                {
                    $goods_attr['order_goods_id'] =  $goods_id;
                    $goods_attr['product_attr_id'] =  $a;
                    //插入属性
                    $this->insertGoodsAttr($goods_attr);
                }
            }
        }

    }

    /**
     * @param $ip
     * @return mixed
     * 查询一小时内下单数
     */

    public function getIpOrderCount($ip)
    {
        $strToTime = date("Y-m-d H:i:s",strtotime('-1 hour'));
        $map= ['AND'=>['add_time[<>]'=>[$strToTime,date('Y-m-d H:i:s',time())],'ip'=>$ip]];
        $ret =  $this->register->get('db')->count('order_goods',$map);
        return $ret;
    }

    public function insertGoodsAttr($data)
    {
        $this->register->get('db')->insert('order_goods_attr',$data);
    }

   public function updateOrderErpStatus($order_id,$status)
   {
        $data['erp_status'] =    $status ;
        $map['order_id'] = $order_id;
        $this->register->get('db')->update('order',$data,$map);
   }

    public function updateErpStatus($order_no,$status,$msg)
    {
        $data['erp_status'] =    $status ;
        $data['post_erp_msg'] =   $msg;
        $map['order_no'] = $order_no;
        $this->register->get('db')->update('order',$data,$map);
    }

    /**
     * @param $order_no
     * @param $status
     * @param $msg
     * 更改订单状态
     */
   public function updateOrder($order_no,$status,$msg) {
       //更新产品销量库存 fixme::
        $data = ['order_status' =>$status,'order_msg'=>$msg];
        if($status =="SUCCESS")
        {
             $data['sales[+]']  = 1;
             $data['stock[-]']  = 1;
        }

        $map['order_no'] = $order_no;
        $this->register->get('db')->update('order',$data,$map);
    }

    /**
     * @param $data
     * @param $status
     * @param $msg
     * erp通信
     */
   public function erpTransport($data,$status,$msg)
    {
//         $log = new \lib\log();
//         //更新erp订单
//         $erpData = array(
//             'notify' => 'notify',
//             'id' => $data['merchOrderNo'],
//             'order_id' => $data['merchOrderNo'],
//             'orderNo' =>  $data['orderNo'],
//             'merchOrderNo' => $data['merchOrderNo'],
//             'web_url' => getHttpHost(),
//             'payment_status' => strtolower($status),
//             'payment_details' => sprintf('%s {%s, %s}', $msg, $data['orderNo'], $data['merchOrderNo'])
//         );
//         $erpData['key'] = md5($erpData['order_id'].$erpData['web_url']);
//         $send_url = 'http://www.hepxi123.com/order/api/payment';
//         $log->write('yjf','支付结果数组组装=》'.print_r($erpData,1));
//         $ret = post($send_url,$erpData) ;
//         $log->write('yjf','支付结果回调erp=》'.print_r($ret,1));
//         if(!$ret['status'])
//         {
//              $this->updateErpStatus($data['orderNo'],'FAIL','连接失败,超时或主机不稳定');
//              exit;
//         }
//         //如果是成功支付，但是因为erp返回错误，认为通信失败。
//         if($status=="SUCCESS")
//         {
//             $return = json_decode($ret['return'],true);
//             if(!$return['status'] ||$return['status']=='false')
//             {
//                 $this->updateErpStatus($data['orderNo'],'FAIL',$return['message']);
//                 exit;
//             }
//         }

		return ['ret'=>1,'msg'=>"OK"];
    }
}