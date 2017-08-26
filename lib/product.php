<?php
namespace lib;


class product{
     public  $domain;
     public $identity_tag;
     public $register;
     public function __construct($register,$serverName,$identity_tag)
     {
         $this->register = $register;
         $this->domain =  $serverName;
         $this->identity_tag = $identity_tag;
     }

    /**
     * @return mixed
     * 获取产品所有信息
     */
    public function getProduct($path,$IP)
    {
         //匹配数据，
         //$map = ['AND'=>['domain[~]'=>"%".$this->domain,'is_del'=>0, 'identity_tag'=>$this->identity_tag]] ;
         $map = ['AND'=>['domain[~]'=>"%".$this->domain,'is_del'=>0, 'identity_tag'=>$path]] ;

		//die(print_r($map));
         $product =  $this->register->get('db')->get('product','*',$map);
         //echo   $this->register->get('db')->last_query();
         if(!$product)
         {
             $view = new \lib\view('public/theme',app_path);
             $view->display('error_template.twig');
             exit;
         }else{
             //保存产品标识在session中
             $_SESSION['identity_tag'] = $this->identity_tag;
             $product['identity_tag'] = $this->identity_tag;
         }
         $lang = $product['lang'];
         $product['options'] =  $this->getProductAttr($product['product_id']);
         $product['json_options'] =  json_encode($product['options']);
         $product['lang'] = $this->register->get('lang')->getLang();
         $product['lang']['warming'] = sprintf($product['lang']['warming'],$product['service_email'],$product['service_email']);
         $product['photos'] =  $this->getProductPhotos($product['product_id']);
         $product['combo']  = $this->getCombo($product['product_id']);
         $product['comment']  = $this->getComment($product['product_id']);
         $product['comment_length'] = $this->getCommentCount($product['product_id']);
         //获取地址
         $region =  new \lib\region($this->register);
         $regions  = $region->getRegion($lang);
         if($regions['region_code']=='TW')$regions['region_name']='台灣';
         $product['regions']  = $regions;
         $product['token']  = $_SESSION['token'] ;
         if(!$_SESSION['token'])
         {
             $product['token'] =   md5(uniqid(rand(), true));
             $_SESSION['token'] = $product['token'];
         }

        $product['price'] = round(money_int( $product['price'],'float'));
        $product['market_price'] = round(money_int( $product['market_price'],'float'));

//        $IP_info=$this->GetIpLookup($IP);
//        if($IP_info['province']=='台湾'){
//            $product['currency_code']='NT$';
//        }else if($IP_info['province']=='香港'){
//            $product['currency_code']='HK$';
//            $product['price'] = round(money_int( $product['hk_price'],'float'));
//            $product['market_price'] = round(money_int( $product['hk_market_price'],'float'));
//        }else if($IP_info['province']=='澳门'){
//            $product['currency_code']='MOP';
//            $product['price'] = round(money_int( $product['mc_price'],'float'));
//            $product['market_price'] = round(money_int( $product['mc_market_price'],'float'));
//        }
        $product['discount_price'] = $product['price'];
        return $product;
    }


    /**
     * @param $product_id
     * @return array
     * 获取产品属性
     */
    public function getProductAttr($product_id)
    {
          $attr_array=[];
          $map =['product_id'=>$product_id,'ORDER'=>["sort",'product_attr_id']];
          $attrs = $this->register->get('db')->select('product_attr','*',$map);
          if($attrs)
          {
               foreach ($attrs as $key=> $attr)
               {
                   $id =    $attr['attr_group_id'];
                    if(!isset($attr_array[$id]))
                    {
                        $attr_array[$id]['attr_group_id'] =$attr['attr_group_id'];
                        $attr_array[$id]['attr_group_title'] =$attr['attr_group_title'];
                    }

                   $attr_array[$id]['attr'][$attr['product_attr_id']] =  $attr;
               }
          }
          return   $attr_array ;
    }

    /**
     * @param $product_id
     * @return mixed
     *  获取产品图集
     */
    public function getProductPhotos($product_id)
    {
        $map =['product_id'=>$product_id,'ORDER'=>['add_time'=>'DESC']];
        $ret = $this->register->get('db')->select("product_thumb",'*',$map) ;

        return $ret;
    }

    /**
     * @return bool
     * 获取产品前台展示模板
     */
    public function getProductTheme($path)
    {

        //$map = ['AND'=>['domain[~]'=>"%".$this->domain,'is_del'=>0, 'identity_tag'=>$this->identity_tag]] ;
    	$map = ['AND'=>['domain[~]'=>"%".$this->domain,'is_del'=>0, 'identity_tag'=>$path]] ;
        $theme =  $this->register->get('db')->get('product',['theme','lang'],$map);
        if(!$theme)
        {
            return false;
        }
        return $theme;
    }

    public function getComment($product_id)
    {
         $map= ['product_id'=>$product_id];
         $ret = $this->register->get('db')->select('product_comment',"*",$map);

         if($ret)
         {
             $results =[];
             $comment_id = array_column($ret,'comment_id');
             $map= ['comment_id'=>$comment_id];
             $thumb =    $this->register->get('db')->select('product_comment_thumb',['thumb','comment_id'],$map);

             foreach ($ret as $value)
             {
                 foreach ($thumb as $key=> $t)
                 {
                     if($t['comment_id'] == $value['comment_id'])
                     {
                         $value['thumb'][] =    $t;
                     }
                 }
                 $results[] = $value;
             }

         }
         return $results;
    }
    public function getCommentCount($product_id)
    {
        $map= ['product_id'=>$product_id,'is_del'=>0];
        //取出评论条数
        $count  = $this->register->get('db')->count('product_comment',$map);

        return $count;
    }

    public function getCombo($product_id)
    {
          $map['product_id'] = $product_id;
          $ret =     $this->register->get('db')->select('combo','*',$map);
          foreach ($ret as $value)
          {
              $value['price'] = round(money_int($value['price'],'float') );
              $ret[]  = $value;
          }
          $ret = array_column($ret,NULL,'combo_id');
          return  $ret;
    }
    public function getComboOfId($combo_id)
    {
        $map['combo_id'] = $combo_id;
        $ret =     $this->register->get('db')->get('combo','*',$map);
        $ret['price'] = money_int($ret['price'],'float');
        return $ret;
    }

    public function getComboGoods($combo_id)
    {
        $map['combo_id'] = $combo_id;
        $ret =     $this->register->get('db')->select('combo_goods','*',$map);
        return  $ret;
    }

    public function GetIp(){
        $realip = '';
        $unknown = 'unknown';
        if (isset($_SERVER)){
            if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], $unknown)){
                $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
                foreach($arr as $ip){
                    $ip = trim($ip);
                    if ($ip != 'unknown'){
                        $realip = $ip;
                        break;
                    }
                }
            }else if(isset($_SERVER['HTTP_CLIENT_IP']) && !empty($_SERVER['HTTP_CLIENT_IP']) && strcasecmp($_SERVER['HTTP_CLIENT_IP'], $unknown)){
                $realip = $_SERVER['HTTP_CLIENT_IP'];
            }else if(isset($_SERVER['REMOTE_ADDR']) && !empty($_SERVER['REMOTE_ADDR']) && strcasecmp($_SERVER['REMOTE_ADDR'], $unknown)){
                $realip = $_SERVER['REMOTE_ADDR'];
            }else{
                $realip = $unknown;
            }
        }else{
            if(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), $unknown)){
                $realip = getenv("HTTP_X_FORWARDED_FOR");
            }else if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), $unknown)){
                $realip = getenv("HTTP_CLIENT_IP");
            }else if(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), $unknown)){
                $realip = getenv("REMOTE_ADDR");
            }else{
                $realip = $unknown;
            }
        }
        $realip = preg_match("/[\d\.]{7,15}/", $realip, $matches) ? $matches[0] : $unknown;
        return $realip;
    }

    public function GetIpLookup($ip = ''){
        if(empty($ip)){
            $ip = $this->GetIp();
        }
        $res = @file_get_contents('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=' . $ip);
        if(empty($res)){ return false; }
        $jsonMatches = array();
        preg_match('#\{.+?\}#', $res, $jsonMatches);
        if(!isset($jsonMatches[0])){ return false; }
        $json = json_decode($jsonMatches[0], true);
        if(isset($json['ret']) && $json['ret'] == 1){
            $json['ip'] = $ip;
            unset($json['ret']);
        }else{
            return false;
        }
        return $json;
    }


}