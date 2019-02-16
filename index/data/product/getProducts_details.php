<?php
//data/getProducts_index.php
require_once("../init.php");

@$pid=$_REQUEST["pid"];
$output=[
	"product"=>[],
	"recommend"=>[],
	"pics"=>[],
	"desc"=>[]

];

if($pid!=null){
    $sql="SELECT pid,tid,title,updateTime,click,spec FROM qz_product where pid=$pid";
    $result=mysqli_query($conn,$sql);
    $output["product"]=mysqli_fetch_assoc($result);
    $sql="SELECT lg,sm FROM qz_product_img WHERE pid=$pid";
    $result=mysqli_query($conn,$sql);
    $output["pics"]=mysqli_fetch_all($result,1);
    $sql="SELECT detail FROM qz_product_detail WHERE pid=$pid";
    $result=mysqli_query($conn,$sql);
    $output["desc"]=mysqli_fetch_all($result,1);
}
$sql="SELECT pid,tid,title,(SELECT hpic FROM qz_product_img WHERE qz_product.pid=qz_product_img.pid LIMIT 1)";
$sql.=" AS hpic FROM qz_product WHERE isRecommend=1 LIMIT 6";
$result=mysqli_query($conn,$sql);
$output["recommend"]=mysqli_fetch_all($result,1);
echo json_encode($output);


?>