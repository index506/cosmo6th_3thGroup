$(document).ready(function(){

    $("#main_gnb .gnb .gnb_list h2 a").mouseenter(function(){
        var index = $(this).parent().parent().index();
        $("#main_gnb .gnb_"+index+" .menu").addClass("hover");
        $("#main_gnb .gnb_list").not(".gnb_"+index).children(".menu").removeClass("hover");
    });
    $("#main_header_wrap").mouseleave(function(){
        $("#main_gnb .menu").removeClass("hover");
    });
    //gi
});
