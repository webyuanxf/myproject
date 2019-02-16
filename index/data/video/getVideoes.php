<?php
//data/video/getVideos.php
require_once("../init.php");

@$vid=$_REQUEST["vid"];
if($vid==null){
    $sql="SELECT vid,title,src,img,updateTime,sources,lang,type,spec FROM qz_video";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
        echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    echo json_encode($rows);
}else{
    $sql="SELECT vid,title,src,img,updateTime,sources,lang,type,spec FROM qz_video WHERE vid=$vid";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
       echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    echo json_encode($rows);
}
?>