<?php
//connect db 
require_once('config.php');

$connect = new mysqli(HOST, USER, PASS, DB);
if($connect->connect_error){
    exit("connection_error, dont be sorry pal ;)");
}

$connect->set_charset("utf8");

$result = $connect->prepare("SELECT * FROM client_cars");
$result->execute();
$result = $result->get_result();

foreach ($result as $row) {
    echo "<div class='data_table_row'>"."<img class='img_list' src='img/amogus.png' alt=''>"."<p class='p_id'>".$row['client_car_id']."</p>"."<p>".$row['car_id']."</p>"."<p>".$row['c_id']."</p>"."<p>".$row['delivery']."<p>".$row['payment_method']."</p>"."<p class='data_line_cross'>X</p>"."</div>";
}