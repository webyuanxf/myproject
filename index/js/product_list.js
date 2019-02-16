/**
 * Created by web-01 on 2018/5/28.
 */
var $box = $("#product>.container");
function loadPages(tid){
    $.ajax({
        type: "GET",
        url: "data/product/getProducts.php",
        data: tid,
        dataType: "json",
        success: function (data) {
            var products = [];
            var {type, product} = data;
            for (var i = 0, l = product.length; i < l; i++) {
                var html = "";
                for (var o of product[i]) {
                    var {hpic, pid, tid, title} = o;
                    html += `<li>
                    <a href="product_details.html?pid=${pid}&tid=${tid}">
                        <span><img src="${hpic}" alt="${title}"></span>
                        <span>${title}</span>
                        <span>+</span>
                        <span></span>
                    </a>
                </li>`
                }
                products[i] = html;
            }
            var html = "";
            for (var i = 0, l = type.length; i < l; i++) {
                var {name, txt} = type[i];
                html += `<div class="product_list">
                            <h2>${name}</h2>
                        <p>${txt}</p>
                        <ul>${products[i]}</ul>
                 </div>`
            }
            $box.html(html);
        },
        error: function () {
            // php语法错；sql与发错；json语法错；404
            alert("网络故障请检查。。。");
        }
    });
}

var href=location.href;
var tid=getParam(href,["tid"]);
if(tid.tid==null||tid.tid=='undefined'||tid.tid==0){
    tid.tid=0;
}
$(".top-nav li").eq(tid.tid).addClass("active").siblings().removeClass("active");
loadPages(tid);

