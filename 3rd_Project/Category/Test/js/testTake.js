
$(document).ready(function(){
    // start of 문제 생성 1~3
    for(var i=1; i<=3; i++){
        var txt='';
        txt+='<div id="quiz_box_'+i+'" class="quiz_box">';
        txt+='<ul>';
        txt+='<li><div>'+quiz[i-1][0]+'</div></li>';
        if(quiz[i-1][1]!=null){
            txt+='<li><img src="'+quiz[i-1][1]+'"></li>';
        }
        for(var j=1; j<=4; j++){
            txt+='<li>';
            txt+='<input id="answer'+i+'_'+j+'" class="answer" type="radio" name="'+i+'" value="'+j+'"/>';
            txt+='<label for="answer'+i+'_'+j+'">'+quiz[i-1][j+1]+'</label>';
            txt+='</li>';
        }
        txt+='</ul>';
        txt+='</div>';   
        $('#content_area').append(txt);
    }
    $('#quiz_box_1').addClass('now');
    // end of 문제 생성 1~3
    // start of 문제 생성 98~100
    for(var i=98; i<=100; i++){
        var txt='';
        txt+='<div id="quiz_box_'+i+'" class="quiz_box">';
        txt+='<ul>';
        txt+='<li><div>'+quiz2[i-98][0]+'</div></li>';
        if(quiz2[i-98][1]!=null){
            txt+='<li><img src="'+quiz2[i-98][1]+'"></li>';
        }
        for(var j=1; j<=4; j++){
            txt+='<li>';
            txt+='<input id="answer'+i+'_'+j+'" class="answer" type="radio" name="'+i+'" value="'+j+'"/>';
            txt+='<label for="answer'+i+'_'+j+'">'+quiz2[i-98][j+1]+'</label>';
            txt+='</li>';
        }
        txt+='</ul>';
        txt+='</div>';   
        $('#content_area').append(txt);
    }
    // end of 문제 생성 98~10
    
    
    

    // start of 남은 시간
    const testTimeMin = 150; // 분단위로 DB에서 시험시간 받아오기
    var hour = parseInt(testTimeMin/60); // 시간단위 - 초기값은 시간으로 나눈 몫
    var min = testTimeMin%60; // 분단위 - 초기값은 시간으로 나눈 나머지
    var sec = 0; // 초단위 - 초기값은 0

    timeTextWrite(hour,min,sec);

    var timer=setInterval(function(){
        if(--sec<0) { sec=59;
            if(--min<0){ min=59;
                if(--hour<0){
                    alert("시험이 종료되었습니다.");
                    $('#save.btn').trigger("click");
                    //location.href="./testResult.html";
                } // end of hour
            } // end of min
        } // end of sec      
        timeTextWrite(hour,min,sec);
    }, 1000);

    function timeTextWrite(hour, min, sec){
        $('.timer').val(zeroConcat(hour)+":"+zeroConcat(min)+":"+zeroConcat(sec)); // time td의 내용 교체
    }

    function zeroConcat(time){
        if(time<10) time="0"+time; // 0~9는 앞에 0 붙임 (00,09)
        return time;
    }
    //  end of 남은시간

    // start of 풀지 않은 문제, 푼 문제 색칠 기능
    $('.answer').click(function(){
        var quizNum = $(this).attr('name');
        $('#gbtn'+quizNum).addClass('is');
    });
    // end of 풀지 않은 문제, 푼 문제 색칠 기능

});