<?php
require("../init.php");
$output=[
    "pno"=>0,//当前页数
    "pageTotal"=>0,//总页数=ceil(count/pageSize)
    "count"=>0,//总数
    "pageSize"=>1,//一页显示个数
    "res"=>[]
];

@$type=$_REQUEST["t"];
@$kw=$_REQUEST["kw"];
@$pno=$_REQUEST["pno"]-1;


if($kw!==null&&$pno!==null){
    $kws=explode(" ",$kw);
	for($i=0;$i<count($kws);$i++){
	    $kws[$i]=" title like '%".$kws[$i]."%' ";
	}
	$where=implode(" and ",$kws);
	if($type==1){//产品类型
	    $sql="SELECT pid FROM qz_product  WHERE $where";
	    $result=mysqli_query($conn,$sql);
        $output["count"]=count(mysqli_fetch_all($result,1));
        $output["pageTotal"]=ceil($output["count"]/$output["pageSize"]);

	    $sql="SELECT title,pid,tid,SUBSTRING(qz_product.spec, 1, 100) AS spec FROM qz_product  WHERE $where";
	    $sql.=" LIMIT ".$pno*$output["pageSize"].",".$output["pageSize"];
	}else if($type==2){//案例类型
	     $sql="SELECT cid FROM qz_case  WHERE $where";
	     $result=mysqli_query($conn,$sql);
         $output["count"]=count(mysqli_fetch_all($result,1));
         $output["pageTotal"]=ceil($output["count"]/$output["pageSize"]);

	     $sql="SELECT title,cid FROM qz_case  WHERE $where";
	     $sql.=" LIMIT ".$pno*$output["pageSize"].",".$output["pageSize"];
	}else if($type==3){//新闻类型
        $sql="SELECT nid FROM qz_news WHERE $where ";
        $result=mysqli_query($conn,$sql);
        $output["count"]=count(mysqli_fetch_all($result,1));
        $output["pageTotal"]=ceil($output["count"]/$output["pageSize"]);

        $sql="SELECT title,nid,tid,SUBSTRING(qz_news.content, 1, 100) AS content FROM qz_news  WHERE $where";
        $sql.=" LIMIT ".$pno*$output["pageSize"].",".$output["pageSize"];
	}
	$result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,1);
    $output["pno"]=$pno+1;
    $output["res"]=$rows;
    echo json_encode($output);
}
?>
