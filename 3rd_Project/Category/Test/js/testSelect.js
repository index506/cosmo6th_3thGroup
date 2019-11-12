/* 자격증 선택 */
function selectlicense(){
    if($('#license_select').val()==""){
        $('#year_area').addClass('hidden');
        $('#subject_area').addClass('hidden');
        $('#timer_area').addClass('hidden');
        $('#btn_area').addClass('hidden');
    }else {
        $('#year_area').removeClass('hidden');
    }
}

/* 기출문제 선택 */
function selectYear(){
    if($('#license_select').val()==""){
        $('#year_area').addClass('hidden');
    }else {
        $('#subject_area').removeClass('hidden');
        $('#timer_area').removeClass('hidden');
        $('#btn_area').removeClass('hidden');
    }
}


// 시험풀기로 전송 전 선택되어있는지 체크
function selectCheck(){
	var subs = document.frm.subjects;
	
	for(var i=0; i<subs.length; i++){
		if(subs[i].checked) return true;  // 과목 항목 중 하나 이상 체크 되었을 때
	}
	
	alert("과목을 하나 이상 선택해주세요.");
	return false; // 과목 항목 중 체크 된 것이 없을 때
}

$(document).ready(function(){

    var txt='';
    txt+='<div id="license_area" class="q_area manual_item">';
    txt+='<h4>1. 자격증을 선택해주세요.</h4>';
    txt+='<select id="license_select" class="license_select " name="license" onchange="selectlicense();">';
    txt+='<option value="">------------</option>';
    for(var i=1; i<=licenseNum; i++){
        txt+='<option value="'+testLicense[i-1]+'">'+testLicense[i-1]+'</option>';
    }

    txt+='</select>';
    txt+='</div>';

    txt+='<div id="year_area" class="q_area hidden manual_item">';
    txt+='<h4>2. 기출문제를 선택해주세요.</h4>';
    txt+='<select id="year_select" class="year_select" name="year"  onchange="selectYear();">';
    txt+='<option value="">------------</option>';
    for(var i=1; i<=yearNum; i++){
        txt+='<option value="'+testYear[i-1]+'">'+testYear[i-1]+'</option>';
    }
    txt+='</select>';
    txt+='</div>';

    txt+='<div id="subject_area" class="q_area hidden manual_item">';
    txt+='<h4>3. 과목을 선택해주세요.</h4>';
    txt+='<ul class="subject_ul">';
    for(var i=1; i<=5; i++){
        txt+='<li class="subject_li">';
        txt+='<input id="part'+i+'_check" name="subjects" type="checkbox" value="20" checked />';
        txt+='<label for="part'+i+'_check"> '+i+'과목 : '+testSubject[i-1]+'</label>';
        txt+='</li>';
    }
    txt+='</div>';

    txt+='<div id="timer_area" class="q_area hidden manual_item">';
    txt+='<h4>4. 시간 제한 여부를 선택해주세요.</h4>';
    txt+='<ul><li>';
    txt+='<input type="radio" id="timer_yes" name="timer" value="150" checked="checked">';
    txt+='<label for="timer_yes">예</label>';
    txt+='</li>';
    txt+='<li>';
    txt+='<input type="radio" id="timer_no" name="timer" value="">';
    txt+='<label for="timer_no">아니오</label>';
    txt+='</li></ul>';
    txt+='</div>';

    txt+='<p id="btn_area" class="btn_area hidden">';
    txt+='<input type="submit" id="solve_sub" class="btn" value="시험풀기" onclick="return selectCheck();">';
    txt+='</p>';

    $('#option_form fieldset').append(txt);
    
});
