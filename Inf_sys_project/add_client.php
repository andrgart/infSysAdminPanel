<?php
require_once('config.php');

$connect = new mysqli(HOST, USER, PASS, DB);
if($connect->connect_error){
    exit("connection_error, dont be sorry pal ;)");
}

$connect->set_charset("utf8");

$fname = htmlspecialchars(trim($_POST['fname']));
$sname = htmlspecialchars(trim($_POST['sname']));
$mname = htmlspecialchars(trim($_POST['mname']));
$pass_serial = htmlspecialchars(trim($_POST['pass_serial']));
$pass_number = htmlspecialchars(trim($_POST['pass_number']));
$addres = htmlspecialchars(trim($_POST['addres']));
$phone = htmlspecialchars(trim($_POST['phone']));

$result = mysqli_query($connect, "INSERT INTO `client` (`c_id`, `c_fname`, `c_sname`, `c_mname`, `passport_serial`, `passport_number`, `address`, `phone`) VALUES (NULL, '$fname', '$sname', '$mname', '$pass_serial', '$pass_number', '$addres', '$phone')");

header("Location:../Inf_sys_project/");
