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
    
    //준비중
    $(".alert_ready").click(function(){
        alert("준비중입니다.");
    });
    
    
});

function logoff(){
	alert("로그인 후 이용가능합니다.");
	location.href="../form/login_form.do";
}