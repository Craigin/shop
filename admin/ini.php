<?php
session_start();
define('app_path',dirname(dirname(__FILE__)).'/');
define('environment','office');
require_once app_path.'vendor/autoload.php';
$config=require_once app_path.'config/base.php';
include_once 'helper/function.php';
error_reporting(E_ERROR | E_WARNING | E_PARSE); 
$register = new \lib\register();
//把类搞成全局
$view = new \lib\view('template',app_path);
$register->set('view',$view);

$db = new \lib\db();
$register->set('db',$db);



