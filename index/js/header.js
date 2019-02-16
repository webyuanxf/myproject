/**
 * Created by renzh on 2018/5/19.
 */


$(function(){

    var $head=$("#head");
    var $headHeight=$head.height();
    var $goTop=$("#goTop");

    $(window).scroll(function(){
        if($(this).scrollTop()==0){
            $head.removeClass("fixed");
        }else if($(this).scrollTop()<$headHeight+30){
            $goTop.removeClass("show");
        }else if($(this).scrollTop()>$headHeight+30){
            $head.addClass("fixed");
            $goTop.addClass("show");
        }
    });
    $goTop.on("click",function(){
        $("html,body").animate({
            scrollTop:0
        },function(){
            $head.removeClass("fixed");
            $goTop.removeClass("show");
        });

    })

});

/*侧边导航栏开关*//*

            $openBtn.click(function () {
                var $this = $(this);
                var $shadow = $("#side-shadow");
                if ($this.children("div").is(".open")) {
                    $(this).children("div").removeClass("open");
                    $(this).parent().removeClass("open");
                    $shadow.removeClass("open");
                } else {
                    $(this).children("div").addClass("open");
                    $(this).parent().addClass("open");
                    $shadow.addClass("open");
                }
            });


        }
    });
});*/
