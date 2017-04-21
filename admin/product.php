<?php
require_once 'ini.php';
$log = new \lib\log();
if($_GET['act'] && $_GET['act']=='edit')
{
    //修改
    $product = new \admin\helper\product($register);
    $product_id  = $_GET['product_id'];
    $data =  $product->getOneProduct($product_id);
    $data['admin'] =  $_SESSION['admin'];

    //循环可选的皮肤
    $dir = getThemeDir();
    $data['themes'] = $dir;
     if($product_id)
     {
         //查找属性
         $attr =   $product->getProduct_attr($product_id);
         $data['attr'] = $attr;

         //erp信息
//          $uri = 'http://www.hepxi123.com/Domain/Api/get_all?name='.$data['domain'];
//          $info = file_get_contents($uri);
//          $info = json_decode($info,true);
//          $data['erp'] =   $info['data'];

         //图集
         $photos = $db->select('product_thumb','*',["ORDER"=>['add_time'=>"DESC"],'product_id'=>$product_id]);
         $data['photos'] = $photos;

         //套餐
         $combo =  new \admin\helper\combo($register);
         $combo =  $combo->findCombo($product_id);
         $data['combo'] = $combo;
     }
    $_SESSION['token'] = $data['token'] =   md5(uniqid(rand(), true));
    $region = $db->select('region','*',['parent_id'=>0]);
    $data['region'] = $region;
    
    //die(print_r($data));
    $register->get('view')->display('product.twig',$data);
}

else if($_GET['act'] && $_GET['act']=='save') {

    $product = new \admin\helper\product($register);
    $product_id = $_POST['product_id'];
    $is_edit =    empty($product_id) ? false:true;
    if($_POST['token'] != $_SESSION['token'])
    {
        $error['content'] = '禁止重复提交，第一次提交保存成功！';
        $error['url'] ="product.php?" ;
        $register->get('view')->display('error.twig',$error);
        exit;
    }
    $error = [];
    if (!$_POST['theme']) {
        array_push($error, ['title' => '主题不能空']);
    }

    if (!$_POST['domain']) {
        array_push($error, ['title' => '域名不能空']);
    }
    //允许重复域名
    elseif(isset($_POST['identity_tag']) && !empty($_POST['identity_tag'])) {
        $ret = $product->domainCheck($_POST['domain'],$_POST['identity_tag'],$product_id);
        if (!$ret['ret']) {
            array_push($error, ['title' => $ret['msg']]);
        }
    }


    if (!$_POST['lang']) {
        array_push($error, ['title' => '前台显示语言包不能空']);
    }

    if (!$_POST['title']) {
        array_push($error, ['title' => '产品名称不能空']);
    }

    if (!$_POST['price']) {
        array_push($error, ['title' => '价格不能为空']);
    }

    if (isset($_FILES['thumbs']) && $_FILES['thumbs']['size'] > 0) {
        //上传缩略图
        $rootPath = app_path . "upload/";
        $path = $_POST['theme'] . '/thumb/' . date('y-m-d', time()) . '/';
        $uploadHandler = new \Sirius\Upload\Handler($rootPath . $path);
        $result = $uploadHandler->process($_FILES['thumbs']);
        if (!$result->isValid()) {
            $messages = $result->getMessages();
            array_push($error, ['title' => $messages]);
        } else {
            $imgUrl = '/upload/' . $path . $result->name;
            $save['thumb'] = $imgUrl;
            $result->confirm();
        }
    }

    if(isset($_FILES['logo']) && $_FILES['logo']['size'] >0)
    {
        //上传缩略图
        $rootPath = app_path."upload/";
        $path =  $_POST['theme'].'/thumb/'.date('y-m-d',time()).'/';
        $uploadHandler = new \Sirius\Upload\Handler($rootPath.$path);
        $result = $uploadHandler->process($_FILES['logo']);
        if (!$result->isValid()) {
            $messages = $result->getMessages();
            array_push($error,['title'=>$messages]) ;
        }
        else{
            $imgUrl =  '/upload/'.$path.$result->name;
            $save['logo'] =$imgUrl;
            $result->confirm();
        }
    }
    if(count($error) >0)
    {
        //有报错的情况，重新获取数据，渲染编辑页面
        $product_id  = $_POST['product_id'];
        $data = $_POST;
        $data['admin'] =  $_SESSION['admin'];
        //循环可选的皮肤
        $dir = getThemeDir();
        $data['themes'] = $dir;
        //查找属性
        $attr =   $product->getProduct_attr($product_id);
        $data['attr'] = $attr;
        //erp信息
//         $uri = 'http://www.hepxi123.com/Domain/Api/get_all?name='.$data['domain'];
//         $info = file_get_contents($uri);
//         $info = json_decode($info,true);
//         $data['erp'] =   $info['data'];
        //图集
        $photos = $db->select('product_thumb','*',["ORDER"=>['add_time'=>"DESC"],'product_id'=>$product_id]);
        $data['photos'] = $photos;
        //套餐
        $combo =  new \admin\helper\combo($register);
        $combo =  $combo->findCombo($product_id);
        $data['combo'] = $combo;
        $data['error'] =  $error;
        $_SESSION['token'] = $data['token'] =   md5(uniqid(rand(), true));
        $region = $db->select('region','*',['parent_id'=>0]);
        $data['region'] = $region;

//        $data = $_POST;
//        $data['admin'] =  $_SESSION['admin'];
//        $data['error'] =  $error;
//        //查找属性
//        $attr =   $product->getProduct_attr($product_id);
//        $data['attr'] = $attr;
        //属性组
        $attr_group = $product->getAttrGroup();
        $data['attr_group'] = $attr_group;
        $register->get('view')->display('product.twig',$data);
        exit ;
    }
    $currency = $_POST['currency'];
    $currencyExp = explode('_',$currency);
    $save['currency']  = $currencyExp[0];
    $save['currency_prefix'] = 1;
    $save['currency_code'] = $currencyExp[1];
    if($currencyExp[1] =="" || $currencyExp[1] == null)
    {
         $save['currency_prefix'] = 0;
         $save['currency_code'] = $currencyExp[2];
    }
    $save['domain'] =  trim($_POST['domain']);
    $save['identity_tag'] =  trim($_POST['identity_tag']);
    $save['id_department'] = $_POST['id_department'];
    $save['id_zone'] = $_POST['id_zone'];
    $save['ad_member_id'] = $_POST['users'];
    $save['lang'] =  $_POST['lang'];
    $save['theme'] =  $_POST['theme'];
    $save['content'] = $_POST['content'];
    $save['price'] =  money_int($_POST['price']);
    if(!$_POST['market_price'])
    {
        $market_price = round($_POST['price'] / ($_POST['discount']/10));
        $save['market_price'] = money_int($market_price);
    }
    else{
        $save['market_price'] =money_int($_POST['market_price']) ;
    }
    $save['discount'] =   money_int($_POST['discount']);
    $save['title'] =  $_POST['title'];
    $save['payment_online'] =  $_POST['payment_online'];
    $save['payment_underline'] =  $_POST['payment_underline'];
    $save['erp_number'] =  trim($_POST['erp_number']);
    $save['la'] =  $_POST['la'];
    $save['fb_px'] =  trim($_POST['fb_px']);
    $save['aid'] =  $_SESSION['admin']['uid'];
    $save['sales'] =  $_POST['sales']?:1000;
    $save['stock'] = $_POST['stock']?:100;
    $save['service_contact_id'] = $_POST['service_contact_id'];
    $save['service_email'] = $_POST['service_email'];
    $save['google_js'] = $_POST['google_js'];
    $save['yahoo_js'] = $_POST['yahoo_js'];
    $save['yahoo_js_trigger'] = $_POST['yahoo_js_trigger'];
    $save['tips'] = $_POST['tips'];
    if(!$_POST['seo_title'] || !$_POST['seo_description'])
    {
        $save['seo_title'] =  $save['seo_description']  = $_POST['title'];

    }else{
        $save['seo_title'] =  $_POST['seo_title'];
        $save['seo_description'] =  $_POST['seo_description'];
    }
    if(!$product_id)
    {
        $save['add_time']  = date("Y-m-d H:i:s",time());
    }
    unset($_SESSION['token']);
    $ret =  $product->saveProduct($product_id,$save);

    //插入属性
    if(!$product_id)
    {
        $product_id = $ret ;
    }
    //判断是否有新增属性，有就写入
    if($_POST['attr_title']){
        foreach($_POST['attr_title'] as $k =>$v){
            $addAttr=array();
            $addAttr['name'] = $_POST['name'][$k] ;
            $addAttr['attr_group_id'] = $_POST['add_attr_group_id'][$k] ;
            $addAttr['product_id'] = $product_id;
            $addAttr['attr_group_title'] =   $_POST['attr_title'][$k];
            $addAttr['number'] = $_POST['attr_erp_number'][$k];
            $ret = $product->addProductAttr($addAttr);
            array_push($_POST['attr_group_id'],$ret);
        }
    }

    if($_POST['attr_group_id'])
    {
        $attr_data = [];
        $attr_thumb =[];
        if(isset($_FILES['attr_thumb']) )
        {
             //上传图片
            $rootPath = app_path."upload/";
            $path =  $_POST['theme'].'/thumb/'.date('y-m-d',time()).'/';
            $uploadHandler = new \Sirius\Upload\Handler($rootPath.$path);
            $result = $uploadHandler->process($_FILES['attr_thumb']);

            foreach ($result as $key=>$value)
            {
                if($value->name)
                {
                    $attr_thumb[$key]=  '/upload/'.$path.$value->name;
                }
            }
            $result->confirm();
        }

        if($is_edit)
        {
            foreach ($_POST['attr_group_id'] as $key=> $attr_id)
            {
                if($attr_thumb[$key])
                {
                    $attrArray['thumb'] =  $attr_thumb[$key];
                    $product->saveProductAttr($attr_id,$attrArray);
                }

            }
        }
        else{
            foreach ($_POST['attr_group_id'] as $key=> $attr_id)
            {
                $attrArray['name'] = $_POST['name'][$key] ;
                $attrArray['attr_group_id'] = $_POST['attr_group_id'][$key] ;
                $attrArray['product_id'] = $product_id;
                $attrArray['thumb'] =  $attr_thumb[$key];
                $attrArray['attr_group_title'] =   $_POST['attr_group_title'][$key];
                $attrArray['number'] = $_POST['attr_erp_number'][$key];
                $attr_data[] =  $attrArray;
            }
            $ret = $product->addProductAttr($attr_data);
        }
    }
    //判断是否上传图集
    if(isset($_FILES['photos']) && $_FILES['photos']['size'][0] >0) {

        //上传图片
        $photos =[];
        $rootPath = app_path."upload/";
        $path =  $_POST['theme'].'/photos/'.date('y-m-d',time()).'/';
        $uploadHandler = new \Sirius\Upload\Handler($rootPath.$path);
        $result = $uploadHandler->process($_FILES['photos']);

        foreach ($result as $key=>$value)
        {
            if($value->name)
            {
                $photos[$key]['thumb']=  '/upload/'.$path.$value->name;
                $photos[$key]['add_time'] = date('Y-m-d H:i:s',time());
                $photos[$key]['product_id'] = $product_id;
            }

        }
        $result->confirm();
        //插入图集
         if(count($photos) >0)
         {
            $db->insert('product_thumb',$photos);
         }
    }

    //是否有套餐
    if($_POST['combo'])
    {
        foreach ($_POST['combo'] as $value)
        {
             $combo['title'] =    $value['name'] ;
             $combo['price'] =    money_int($value['price']) ;
             $combo['product_id'] =  $product_id;

             //插入套餐
             $combo_id =  $db->insert('combo',$combo);
             foreach ($value['num'] as $k=> $item)
             {
                 $comboGoods['num'] =  $item;
                 $comboGoods['erp_id']= $value['erp_id'][$k];
                 $comboGoods['combo_id'] =   $combo_id;
                 $comboGoods['title'] =   $value['title'][$k];
                 $db->insert('combo_goods',$comboGoods);
             }

        }
    }
    $log->write('product','保存产品==》'.print_r($data,1));
    //die(print_r($_POST));
    header('location:product.php?') ;

}
elseif($_GET['act'] && $_GET['act']=='add')
{
    $data['admin'] =  $_SESSION['admin'];
    $register->get('view')->display('product.twig',$data);
}
elseif($_POST['act'] && $_POST['act']=='delete')
{

    $product_attr_id = $_POST['product_attr_id'];
    $product = new \admin\helper\product($register);
    $ret = $product->deleteAttr($product_attr_id) ;
    echo json_encode( $ret);

}
elseif($_POST['act'] && $_POST['act'] =='del')
{
    $product_id = $_POST['product_id'];
    $product = new \admin\helper\product($register);
    $data['is_del'] = $_POST['is_del'];
    $ret = $product->delProduct($product_id,$data) ;
    echo json_encode($ret) ;
}
elseif($_POST['act'] && $_POST['act']=='deleteCombo'){
    $combo_id = $_POST['combo_id'];
    $product = new \admin\helper\combo($register);
    $ret = $product->delCombo($combo_id) ;
    echo json_encode($ret) ;
}
elseif($_GET['act'] && $_GET['act'] == 'downloadexcel')
{
    $data = $db->select('product','*',["ORDER"=>['product_id'=>"DESC"],'is_del'=>0]);
    Header( "Content-type:   application/octet-stream ");
    Header( "Accept-Ranges:   bytes ");
    Header( "Content-type:application/vnd.ms-excel ");
    Header( "Content-Disposition:attachment;filename=产品域名.xlsx ");

    echo "<table  border='1'>";
    //var_dump($data);die;
    //domain,identity_tag,title,erp_number,fb_px,
    echo "<tr align='center'>";
    echo " <td width='200'>产品名称</td>";
    echo " <td width='200'>域名</td>";
    echo " <td width='200'>二级目录</td>";
    echo " <td width='200'>ERP产品id</td>";
    echo " <td width='200'>FB通用像素id</td>";
    echo " <td width='200'>广告手id</td>";
    echo " <td width='200'>价格</td>";
    echo " <td width='200'>前台显示模板</td>";
    echo "</tr>";
    foreach($data as $k =>$v){
        echo "<tr align='center'>";
        echo "<td width='200'>". $v['title'] ."</td>";
        echo "<td width='200'>". $v['domain'] ."</td>";
        echo "<td width='200'>". $v['identity_tag'] ."</td>";
        echo "<td width='200'>". $v['erp_number'] ."</td>";
        echo "<td width='200'>". $v['fb_px'] ."</td>";
        echo "<td width='200'>". $v['ad_member_id'] ."</td>";
        echo "<td width='200'>". $v['price']/100 ."</td>";
        echo "<td width='200'>". $v['theme'] ."</td>";
        echo "</tr>";
    }
    echo "</table>";

    //var_dump($data);
    //echo 111;
    exit;
}
elseif($_POST['act'] && $_POST['act']=='check')
{
//    $domain = $_POST['domain'];
    //允许重复域名
//    $product_id = $_POST['product_id'];
//    $product = new \admin\helper\product($register);
//    $ret = $product->productCheck($domain,$product_id);
//    if(!$ret['ret'])
//    {
//        echo     json_encode($ret);
//        exit;
//    }

    //获取域名信息

//     $uri = 'http://www.hepxi123.com/Domain/Api/get_all?name='.$domain;
//     $ret= file_get_contents($uri);
//     $ret = json_decode($ret,true);
//     if(!$ret['status'])
//     {

//         echo    json_encode(['ret'=>0,'msg'=>"没找到该域名信息，请确认。"]);
//         exit;
//     }

//    echo json_encode(['ret'=>1,'data'=>$ret['data']]);
echo json_encode(['ret'=>1,'msg'=>'OK']);

}
elseif($_POST['act'] && $_POST['act'] == 'getErpProduct'){

//     $product_id = $_POST['product_id'];
//     $erp_number = $_POST['number'];
//     $product = new \admin\helper\product($register);
// //    $ret = $product->productNumberCheck($erp_number,$product_id);
// //    if(!$ret['ret'])
// //    {
// //        echo     json_encode($ret);
// //        exit;
// //    }
//     $uri = 'http://www.hepxi123.com/Product/Api/get?id='.$erp_number;
//     $ret= file_get_contents($uri);
//     $ret = json_decode($ret,true);

//     if(!$ret['status'])
//     {
//         echo    json_encode(['ret'=>0,'msg'=>"没找到该差产品信息，请确认。"]);
//         exit;
//     }

//     echo json_encode(['ret'=>1,'data'=>$ret['product']]);
echo json_encode(['ret'=>1,'data'=>'ok']);

}
elseif($_POST['act'] && $_POST['act'] == 'deletePhotos')
{
        $thumb_id = $_POST['thumb_id'];
        $map = ['thumb_id'=>$thumb_id];
        $ret = $db->delete('product_thumb',$map);

        if($ret)
        {
            echo json_encode(['ret'=>1,'msg'=>"OK"]);
             exit;
        }

        echo json_encode(['ret'=>0,'msg'=>"删除失败。"]);
}

else{
    $filter =[];
    $info =[]  ;
    if($_GET['title'])
    {
        $filter['title[~]'] = ["%".$_GET['title'].'%'];
        $info['title'] =   $_GET['title'];
    }
    if($_GET['domain'])
    {
        $filter['domain[~]'] =  ["%".$_GET['domain'].'%'];
        $info['domain'] =   $_GET['domain'];
    }
    if($_GET['theme'])
    {
        $filter['theme[~]'] =  ["%".$_GET['theme'].'%'];
        $info['theme'] =   $_GET['theme'];
    }

    $product = new \admin\helper\product($register);
    $data =  $product->getAllProduct($filter);
    $data['admin'] =  $_SESSION['admin'];
    $data['filter'] = $info ;
    $register->get('view')->display('product_list.twig',$data);

}