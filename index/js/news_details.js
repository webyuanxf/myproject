/**
 * Created by renzh on 2018/6/1.
 */
$(function(){
    var href = location.href;//获取地址栏
    var params = getParam(href, ["tid","nid"]);//获取地址栏中参数
    $(".top-nav li").eq(params.tid - 1).addClass("active").siblings().removeClass("active");//定位当前栏目

    $.ajax({
        type: "GET",
        url: "data/news/getNewsDetails.php",
        dataType: "json",
        data: params,
        success:function(data){
            console.log(data);
            var {product,prev,next,recommend}=data;
            var {title,updateTime,author,click,content}=product;
            var {year,month,day,hours,minutes,seconds}=getDate(updateTime);

            if(prev==null){
                var ptitle="没有了";
                var pr="javascript:;";
            }else{
                var ptitle=prev.title;
                var pr=`news_details.html?nid=${prev.nid}&tid=${prev.tid}`;
            }
            if(next==null){
                var ntitle="没有了"
                var ne="javascript:;";
            }else{
                var ntitle=next.title;
                var ne=`news_details.html?nid=${next.nid}&tid=${next.tid}`;
            }
            var html=`<div class="head">
                <h1>${title}</h1>
                <ul>
                    <li><span class="fa fa-clock-o"></span>${year}-${month}-${day} ${hours}:${minutes}:${seconds}</li>
                    <li><span class="fa fa-user-plus"></span>${author}</li>
                    <li><span class="fa fa-eye"></span>${click}</li>
                </ul>
            </div>
            <div class="body">
            ${content}
            </div>
            <div class="foot">
                <a href="${pr}" class="prev">上一页：${ptitle}</a>
                <a href="${ne}" class="next">下一页：${ntitle}</a>
            </div>`;
            var $newsCot=$("#news-details>.container>.news-content");
            $newsCot.html(html);

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
            var reBox = $("#news-details > .container > .recommend > ul");
            reBox.html(html);
        },
        error: function () {
            alert("网络故障请检查");
        }
    });
})
