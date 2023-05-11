<?php
require_once('config.php');

$connect = new mysqli(HOST, USER, PASS, DB);
if($connect->connect_error){
    exit("connection_error, dont be sorry pal ;)");
}

$connect->set_charset("utf8");

$car_id = htmlspecialchars(trim($_POST['car_id']));
$c_id = htmlspecialchars(trim($_POST['c_id']));
$delivery = htmlspecialchars(trim($_POST['delivery']));
$payment_method = htmlspecialchars(trim($_POST['payment_method']));


$result = mysqli_query($connect, "INSERT INTO `client_cars` (`client_car_id`, `car_id`, `c_id`, `delivery`, `payment_method`) VALUES (NULL, '$car_id', '$c_id', '$delivery', '$payment_method');");

header("Location:../Inf_sys_project/");