/**
 * Created by web-01 on 2018/5/30.
 */
$(function () {
    var href = location.href;//获取地址栏
    var params = getParam(href, ["tid", "pageNum"]);//获取地址栏中参数
    console.log(params.tid)
    if(params.tid===undefined){params.tid=1}
    $(".top-nav li").eq(params.tid - 1).addClass("active").siblings().removeClass("active");//定位当前栏目
    loadNews(params);
    function loadNews(params) {
        $.ajax({
            type: "GET",
            url: "data/news/getNewsList.php",
            dataType: "json",
            data: params,
            success: function (data) {
                console.log(data);
                var {pageNum,pageTotal,product,tags,recommend}=data;
                var html = "";
                for (var item of product) {
                    var {nid,tid,md,title,author,updateTime,content,click}=item;
                    var {year,month,day}=getDate(updateTime);
                    var tagHtml = "";
                    for (var t of tags[nid]) {//每个新闻标签对象的属性名时新闻nid==>tags[nid]
                        var {tid,nid,tag}=t;
                        tagHtml += `<a href="javascript:;">${tag}</a>`;
                    }
                    html += `<div class="news-item">
                    <div class="img-bg"><a href="news_details.html?nid=${nid}&tid=${tid}"><img src="${md}" alt=""></a></div>
                    <div class="info-text">
                    <h2><a href="news_details.html?nid=${nid}&tid=${tid}">${title}</a></h2>
                    <ul>
                        <li><span class="fa fa-clock-o"></span>${year}-${month}-${day}</li>
                        <li><span class="fa fa-user-plus"></span>${author}</li>
                        <li><span class="fa fa-eye"></span>${click}</li>
                    </ul>
                    <p>${content}</p>
                    <div class="tag">
                        <span>标签:</span>
                       ${tagHtml}
                    </div>
                    <button class="more"><a href="news_details.html?nid=${nid}&tid=${tid}"><span>READ MORE</span><i>&gt;</i><i>&gt;</i><i>&gt;</i></a>
                    </button>
                    </div>
                    </div>`;
                }
                var newsBox = $("#news > .container > .newsBox");
                newsBox.html(html);

                var html = "";
                for (var r of recommend) {
                    var {nid,tid,title,updateTime,sm}=r;
                    var {year,month,day}=getDate(updateTime);
                    html += `<li>
                    <a href="news_details.html?nid=${nid}&tid=${tid}">
                        <img src="${sm}" alt="">
                        <p>web ${title}</p>
                        <p>${year}-${month}-${day}</p>
                    </a>
                </li>`;
                }
                var reBox = $("#news > .container > .recommend > ul");
                reBox.html(html);


                var select=5;//最多可显示5个数字按钮来进行页面切换
                var html = `<a href="news_list.html?tid=${params.tid}&pageNum=1" class="first ">首页</a><a href="news_list.html?tid=${params.tid}&pageNum=${pageNum - 1}" class="prev">上一页</a>`;
                if (pageTotal < select) {//页面总数小于select时正常显示
                    for (var i = 1; i <= pageTotal; i++) {
                        html += `<a href="news_list.html?tid=${params.tid}&pageNum=${i}" data-id=${i} class="pageNum" >${i}</a>`;
                    }
                } else {//页面总数大于select时
                    /*按钮布局总共有3种情况*/
                    /*1.当前页数小于4时*/
                    /*2.当前页数大于 最大页数减去3时*/
                    /*3.当前页数 等于上2种范围之外时*/
                        /*3-1 表示当前页数的按钮居中，并左右各有2个按钮*/
                    var i = 0, max = 0;
                    if (pageNum >= 4 && pageNum <= pageTotal - 3) {//第三种情况
                        i = pageNum - 2;
                        max = pageNum + 2;

                    } else if (pageNum < 4) {//第一种情况
                        i = 1;
                        max = 5;
                    } else if (pageNum > pageTotal - 3) {//第二种情况
                        i = pageTotal - 4;
                        max = pageTotal;
                    }
                    for (var n = i; n <= max; n++) {
                        html += `<a href="news_list.html?tid=${params.tid}&pageNum=${n}" data-id=${n} class="pageNum">${n}</a>`;
                    }
                }
                html += `<a href="news_list.html?tid=${params.tid}&pageNum=${pageNum + 1}" class="next">下一页</a><a href="news_list.html?tid=${params.tid}&pageNum=${pageTotal}" class="last" ">最后一页</a>`;
                var $pages = $(".pages");
                $pages.html(html);

                if (pageNum == 1) {
                    $pages.children(".first,.prev").addClass("disabled");
                    $pages.children(".last,.next").removeClass("disabled");
                } else if (pageNum == pageTotal) {
                    $pages.children(".first,.prev").removeClass("disabled");
                    $pages.children(".last,.next").addClass("disabled");
                } else {
                    $pages.children(":not('.pageNum')").removeClass("disabled");
                }

                $pages.children("[data-id=" + pageNum + "]").addClass("current").siblings().removeClass("current");

            },
            error: function () {
                alert("网络故障请检查");
            }
        });
    }

});

