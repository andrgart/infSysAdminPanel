<?php
require_once('config.php');

$connect = new mysqli(HOST, USER, PASS, DB);
if($connect->connect_error){
    exit("connection_error, dont be sorry pal ;)");
}

$connect->set_charset("utf8");

$car_country = $_GET['cc'];
$car_brand = $_GET['cb'];
$car_model = $_GET['cm'];
$availability = $_GET['av'];
$price = $_GET['p'];

$result = mysqli_query($connect, "INSERT INTO `cars` (`car_id`, `car_country`, `car_brand`, `car_model`, `availability`, `price`) VALUES (NULL, '$car_country', '$car_brand', '$car_model', '$availability', '$price');");

$result = $connect->prepare("SELECT * FROM cars");
$result->execute();
$result = $result->get_result();

foreach ($result as $row) {
    echo "<div class='data_table_row'>"."<img class='img_list' src='img/amogus.png' alt=''>"."<p class='p_id'>".$row['car_id']."</p>"."<p>".$row['car_country']."</p>"."<p>".$row['car_brand']."</p>"."<p>".$row['car_model']."<p>".$row['availability']."</p>"."<p>".$row['price']."</p>"."<p class='data_line_cross'>X</p>"."</div>";
}
