$(function () {
    document.documentElement.style.overflow="hidden";//禁止页面滚动
    var $cHeight = $(window).height();
    var $page = $('.page');
    $page.css('height', $cHeight);//设置楼层页面的高度
    /*页面滚动效果*/
    var setTime;
    var pmoved=0;//页面移动的单位值
    var pLength=$("#pageBoxs").children().length;
    var fHeight=82;//底部高度
    var $goTop=$("#goTop");
    function pageMove(){//页面滚动动画函数
        clearTimeout(setTime);//重置定时器
        $("#pageBoxs").css('transform', 'translateY(-' + $cHeight * pmoved + 'px)');//滚动页面
        setTime=setTimeout(function(){//进行滚动时延迟800加载当前楼层每个元素的动画
            $(".page").eq(pmoved).children(".i_cot_box").addClass("nowPage");
        },800);
        $(".page").eq(pmoved).siblings().children(".i_cot_box").removeClass("nowPage");//重置其他楼层元素的动画
        if(pmoved!=0){//滚动时固定导航条
            $(".top_header").addClass("fixed");
            $goTop.addClass("show");
        }else{
            $(".top_header").removeClass("fixed");
            $goTop.removeClass("show");
        }
        /*头部导航，栏目之间的切换*/
        $(".top-nav li").eq(pmoved).addClass("active").siblings().removeClass("active");

    }
    function pageScroll(){//滚轮事件函数
        $("#pageBoxs").on("mousewheel.ab", throttle(function (e, delta) {
            if (delta < 0) {//向上滚动时
                pmoved++;
                if(pmoved==pLength-1){//滚动到最后页面时
                    $("#pageBoxs").css('transform', 'translateY(-' + ($cHeight * (pLength-2)+fHeight) + 'px)');//
                    return;
                }else if(pmoved==pLength){
                    pmoved--;
                    return;
                }
            } else if (delta > 0) {
                pmoved--;
                if (pmoved < 0) {
                    pmoved = 0;
                    return;
                }
            }
            pageMove();
        }, 250));
    }
    pageScroll();
    /*点击导航栏栏目滚动到对应的楼层*/
    $(".top-nav").on("click", "li", function (e) {
        e.preventDefault();
        var $this = $(this);
        pmoved = $this.index();//获取点击栏目的楼层数
        pageMove();//进行滚动
    });

    /*页面滚动到顶部*/
    $goTop.on("click",function(){
        pmoved=0;
        pageMove();
    })
});
