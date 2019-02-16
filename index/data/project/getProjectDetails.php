<?php
require("../init.php");
$output=[
    "project"=>[],
    "next"=>[],
    "prev"=>[],
    "recommend"=>[]
];


@$cid=$_REQUEST["cid"];

if($cid!==null){
    $sql="SELECT title,updateTime,click,content FROM qz_case WHERE cid=$cid ";
    $result=mysqli_query($conn,$sql);
     if(mysqli_error($conn)){
        echo mysqli_error($conn);
     };
    $rows=mysqli_fetch_assoc($result);
    $output["project"]=$rows;

    $sql="SELECT cid,title FROM qz_case where cid = (SELECT cid FROM qz_case where cid < $cid  order by cid desc limit 1)";
    $result=mysqli_query($conn,$sql);
     if(mysqli_error($conn)){
        echo mysqli_error($conn);
     };
    $rows=mysqli_fetch_assoc($result);
    $output["prev"]=$rows;

    $sql="SELECT cid,title FROM qz_case where cid = (SELECT cid FROM qz_case where cid > $cid  order by cid asc limit 1)";
        $result=mysqli_query($conn,$sql);
         if(mysqli_error($conn)){
            echo mysqli_error($conn);
         };
        $rows=mysqli_fetch_assoc($result);
        $output["next"]=$rows;
}
$sql="SELECT cid,title,updateTime,(SELECT sm FROM qz_case_img WHERE qz_case.cid=qz_case_img.cid ) as sm FROM qz_case WHERE isRecommend=1 ORDER BY rand() LIMIT 5";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
$output["recommend"]=$rows;

echo json_encode($output);


?>
