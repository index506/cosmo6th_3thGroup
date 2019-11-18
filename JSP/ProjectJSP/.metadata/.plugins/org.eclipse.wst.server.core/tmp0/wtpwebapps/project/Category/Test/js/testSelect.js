$(document).ready(function(){
	 if($('#license_select').val()==""){ // 자격증 select option ---------- 선택되 있을때
         $('#year_area').addClass('hidden');
         $('#subject_area').addClass('hidden');
         $('#timer_area').addClass('hidden');
         $('#btn_area').addClass('hidden');
     }
});

// 시험풀기로 전송 전 선택되어있는지 체크
function selectCheck(){
	var subs = document.frm.subjects;
	
	for(var i=0; i<subs.length; i++){
		if(subs[i].checked) return true;  // 과목 항목 중 하나 이상 체크 되었을 때
	}
	
	alert("과목을 하나 이상 선택해주세요.");
	return false; // 과목 항목 중 체크 된 것이 없을 때
}

