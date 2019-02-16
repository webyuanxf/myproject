<?php
//data/getProducts_index.php
require_once("../init.php");

@$tid=$_REQUEST["tid"];
$output=[
    "product"=>[],
    "type"=>[]
];
if(!$tid==null){
    $sql="SELECT pid,tid,title,(SELECT hpic FROM qz_product_img WHERE qz_product.pid=qz_product_img.pid LIMIT 1) as hpic FROM qz_product WHERE tid=$tid";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
       echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["product"]=$rows;
}else{
    $sql="SELECT tid,name FROM qz_product_type";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
       echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["type"]=$rows;

    $sql="SELECT pid,tid,title,(SELECT hpic FROM qz_product_img WHERE qz_product.pid=qz_product_img.pid LIMIT 1) as hpic FROM qz_product";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
           echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["product"]=$rows;

}
echo json_encode($output);



?>