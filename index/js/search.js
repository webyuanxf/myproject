/**
 * Created by renzh on 2018/6/1.
 */
$(function () {
    var $search=$("#search>.container>.head>.fa");
    var $searchBox=$("#search>.container>.head>input");
    var $select=$("#search>.container>.head>select");
    var $ul=$("#search>.container>.body>ul");
    var href = location.href;//获取地址栏
    var params = getParam(href, ["kw","pno","t"]);//获取地址栏中参数
    if(params.pno===undefined){
        params.pno=1;
    }
    if(params.t===undefined){
        params.t=1;
    }

    $searchBox.val(params.kw);
    $select.val(params.t);
    $search.click(function(e){
        e.preventDefault();
       var kw=$searchBox.val();
       var t=$select.val();
       if(t==0){
           t=1;
       }
       location.href="search.html?kw="+kw+"&t="+t;
    });
    $searchBox.keyup(function(e){
        if(e.keyCode==13){
            $search.click();
        }
    });
    loadResult(params);
    function loadResult(params) {
        $.ajax({
            type: "GET",
            url: "data/search/search.php",
            dataType: "json",
            data: params,
            success: function (data) {
                console.log(data);
                var {count,pageSize,pageTotal,pno,res}=data;
                var html="";
                var reg=new RegExp(params.kw,"gi");
                if(params.t==1){
                    for(var item of res){
                        var {title,pid,tid,spec}=item;
                        title=title.replace(reg,"<b class='k'>"+params.kw+"</b>");
                        spec=spec.replace(reg,"<b class='k'>"+params.kw+"</b>");
                        html+=`<li>
                                <div> <span class="cls">所属:<a href="product_list.html">产品</a></span></div>
                                <div><a href="product_details.html?tid=${tid}&pid=${pid}" class="title">${title}</a></div>
                                <div><a href="product_details.html?tid=${tid}&pid=${pid}" class="loc">http://127.0.0.1/qz/index/product_details.html?tid=${tid}&pid=${pid}</a></div>
                                <div class="cot">${spec}...</div>
                            </li>`
                    }
                }else if(params.t==2){
                    for(var item of res){
                        var {title,cid}=item;

                        title=title.replace(reg,"<b class='k'>"+params.kw+"</b>");
                        html+=`<li>
                            <div> <span class="cls">所属:<a href="case_list.html">案例</a></span></div>
                            <div><a href="case_details.html?cid=${cid}" class="title">${title}</a></div>
                            <div><a href="case_details.html?cid=${cid}" class="loc">http://127.0.0.1/qz/index/case_details.html?cid=${cid}</a></div>
                            <div class="cot"></div>
                            </li>`
                    }
                }else if(params.t==3){
                    for(var item of res){
                        var {title,nid,tid,content}=item;
                        title=title.replace(reg,"<b class='k'>"+params.kw+"</b>");
                        content=content.replace(reg,"<b class='k'>"+params.kw+"</b>");
                        html+=`<li>
                                <div> <span class="cls">所属:<a href="news_list.html">新闻</a></span></div>
                                <div><a href="news_details.html?tid=${tid}&nid=${nid}" class="title">${title}</a></div>
                                <div><a href="news_details.html?tid=${tid}&nid=${nid}" class="loc">http://127.0.0.1/qz/index/news_details.html?tid=${tid}&nid=${nid}</a></div>
                                <div class="cot">${content}...</div>
                            </li>`
                    }
                }
                $ul.html(html);




                var select=5;//最多可显示5个数字按钮来进行页面切换
                var html = `<a href="search.html?kw=${params.kw}&pno=1&t=${params.t}" class="first ">首页</a><a href="search.html?kw=${params.kw}&pno=${pno-1}&t=${params.t}" class="prev">上一页</a>`;
                if (pageTotal < select) {//页面总数小于select时正常显示
                    for (var i = 1; i <= pageTotal; i++) {
                        html += `<a href="search.html?kw=${params.kw}&pno=${i}&t=${params.t}" data-id=${i} class="pageNum" >${i}</a>`;
                    }
                } else {//页面总数大于select时
                    /*按钮布局总共有3种情况*/
                    /*1.当前页数小于4时*/
                    /*2.当前页数大于 最大页数减去3时*/
                    /*3.当前页数 等于上2种范围之外时*/
                    /*3-1 表示当前页数的按钮居中，并左右各有2个按钮*/
                    var i = 0, max = 0;
                    if (pno >= 4 && pno <= pageTotal - 3) {//第三种情况
                        i = pno - 2;
                        max = pno + 2;

                    } else if (pno < 4) {//第一种情况
                        i = 1;
                        max = 5;
                    } else if (pno > pageTotal - 3) {//第二种情况
                        i = pageTotal - 4;
                        max = pageTotal;
                    }
                    for (var n = i; n <= max; n++) {
                        html += `<a href="search.html?kw=${params.kw}&pno=${n}&t=${params.t}" data-id=${n} class="pageNum">${n}</a>`;
                    }
                }
                html += `<a href="search.html?kw=${params.kw}&pno=${pno + 1}&t=${params.t}" class="next">下一页</a><a href="search.html?kw=${params.kw}&pno=${pageTotal}&t=${params.t}" class="last" ">最后一页</a>`;
                var $pages = $(".pages");
                $pages.html(html);

                if (pno== 1) {
                    $pages.children(".first,.prev").addClass("disabled");
                    $pages.children(".last,.next").removeClass("disabled");
                } else if (pno == pageTotal) {
                    $pages.children(".first,.prev").removeClass("disabled");
                    $pages.children(".last,.next").addClass("disabled");
                } else {
                    $pages.children(":not('.pageNum')").removeClass("disabled");
                }
                $pages.children("[data-id=" + pno + "]").addClass("current").siblings().removeClass("current");
            },
            error: function () {
                alert("网络故障请检查");
            }
        });
    }

});
