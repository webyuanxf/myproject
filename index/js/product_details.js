/**
 * Created by web-01 on 2018/5/29.
 */


$(function () {
    var lgUl = $("#product-details>.showPro_head>.imgBox>.md_box>ul");
    var smUl = $("#product-details>.showPro_head>.imgBox>.sm_box ul");
    var lef = $("#product-details>.showPro_head>.imgBox>.sm_box>.lef");
    var rht = $("#product-details>.showPro_head>.imgBox>.sm_box>.rht");
    var href=location.href;
    var params=getParam(href,["tid","pid"]);
    $(".top-nav li").eq(params.tid).addClass("active").siblings().removeClass("active");
    $.ajax({
        type: "get",
        url: "data/product/getProducts_details.php",
        data: {pid: params.pid},
        dataType: "json",
        success: function (data) {
            var {product, recommend, pics, desc} = data;
            var {title, updateTime, click, pid, spec} = product;
            var html = "";
            var html2 = "";
            var smWidth = 90;
            var moved = 0;

            smUl.css("width", smWidth * pics.length);

            for (var imgs of pics) {
                var {lg, sm} = imgs;
                html += `<li><img src="${lg}" alt="${title}"></li>`;
                html2 += `<li><img src="${sm}" alt="${title}"></li>`;
            }
            lgUl.html(html);
            smUl.html(html2);
            smUl.children().eq(0).addClass("current");
            lgUl.children().eq(0).addClass("current");

            smUl.on("mouseenter", "li", function () {
                var $this = $(this);
                var index = $this.index();
                $this.addClass("current").siblings().removeClass("current");
                lgUl.children().eq(index).addClass("current").siblings().removeClass("current");
            });
            if (pics.length <= 5) {
                lef.addClass("disabled");
                rht.addClass("disabled");
            } else {
                lef.addClass("disabled");
            }
            var smWidth = 94;
            var smBox = $("#product-details>.showPro_head>.imgBox>.sm_box");
            smBox.on("click", "a", function () {
                if ($(this).is(".disabled")) {
                    return;
                } else if ($(this).is(".lef")) {
                    moved++;
                    if (moved == 0) {
                        $(this).addClass("disabled");
                        rht.removeClass("disabled");
                    } else {
                        $(this).removeClass("disabled");
                    }
                } else if ($(this).is(".rht")) {
                    moved--;
                    if (moved == 5 - pics.length) {
                        $(this).addClass("disabled");
                        lef.removeClass("disabled");
                    } else {
                        $(this).removeClass("disabled");
                    }
                }
                smUl.css("left", moved * smWidth);
            });
            var cot = $("#product-details>.showPro_head>.desc");
            var {year,month,day,hours,minutes,seconds}=getDate(updateTime);
            var html = `<h2>${title}</h2>
            <div>
                <span class="fa fa-clock-o"></span><span class="time">${year}-${month}-${day}&nbsp;${hours}:${minutes}:${seconds}</span>
                <span class="fa fa-eye"></span><span class="click">${click}</span>
            </div>
            <p>${spec}</p>`;
            cot.html(html);

            var details = $("#product-details>.showPro_body>.details>.body");
            var html = "";

            for (var img of desc) {
                var {detail} = img;
                html += ` <img src="${detail}" alt="${title}">`;
            }
            details.html(html);

            var recUl=$("#product-details>.showPro_body>.reco>ul");
            var html="";
            for(var ob of recommend){
                var {pid,tid,title,hpic}=ob;
                html+=`<li><a href="product_details.html?pid=${pid}&tid=${tid}">
                    <img src="${hpic}" alt="${title}">${title}</a></li>`;
            }
            recUl.html(html);
        },
        error: function () {
            // php语法错；sql与发错；json语法错；404
            alert("网络故障请检查。。。");
        }
    })
});
