<?php
//data/message/add_message.php
require_once("../init.php");
@$uname=$_REQUEST["uname"];
@$email=$_REQUEST["email"];
@$phone=$_REQUEST["phone"];
@$address=$_REQUEST["address"];
@$message=$_REQUEST["message"];
@$updateTime=$_REQUEST["updateTime"];

$reg='/^1[3|4|5|8][0-9]\d{4,8}$/';
$rs=preg_match($reg,$phone);
if(!$rs){
  die('{"code":-1,"msg":"您输入的手机号格式不正确!后台"}');
}
$reg='/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/';
$rs=preg_match($reg,$email);
if(!$rs){
  die('{"code":-1,"msg":"您输入的邮箱格式不正确!后台提示"}');
}


$sql="INSERT INTO qz_question(mid,uname,email,phone,address,updateTime,cot) VALUES";
$sql.="(null,'$uname','$email',$phone,'$address',$updateTime,'$message');";
$result = mysqli_query($conn,$sql);
if(mysqli_error($conn)){
   echo mysqli_error($conn);
}
$count = mysqli_affected_rows($conn);
if($count>0){
  echo '{"code":1,"msg":"添加成功"}';
}else{
  echo '{"code":-1,"msg":"添加失败"}';
}


?>
