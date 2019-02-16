/**
 * Created by renzh on 2018/6/1.
 */
$(function(){
    var href = location.href;//获取地址栏
    var params = getParam(href, ["cid"]);//获取地址栏中参数

    $.ajax({
        type: "GET",
        url: "data/project/getProjectDetails.php",
        dataType: "json",
        data: params,
        success:function(data){
            console.log(data);
            var {project,prev,next,recommend}=data;
            var {title,updateTime,click,content}=project;
            var {year,month,day,hours,minutes,seconds}=getDate(updateTime);

            if(prev==null){
                var ptitle="没有了";
                var pr="javascript:;";
            }else{
                var ptitle=prev.title;
                var pr=`case_details.html?cid=${prev.cid}`;
            }
            if(next==null){
                var ntitle="没有了"
                var ne="javascript:;";
            }else{
                var ntitle=next.title;
                var ne=`case_details.html?cid=${next.cid}`;
            }
            var html=` <div class="head">
                <h1>${title}</h1>
                <ul>
                    <li><span class="fa fa-clock-o"></span>${year}-${month}-${day} ${hours}:${minutes}:${seconds}</li>
                    <li><span class="fa fa-eye"></span>${click}</li>
                </ul>
            </div>
            <div class="body">
                <img src="${content}" alt="${title}">
            </div>
            <div class="foot">
                <a href="${pr}" class="prev">上一页：${ptitle}</a>
                <a href="${ne}" class="next">下一页：${ntitle}</a>
            </div>`;
            var $caseCot=$("#case-details>.container>.case-content");
            $caseCot.html(html);

            var html = "";
            for (var r of recommend) {
                var {cid,title,updateTime,sm}=r;
                var {year,month,day}=getDate(updateTime);
                html += `<li>
                    <a href="case_details.html?cid=${cid}">
                        <img src="${sm}" alt="">
                        <p>web ${title}</p>
                        <p>${year}-${month}-${day}</p>
                    </a>
                </li>`;
            }
            var reBox = $("#case-details > .container > .recommend > ul");
            reBox.html(html);
        },
        error: function () {
            alert("网络故障请检查");
        }
    });
})
