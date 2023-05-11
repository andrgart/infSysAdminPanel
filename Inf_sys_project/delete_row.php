<?php
require_once('config.php');

$connect = new mysqli(HOST, USER, PASS, DB);
if($connect->connect_error){
    exit("connection_error, dont be sorry pal ;)");
}

$connect->set_charset("utf8");

$row_id = $_GET['row_id'];
$bd_name = $_GET['bd_name'];


mysqli_query($connect, "SET FOREIGN_KEY_CHECKS=0");
if($bd_name == "client"){
    $result = mysqli_query($connect, "DELETE FROM $bd_name WHERE $bd_name.`c_id` = $row_id");
}
if($bd_name == "cars"){
    $result = mysqli_query($connect, "DELETE FROM $bd_name WHERE $bd_name.`car_id` = $row_id");
}
if($bd_name == "client_cars"){
    $result = mysqli_query($connect, "DELETE FROM $bd_name WHERE $bd_name.`client_car_id` = $row_id");
}
mysqli_query($connect, "SET FOREIGN_KEY_CHECKS=1");