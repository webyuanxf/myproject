<?php
    require_once("../init.php");

    $sql="SELECT cid,title,(SELECT md FROM qz_case_img where qz_case.cid=qz_case_img.cid) as md FROM qz_case";
    $result=mysqli_query($conn,$sql);
    if(mysqli_error($conn)){
       echo mysqli_error($conn);
    };
    $rows=mysqli_fetch_all($result,1);
    echo json_encode($rows);
?>
