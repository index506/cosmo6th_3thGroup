/* 시험풀기로 전송 전 선택되어있는지 체크 */
function selectCheck(){
	var subs = document.frm.subject_name;
	
	for(var i=0; i<subs.length; i++){
		if(subs[i].checked) return true;  // 과목 항목 중 하나 이상 체크 되었을 때
	}
	
	alert("과목을 하나 이상 선택해주세요.");
	return false; // 과목 항목 중 체크 된 것이 없을 때
}


/* 과목 체크에 따른 hidden (quizrange) */
function selectSubject(chk){
	var index = $('.subjects').index(chk);
	if(chk.checked){
		$('.subjectRanges').eq(index).attr( 'disabled', false );
		$('.subjectNumbers').eq(index).attr( 'disabled', false );
	} else {
		$('.subjectRanges').eq(index).attr( 'disabled', true );
		$('.subjectNumbers').eq(index).attr( 'disabled', true );
	}
}
