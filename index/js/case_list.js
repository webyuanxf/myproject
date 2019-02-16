/**
 * Created by renzh on 2018/6/1.
 */
$.ajax({
    type:"GET",
    url:"data/project/getProjects_index.php",
    dataType:"json",
    success:function(data){
        var html="";
        for(var item of data){
            var {cid,title,md}=item;
            html+=`<li><a href="case_details.html?cid=${cid}"><img src="${md}" alt="${title}">
            <span class="txt">${title}</span><span class="fa fa-search"></span></a></li>`;
        }
        var $ul=$("#case_list>.container >ul");
        $ul.html(html);

    },
    error:function(){
        alert("网络故障请检查")
    }
});
