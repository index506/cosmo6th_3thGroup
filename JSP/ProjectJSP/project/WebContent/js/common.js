$(document).ready(function(){
	//gnb hover시 하위항목 표시
    $("#main_gnb .gnb .gnb_list h2 a").mouseenter(function(){
        var index = $(this).parent().parent().index();
        $("#main_gnb .gnb_"+index+" .menu").addClass("hover");
        $("#main_gnb .gnb_list").not(".gnb_"+index).children(".menu").removeClass("hover");
    });
    
    //gnb hover시 hover 된 영역 이외의 하위항목 제거 
    $("#main_header_wrap").mouseleave(function(){
        $("#main_gnb .menu").removeClass("hover");
    });
    
    //준비중 문주
    $(".alert_ready").click(function(){
        alert("준비중입니다.");
    });

    //로그인 여부에 따른 메인 페이지 화면 변화
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
});