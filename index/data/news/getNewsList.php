<?php
require("../init.php");
$output=[
    "pageNum"=>0,//当前页数
    "pageTotal"=>0,//总页数=ceil(count/pageSize)
    "count"=>0,//总数
    "pageSize"=>3,//一页显示个数
    "product"=>[],
    "tags"=>[],
    "recommend"=>[]
];


@$tid=$_REQUEST["tid"];
@$pageNum=$_REQUEST["pageNum"];
$tid=$tid==null?1:$tid;
$pageNum=$pageNum==null?0:$pageNum-1;
if($tid!==null&&$pageNum!==null){
    $sql="SELECT nid FROM qz_news WHERE tid=$tid ";
    $result=mysqli_query($conn,$sql);
    $output["count"]=count(mysqli_fetch_all($result,1));
    $output["pageTotal"]=ceil($output["count"]/$output["pageSize"]);

    $sql="SELECT nid,tid,title,author,updateTime,click,content,(SELECT md FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid) ";
    $sql.=" as md FROM qz_news WHERE tid=$tid LIMIT ".$pageNum*$output["pageSize"].",".$output["pageSize"];
    $result=mysqli_query($conn,$sql);
     if(mysqli_error($conn)){
        echo mysqli_error($conn);
     };
    $rows=mysqli_fetch_all($result,1);
    $output["product"]=$rows;
    $output["pageNum"]=$pageNum+1;

    $sql="SELECT nid,tid,tag FROM qz_news_tag WHERE tid=$tid";

    for($i=0;$i<count($output["product"]);$i++){
         $sql="SELECT nid,tid,tag FROM qz_news_tag WHERE nid=".$output["product"][$i]["nid"];
         $result=mysqli_query($conn,$sql);
         $rows=mysqli_fetch_all($result,1);
         $output["tags"][$output["product"][$i]["nid"]]=$rows;
    }
}
$sql="SELECT nid,tid,title,updateTime,(SELECT sm FROM qz_news_img WHERE qz_news.nid=qz_news_img.nid ) as sm FROM qz_news WHERE isRecommend=1 ORDER BY rand() LIMIT 5";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
$output["recommend"]=$rows;

echo json_encode($output);


?>
