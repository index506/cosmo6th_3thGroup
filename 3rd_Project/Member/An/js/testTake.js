$(document).ready(function(){

    // start of 남은 시간
    const testTimeMin = 90; // 분단위로 DB에서 시험시간 받아오기
    var hour = parseInt(testTimeMin/60); // 시간단위 - 초기값은 시간으로 나눈 몫
    var min = testTimeMin%60; // 분단위 - 초기값은 시간으로 나눈 나머지
    var sec = 0; // 초단위 - 초기값은 0

    timeTextWrite(hour,min,sec);

    var timer=setInterval(function(){
        if(--sec<0) {
            sec=59;
            if(--min<0){
                min=59;
                if(--hour<0){
                    alert("시험이 종료되었습니다.");
                    $('#save_sub').trigger("click");
                    //location.href="./testResult.html";
                } // end of hour
            } // end of min
        } // end of sec      
        timeTextWrite(hour,min,sec);
    }, 1000);

    function timeTextWrite(hour, min, sec){
        $('span.time').text(zeroConcat(hour)+":"+zeroConcat(min)+":"+zeroConcat(sec)); // time td의 내용 교체
    }
    function zeroConcat(time){
        if(time<10) time="0"+time; // 0~9는 앞에 0 붙임 (00,09)
        return time;
    }
    //  end of 남은시간

    // start of 푼 문제 번호이동버튼 색칠
    $('.answer').click(function(){
        var quizNum = $(this).attr('name');
        $('#gbtn'+quizNum).addClass('is');
    });
    // end of 푼 문제 번호이동버튼 색칠

});