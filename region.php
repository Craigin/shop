<?php
require_once 'lib/ini.php';
if($_POST['region_id'])
{
    $id = $_POST['region_id'];

    $region =  new \lib\region($register);
    $region  =$region->getSonRegion($id);

    echo json_encode( $region);

}