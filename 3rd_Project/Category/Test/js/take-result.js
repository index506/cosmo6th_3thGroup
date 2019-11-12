

$(document).ready(function(){

    // start of 번호이동 버튼 생성 기능
    for(var i=1; i<=TOTALNUM; i++){
        if(i==1 || i%20==1) $('#gbtn').append('<div class="subject_box">'+subjects[Math.round(i/20)]+'</div>');
        $('#gbtn').append('<input type="button" class="go_btn" value="'+i+'" id="gbtn'+i+'">');
        if(i%5==0) $('#gbtn').append('<br>');
    }
    // end of 번호이동 버튼 생성 기능

    // start of  번호 이동 기능
    $('.go_btn').click(function(){ 
        $('#quiz_box_'+nowNum).removeClass('now');
        nowNum = Number($(this).val());
        $('#quiz_box_'+nowNum).addClass('now');          
     });
    // end of 번호 이동 기능

    // start of 다음, 이전 버튼 기능
    $('#next').click(function(){ quizPrevNext(LAST_NUM); });
    $('#prev').click(function(){ quizPrevNext(1); });

    function quizPrevNext(num_limit){
        
        if(nowNum!=num_limit) {
            $('#quiz_box_'+nowNum).removeClass('now'); // now-remove
            if(num_limit==1) //prev-add
                $('#quiz_box_'+(--nowNum)).addClass('now');
            else //next-add
                $('#quiz_box_'+(++nowNum)).addClass('now');
        }
    }
    // end of 다음, 이전 버튼 기능

});