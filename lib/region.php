<?php
namespace lib;

class region {

    public $register;

    public function __construct($register)
    {
        $this->register =  $register;
    }

    public function getAllRegion()
    {
        $map = ['parent_id'=>0] ;
        $ret = $this->register->get("db")->select('region','*',$map);

         return $ret;
    }

    public function getSonRegion($parent_id)
    {
        $map = ['parent_id'=>$parent_id] ;
        $ret = $this->register->get("db")->select('region','*',$map);
        return $ret;
    }

    public function getRegion($region_code)
    {
        $map = ['region_code'=>$region_code] ;
        $ret = $this->register->get("db")->get('region','*',$map);
        return $ret;
    }

    public function getOrderRegion($region_id =[])
    {

        $map = ['region_id'=>$region_id];
        $ret = $this->register->get("db")->select('region',['region_name','region_id','region_code'],$map);
        $ret = array_column($ret,null,'region_id');
        return $ret;
    }
}