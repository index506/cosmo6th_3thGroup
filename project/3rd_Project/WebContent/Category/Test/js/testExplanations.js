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
        for(j=1; j<=4; j++){
            txt+='<li>';
            txt+='<label id="answer'+i+'_'+j+'">'+quiz[i-1][j+1]+'</label>';
            txt+='</li>';
        }
        txt+='<div class="explanations_area">';
        txt+='<p><span>당신의 답안 : </span><span>'+user_answer[i-1]+'</span></p>';
        txt+='<p><span>오답률 : </span><span>'+quiz[i-1][7]+'</span></p>';
        txt+='<p><span>[문제 해설]<br></span><span>'+quiz[i-1][8]+'</span></p>';
        txt+='</div>';               
        txt+='</ul>';
        txt+='</div>';   
        $('#content_area').append(txt);
        $('#answer'+i+'_'+quiz[i-1][6]).addClass('current');
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
        for(j=1; j<=4; j++){
            txt+='<li>';
            txt+='<label id="answer'+i+'_'+j+'">'+quiz2[i-98][j+1]+'</label>';
            txt+='</li>';
        }
        txt+='<div class="explanations_area">';
        txt+='<p><span>당신의 답안 : </span><span>'+user_answer2[i-98]+'</span></p>';
        txt+='<p><span>오답률 : </span><span>'+quiz2[i-98][7]+'</span></p>';
        txt+='<p><span>[해설]<br></span><span>'+quiz2[i-98][8]+'</span></p>';
        txt+='</div>';               
        txt+='</ul>';
        txt+='</div>';   
        $('#content_area').append(txt);
        $('#answer'+i+'_'+quiz2[i-98][6]).addClass('current');
    }     
    // end of 문제 생성 98~100               
    
    // start of 번호이동 버튼 생성 기능
    for(var i=1; i<=TOTALNUM; i++){
        if(i==1 || i%20==1) $('#gbtn').append('<div class="subject_box">'+subjects[Math.round(i/20)]+'</div>');
        $('#gbtn').append('<input type="button" class="go_btn" value="'+i+'" name="'+i+'" id="gbtn'+i+'">');
        if(i%5==0) $('#gbtn').append('<br>');
    }
    // end of 번호이동 버튼 생성 기능

    // start of 맞은문제, 틀린문제 번호이동버튼
    for(var i=1; i<=TOTALNUM; i++){
        if(ans[i-1]=='C'){
            $('#gbtn'+i).addClass('current');
        } else {
            $('#gbtn'+i).addClass('wrong');
        }
    }
    // end of 맞은문제, 틀린문제 번호이동버튼
    
    
    
    
    /* 해설 페이지 jsp 기능 미완성으로 take-result에서 가져옴 */
	 $('#quiz_box_'+(nowNum)).addClass('now'); // 페이지 로드시 첫 문제에 now 클래스 추가

	 console.log(LAST_NUM);
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

	 // start of  번호 이동 기능
	             $('.go_btn').click(function(){ 
	                 $('#quiz_box_'+nowNum).removeClass('now');
	                 nowNum = Number($(this).attr('name'));
	                 $('#quiz_box_'+nowNum).addClass('now');          
	              });
	 // end of 번호 이동 기능
    

});