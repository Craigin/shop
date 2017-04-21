<?php
return [
    'database_type' => 'mysql',
    'database_name' => 'stoshop',
    'server' => 'localhost',
    'username' => 'root',
    'password' => 'PASSWORD',
    'charset' => 'utf8',
    // [optional]
    'port' => 3306,
    // [optional] Table prefix
    'prefix' => '',
    'option' => [
        PDO::ATTR_CASE => PDO::CASE_NATURAL
    ],
] ;