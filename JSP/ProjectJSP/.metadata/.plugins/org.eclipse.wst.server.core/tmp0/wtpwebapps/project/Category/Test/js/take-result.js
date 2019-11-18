$(document).ready(function(){
	var nowNum=1; // 현재 문제번호
	const LAST_NUM=$('.go_btn').length; // 마지막 문제번호 : 버튼 개수
	
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