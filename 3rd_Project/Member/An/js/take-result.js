$(document).ready(function(){
    
    const TOTALNUM=60;

    // start of 번호이동 버튼 생성
    for(var i=1; i<=TOTALNUM; i++){
        $('#gbtn').append('<input type="button" class="go_btn" value="'+i+'" id="gbtn'+i+'">');
        if(i%5==0) $('#gbtn').append('<br>');
    }
    // end of 번호이동 버튼 생성

    var nowNum = 1; // 현재 문제번호
    const MAX_NUM = 3; // 마지막 문제번호

    // start of 다음, 이전 버튼 기능
    $('#next').click(function(){ quizPrevNext(MAX_NUM,1); });
    $('#prev').click(function(){ quizPrevNext(1,-1); });

    function quizPrevNext(num_limit, one){ // (마지막/처음, 1/-1)
        if(nowNum!=num_limit){
            $('#quiz_box_'+nowNum).removeClass('now');
            nowNum=nowNum+one;
            $('#quiz_box_'+nowNum).addClass('now');
        }
    }
    // end of 다음, 이전 버튼 기능

    // start of  번호 이동 기능
    $('.go_btn').click(function(){ 
        $('#quiz_box_'+nowNum).removeClass('now');
        nowNum = Number($(this).val());
        $('#quiz_box_'+nowNum).addClass('now');          
     });
    // end of 번호 이동 기능

});