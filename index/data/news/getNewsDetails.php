<?php
require("../init.php");
$output=[
    "product"=>[],
    "next"=>[],
    "prev"=>[],
    "recommend"=>[]
];


@$tid=$_REQUEST["tid"];
@$nid=$_REQUEST["nid"];

if($tid!==null&&$nid!==null){


    $sql="SELECT title,author,updateTime,click,content FROM qz_news WHERE nid=$nid ";
    $result=mysqli_query($conn,$sql);
     if(mysqli_error($conn)){
        echo mysqli_error($conn);
     };
    $rows=mysqli_fetch_assoc($result);
    $output["product"]=$rows;

    $sql="SELECT nid,tid,title FROM qz_news where nid = (SELECT nid FROM qz_news where nid < $nid AND tid=$tid order by nid desc limit 1)";
    $result=mysqli_query($conn,$sql);
     if(mysqli_error($conn)){
        echo mysqli_error($conn);
     };
    $rows=mysqli_fetch_assoc($result);
    $output["prev"]=$rows;

    $sql="SELECT nid,tid,title FROM qz_news where nid = (SELECT nid FROM qz_news where nid > $nid AND tid=$tid order by nid asc limit 1)";
        $result=mysqli_query($conn,$sql);
         if(mysqli_error($conn)){
            echo mysqli_error($conn);
         };
        $rows=mysqli_fetch_assoc($result);
        $output["next"]=$rows;
}
$sql="SELECT nid,tid,title,updateTime,(SELECT sm FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid ) as sm FROM qz_news WHERE isRecommend=1 ORDER BY rand() LIMIT 5";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
$output["recommend"]=$rows;

echo json_encode($output);


?>
