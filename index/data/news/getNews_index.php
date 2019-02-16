<?php
//data/getProducts_index.php
require_once("../init.php");

@$tid=$_REQUEST["tid"];
$output=[
    "product"=>[],
    "top"=>[],
    "tag"=>[],
    "type"=>[]
];
if(!$tid==null){//点击栏目切换时
    $sql="SELECT nid,tid,title,updateTime,(SELECT sm FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid ) as sm FROM qz_news WHERE tid=$tid";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
       echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["product"]=$rows;

    $sql="SELECT nid,tid,title,author,updateTime,click,isTop,content,(SELECT md FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid ) as md FROM qz_news WHERE tid=$tid AND isTop=1";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
           echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_assoc($result);
    $output["top"]=$rows;

    $sql="SELECT nid,tag FROM qz_news_tag WHERE nid=(SELECT nid FROM qz_news WHERE tid=$tid AND isTop=1)";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
         echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["tag"]=$rows;
}else{//首次加载时
    $sql="SELECT tid,name FROM qz_news_class";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
       echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["type"]=$rows;

    $sql="SELECT nid,tid,title,updateTime,(SELECT sm FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid ) as sm FROM qz_news ";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
           echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["product"]=$rows;

    $sql="SELECT nid,tid,title,author,updateTime,click,isTop,content,(SELECT md FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid ) as md FROM qz_news WHERE isTop=1 LIMIT 1";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
           echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_assoc($result                                                                                                                                                                                                                                                                                                                                         );
    $output["top"]=$rows;

    $sql="SELECT nid,tag FROM qz_news_tag WHERE nid=(SELECT nid FROM qz_news WHERE isTop=1 LIMIT 1)";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
        echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    $output["tag"]=$rows;
};
echo json_encode($output);
?>
