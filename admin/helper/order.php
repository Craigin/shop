<?php
   namespace admin\helper;

   use admin\helper\common;

   class order extends common {

            public function orderList($filter='')
            {
                $map =  ['aid'=>$_SESSION['admin']['uid'],'ORDER'=>['add_time'=>"DESC",'order_id'=>"DESC"]];
                if($filter)
                {
                    $filter = ['AND'=>$filter];
                    $map = array_merge($map,$filter);
                }
                $data =  $this->db->pageSelect('order','*',$map,20);
                if($data['goodsList'])
                {
                    $order_id = array_column($data['goodsList'],'order_id');
                    $product_id = array_unique(array_column($data['goodsList'],'product_id'));
                    $orderGoods = $this->getOrderGoods($order_id);
                    $product = $this->getProduct($product_id);
                    foreach ($data['goodsList'] as $value)
                    {
                        $value['payment_amount'] = money_int($value['payment_amount'],'float');
                        $value['currency_code'] = $product[$value['product_id']]['currency_code'] ;
                        $value['thumb'] = $product[$value['product_id']]['thumb'] ;
                        $value['orderGoods'] = $orderGoods[$value['order_id']];
                        $ret[] =     $value;
                    }
                    $data['goodsList'] = $ret ;
                }
                return $data;
            }

            public function getProduct($product_id)
            {
                $map['product_id'] = $product_id;
                $data =  $this->db->select("product",['currency_code','thumb','product_id'],$map);
                $data = array_column($data,NULL,'product_id');
                return $data;
            }

            public function getOrderGoods($order_id)
            {
                 $map['order_id'] = $order_id;
                 $data =  $this->db->select("order_goods",'*',$map);
                 $info=[];
                 if($data)
                 {
                     $order_goods_id = array_column($data,'order_goods_id');
                     $goods_attr = $this->getOrderGoodsAttr($order_goods_id);
                     foreach ($data as $goods){
                         $key  = $goods['order_id'] ;
                         $goods['price'] = money_int($goods['price'],'float');
                         $goods['total'] = money_int($goods['total'],'float');
                         $goods['attr'] =  $goods_attr[$goods['order_goods_id']];
                         $info[$key][] = $goods;
                     }
                 }
                 return $info;
            }

            public function getOrderGoodsAttr($order_goods_id)
            {

                $map['order_goods_id'] = $order_goods_id;
                $data =  $this->db->select("order_goods_attr",'*',$map);
                if($data)
                {
                    $product_attr_id = array_column($data,'product_attr_id');
                    $product_attr= $this->getProductAttr($product_attr_id) ;
                    foreach ($data as $attr)
                    {
                        $ret[$attr['order_goods_id']][] = $product_attr[$attr['product_attr_id']];
                    }
                }
                return $ret;

            }

            public function getProductAttr($product_attr_id)
            {
                $map['product_attr_id'] = $product_attr_id;
                $data =  $this->db->select("product_attr",'*',$map);
                $data = array_column($data,NULL,'product_attr_id') ;
                return $data;
            }


           public function erpTransport($order_id)
           {
               $log = new \lib\log();
               $map['order_id'] = $order_id;
               $order = $this->db->get('order','*',$map);
               //判断是创建订单失败 还是通信失败。
//                if($order['erp_status'] == "FAIL")
//                {
//                    $send_url = 'http://www.hepxi123.com/order/api/payment';
//                    //更新erp订单
//                    $erpData = array(
//                        'notify' => 'notify',
//                        'id' => $order['erp_no'],
//                        'order_id' => $order['erp_no'],
//                        'orderNo' =>  $order['order_no'],
//                        'merchOrderNo' => $order['erp_no'],
//                        'web_url' => getHttpHost(),
//                        'payment_status' => strtolower($order['order_status']),
//                        'payment_details' => sprintf('%s {%s, %s}', $order['order_msg'], $order['order_no'], $order['erp_no'])
//                    );
//                    $erpData['key'] = md5($erpData['order_id'].$erpData['web_url']);
//                }
//                else{
//                    $send_url = "http://hepxi123.com/Order/Api/create_order/";
//                    $erpData    = json_decode($order['post_erp_data'],true);
//                }
//                $log->write('order','重新通信==》'.print_r($erpData,1));
               //$ret = post($send_url,$erpData);
//               $log->write('order','重新通信erp返回==》'.print_r($ret,1));
//                if(!$ret['status'])
//                {
//                     return ['ret'=>0,'msg'=>"通信失败,请检查erp服务器！"];
//                }
//                $return = json_decode($ret['return'],true) ;
//                if(!$return['status'])
//                {
//                    $msg =  $return['message'];
//                    $this->db->update('order',['post_erp_msg'=>$msg],$map);
//                    return ['ret'=>0,'msg'=>$msg];
//                }
               $this->db->update('order',['erp_status'=>'SUCCESS','post_erp_msg'=>'OK'],$map);
               return ['ret'=>1,'msg'=>"OK"];

           }
   }
