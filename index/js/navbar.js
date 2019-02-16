/**
 * Created by renzh on 2018/5/19.
 */
$(function () {
    var $head = $("#head");
    var $link = '<link rel="stylesheet" href="css/navbar.css">';
    $("head").append($link);//插入头部样式表
    $.ajax({
        type: "get",
        url: "navbar.html",
        dataType: "html",
        success: function (html) {
            $head.append(html);//插入头部html内容
            var $openBtn = $(".side-nav-open");
            /*侧边导航栏开关*/
            var $shadow = $("#side-shadow");//遮罩层
            var $secNav=$(".side-nav-bar>.list>li>.nav-sec");//二级导航
            var $navBox=$("#side-nav>div");
            $shadow.css("height",$(window).height());
            $openBtn.click(function () {
                var $this = $(this);
                if ($this.children("div").is(".open")) {//侧边导航栏处于关闭状态时
                    document.documentElement.style.overflow="visible";//禁止页面滚动
                    $(this).children("div").removeClass("open");
                    $(this).parent().parent().removeClass("open");
                    $shadow.removeClass("open");
                    // $secNav.css("zindex","-1");
                    $navBox.css("width","360px");
                } else {//导航栏处于打开状态时
                    document.documentElement.style.overflow="hidden";//禁止页面滚动
                    $(this).children("div").addClass("open");
                    $(this).parent().parent().addClass("open");
                    $shadow.addClass("open");
                    // $secNav.css("zIndex","0");
                    $navBox.css("width","800px");
                }
            });
            var $search=$(".side-nav-bar>.head input");
            var $btn=$(".side-nav-bar>.head i");
            $btn.click(function(){
                var kw=$search.val();
                if(kw==null||kw==""){
                    alert("搜索内容不能为空！");
                    return;
                }
                location.href="search.html?kw="+kw;
            });
            $search.keydown(function(e){

                if(e.keyCode==13){
                    e.preventDefault();
                   $btn.click();
                }
            });



        }
    });
});
