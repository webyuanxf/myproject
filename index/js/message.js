/**
 * Created by renzh on 2018/6/1.
 */
$(function(){

    $.ajax({
        type:"GET",
        url:"data/message/get_message.php",
        success:function(data){
            console.log(data);
            var html="";
            for(var item of data ){
                var {ans,ansTime,cot,uname,updateTime}=item;
                var qt=getDate(updateTime);
                var at=getDate(ansTime);

                html+=`<div class="msg">
                    <div class="head">
                        <span class="fa fa-user-circle"></span><span>${uname} </span>
                        <p>${cot}&nbsp;&nbsp;<small>${qt.year}-${qt.month}-${qt.day} ${qt.hours}:${qt.minutes}:${qt.seconds}</small></p>
                    </div>
                    <div class="body">
                        <span class="u">管理员</span>&nbsp;<span>回复</span>&nbsp;<span class="u">${uname}</span>&colon;
                        <span class="ans">${ans}</span><small>&nbsp;&nbsp;${at.year}-${at.month}-${at.day} ${at.hours}:${at.minutes}:${at.seconds}</small>
                    </div>
                    </div>`;
            }
            var $msgBox=$("#message>.container>.messages>.msgBox");
            $msgBox.html(html);
            $('.ans').each(function(){
                if($(this).html()=='null'){
                    $(this).parent().hide();
                }
            })


        },
        error:function(){alert("网络故障请检查")}
    })







    var $btn=$("#message>.container>.form input[type='button']");
    var $phone=$("#message>.container>.form input[name='phone']");
    var $email=$("#message>.container>.form input[name='email']");

    $btn.click(function(){
        var data = $("#message>.container>.form form").serialize();
        data+="&updateTime="+new Date().getTime();
        var reg=/^1[3|4|5|8][0-9]\d{8}$/;
        if(!reg.test(parseInt($phone.val()))){
            alert("电话号码格式不正确");
            return;
        };
        var reg=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        if(!reg.test($email.val())){
            alert("邮箱格式不正确");
            return;
        };

        $.ajax({
            type:"POST",
            url:"data/message/add_message.php",
            data:data,
            dataType:"json",
            success:function(data){
                if(data.code>0){
                    alert(data.msg);
                }else{
                    alert(data.msg);
                }
            },
            error:function(){alert("网络故障请检查")}
        });
    })
})