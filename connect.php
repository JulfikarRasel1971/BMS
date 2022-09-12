<?php

$server = "localhost";
$userName = "root";
$password = "";
$dbName = "bms";

$con = mysqli_connect($server,$userName,$password,$dbName);

if(mysqli_connect_errno())
{
    echo "failed to connect to mysql: ".mysqli_connect_error();
}

?>