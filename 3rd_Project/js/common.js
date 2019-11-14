$(document).ready(function(){
    $("#main_gnb .gnb .gnb_list h2 a").mouseenter(function(){
        var index = $(this).parent().parent().index();
        $("#main_gnb .gnb_"+index+" .menu").addClass("hover");
        $("#main_gnb .gnb_list").not(".gnb_"+index).children(".menu").removeClass("hover");
        console.log(this);
    });
    $("#main_header_wrap").mouseleave(function(){
        $("#main_gnb .menu").removeClass("hover");
    });
    $(".alert_ready").click(function(){
        alert("준비중입니다.");
    });

    $(".loginOnOff").click(function(){
        $("#top_menu ul").toggleClass("on");
        if($(this).text()=="로그인"){
            $("#main_login").css("display","none");
            $("#main_logout").css("display","block");
        }else{
            $("#main_login").css("display","block");
            $("#main_logout").css("display","none");
        }
    });

    $("#main_gnb .gnb .login a").click(function(){
        if($("#top_menu .on .loginOnOff").text()=="로그인"){
            alert("로그인 후 이용가능합니다.");
            var a = $(this).attr("href");
            a = a.replace('../','#');
            a = a.replace('./','#');
            $(this).attr("href",a);
        }else{
            var a = $(this).attr("href");
            a = a.replace('#','../');
            a = a.replace('#','./');
            $(this).attr("href",a);
        }
    });
});