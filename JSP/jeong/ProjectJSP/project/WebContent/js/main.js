$(document).ready(function(){
    time();
    img_slide(5000);
});

function img_slide(time){
    var timer = setInterval(function(){
        img_next();
    },time);

    $("#main_image").mouseenter(function(){
        clearInterval(timer);
    });
    $("#main_image").mouseleave(function(){
        timer = setInterval(function(){
            img_next();
        },time);
    });
    $("#main_image .left_Btn").click(function(){
        if($("#main_image .book_image ul").css("margin-left")=="-400px")
            img_prev();
    });
    $("#main_image .right_Btn").click(function(){
        if($("#main_image .book_image ul").css("margin-left")=="-400px")
            img_next();
    });
}

function img_next(){
    var slide = 400;
    var firstLi = $("#main_image .book_image ul li:first-child").html();
    $("#main_image .book_image ul").stop().animate({"margin-left":"-"+(slide+=200)+"px"},2000,function(){
        $("#main_image .book_image ul").append("<li>"+firstLi+"</li>").css("margin-left","-400px");
        $("#main_image .book_image ul li:first-child").remove();
    });
}

function img_prev(){
    var slide = 400;
    var lastLi = $("#main_image .book_image ul li:last-child").html();
    $("#main_image .book_image ul").stop().animate({"margin-left":"-"+(slide-=200)+"px"},2000,function(){
        $("#main_image .book_image ul").prepend("<li>"+lastLi+"</li>").css("margin-left","-400px");
        $("#main_image .book_image ul li:last-child").remove();
    });
}

function time(){
    var t = new Date();
    var nowYear = t.getFullYear();
    var theDate = new Date(nowYear,11,23); //월은 0이 1
    var diffDate = theDate - t;

    var D_Day = Math.ceil(diffDate/(1000*60*60*24));
    
    if(D_Day==0)
        $("#main_table .second .item_0").css("font-weight","bold").css("color","red");
    else if(D_Day<0)
        D_Day=0;
    $("#main_table .second .item_0").text("D-"+D_Day);
}