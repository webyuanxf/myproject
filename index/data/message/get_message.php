<?php
//data/message/get_message.php
require_once("../init.php");

$sql="SELECT uname,updateTime,cot,ansTime,ans FROM qz_question LEFT OUTER JOIN qz_answer ON qz_question.mid=qz_answer.mid";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
echo json_encode($rows);




?>
