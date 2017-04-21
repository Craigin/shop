<?php
session_start();
define('app_path',dirname(dirname(__FILE__)).'/');
define('environment','office');
require_once app_path.'vendor/autoload.php';
include_once app_path.'admin/helper/function.php' ;
error_reporting(E_ERROR | E_WARNING | E_PARSE);
ini_set('date.timezone','Asia/Shanghai');
date_default_timezone_set("Asia/Shanghai");
$server_name = $_SERVER['HTTP_HOST'];

if($_SERVER['SCRIPT_NAME'] == '/index.php'){
    $identity_tag = trim(str_replace($_SERVER['SCRIPT_NAME'], '', $_SERVER['REQUEST_URI']), '/');
}

if(!isset($identity_tag) && isset($_SESSION['identity_tag'])){
    $identity_tag = $_SESSION['identity_tag'];
}

$register = new \lib\register();

$db = new \lib\db();
$register->set('db',$db);

$product = new \lib\product($register,$server_name, $identity_tag);
$ret = $product->getProductTheme($_REQUEST['path']);

//把类搞成全局
$view = new \lib\view('theme/'.$ret['theme'].'/',app_path);
$register->set('view',$view);

$lang =  strtolower($ret['lang']);
$lang = new \lib\lang($lang,$ret['theme']);
$register->set('lang',$lang);










