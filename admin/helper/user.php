<?php
namespace admin\helper;

class user  extends common {

    public function getAllUser()
    {

        $data=  $this->db->pageSelect('user','*',['ORDER'=>['add_time'=>"DESC",'uid'=>"DESC"]],20);

        return $data;
    }
    public function getOneUser($uid)
    {
        $ret = $this->db->get('user',"*",['uid'=>$uid]);

        return $ret;
    }
    public function saveUser($uid ,$data=[])
    {
        $ret = $this->checkUser($data['email'],$uid);
        if(!$ret['ret'])
        {
            return  $ret;
        }

        if($uid)
        {
            $this->db->update('user',$data,['uid'=>$uid]);
            return  ['ret'=>1,'msg'=>'更新成功！'] ;
        }
        else{
            $lastId =   $this->db->insert('user',$data);
            return ['ret'=>$lastId,'msg'=>'增加成功！'] ;
        }
    }

    public function checkUser($email,$uid)
    {
         $map =["AND"=>["email"=>$email,"is_del"=>0,"uid[!]"=>$uid]];
         $ret = $this->db->get('user','*',$map);
         if($ret)
         {
              return ['ret'=>0,'msg'=>'FAIL：邮箱重复'];
         }
        return ['ret'=>1,'msg'=>'OK'];
    }

    public  function deleteUser($uid,$data)
    {
        $map = ['uid'=>$uid];
        $product = $this->db->get('user',['email'],$map);
        if(!$data['is_del'])
        {
            $ret = $this->checkUser($product['email'],$uid);
            if(!$ret['ret'])
            {
                return ['ret'=>0,'msg'=>"恢复失败。=》".$ret['msg']];
            }
        }

        $ret = $this->db->update('user',$data,$map);
        if(!$ret)
        {
            return ['ret'=>$ret,'msg'=>"恢复失败。=》数据库更改失败"];
        }

        return ['ret'=>1,'msg'=>"OK"];
        return $ret;
    }


}