window.onload = function(){
	testTimer();
} // end of window.onload

function testTimer(){

    // start of 시험시간 타이머
	if(document.frm.timer.value != 'NOTTIMER'){
     	/* 타이머 초기화 & 삽입 */
		var testTime = document.frm.timer.value; // 시험시간
		
		timeArr = testTime.split(':');		
		
		var hour = parseInt(timeArr[0]); // 시간단위
		var min = parseInt(timeArr[1]); // 분단위
		var sec = parseInt(timeArr[2]); // 초단위
		
         /* 타이머, 종료 기능 */
		var setTimer=setInterval(function(){ // 시험 타이머
			if(--sec < 0) { sec = 59;
				if(--min < 0){ min = 59;
					if(--hour < 0){
						alert("시험이 종료되었습니다.");
						document.frm.submit();
					} // end of if(hour)
				} // end of if(min)
			} // end of if(sec)    
				
			timeTextWrite(hour,min,sec); // hh:mm:ss 형식으로 페이지에 삽입
		}, 1000); // end of timer

	    // hh:mm:ss 형식으로 페이지에 삽입
	    function timeTextWrite(h, m, s){
	    	document.frm.timer.value = zeroConcat(h)+":"+zeroConcat(m)+":"+zeroConcat(s); // HH:MM:SS or 0H:0M:0S
	    } // end of timeTextWrite()

	    // 시,분,초 가 1~9이면 앞에 0 붙이기
	    function zeroConcat(time){
	        if(time<10) time="0"+time; // 0~9는 앞에 0 붙임 => 0H, 0M, 0S
	        return time;
	    } // end of zeroConcat()
	    
	} //  end of if 시험시간 타이머
} // end of testTimer()



$(document).ready(function(){
		
    // start of 풀지 않은 문제, 푼 문제 색칠 기능
    $('.answer').click(function(){
        var quizNum = $(this).attr('name');
        $('#gbtn'+quizNum).addClass('is');
    });
    // end of 풀지 않은 문제, 푼 문제 색칠 기능

});