<?php
//data/getProducts_index.php
require_once("../init.php");

@$tid=$_REQUEST["tid"];
$output=[
    "type"=>[],
    "product"=>[]

];

if(!$tid==0){
    $sql="SELECT pid,tid,title,(SELECT hpic FROM qz_product_img WHERE qz_product.pid=qz_product_img.pid LIMIT 1)";
    $sql .=" as hpic FROM qz_product WHERE tid=$tid";
    $result=mysqli_query($conn,$sql);
    $output["product"][0]=mysqli_fetch_all($result,1);
    $sql="SELECT tid,name,txt FROM qz_product_type WHERE tid=$tid";
    $result=mysqli_query($conn,$sql);
    $output["type"]=mysqli_fetch_all($result,1);
}else{
    $sql="SELECT tid,name,txt FROM qz_product_type";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
        echo mysqli_error($conn);
    }
    $rows=mysqli_fetch_all($result,1);
    $output["type"]=$rows;
    for($i=0;$i<count($rows);$i++){
        $tid=$rows[$i]["tid"];
        $sql="SELECT pid,tid,title,(SELECT hpic FROM qz_product_img WHERE qz_product.pid=qz_product_img.pid LIMIT 1)";
        $sql .=" as hpic FROM qz_product WHERE tid=$tid";
        $result=mysqli_query($conn,$sql);
        $output["product"][$i]=mysqli_fetch_all($result,1);
    }
}
echo json_encode($output);


?>