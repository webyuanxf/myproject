/**
 * Created by web-01 on 2018/5/25.
 */
$(function () {
    $.ajax({
        type: "get",
        url: "footer.html",
        dataType: "html",
        success: function (html) {
            var $footer = $("#foot");
            $footer.append(html);//插入头部html内容
            var $link = '<link rel="stylesheet" href="css/footer.css">';
            $("head").append($link);//插入头部样式表

        }
    });
});