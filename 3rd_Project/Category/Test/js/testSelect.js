/* 자격증 선택 */
function selectlicense(){
    yearReset();
    if($('#license_select').val()!=""){ // -------- 선택시 기출문제 이하 영역 은닉, 초기화
        yearAppend();
        $('#year_area').removeClass('hidden');
    }
}

/* 기출문제 선택 */
function selectYear(){
    subjectReset();
    if($('#year_select').val()!=""){ // -------- 선택시 
        subjectAppend();
        timeAppend();
        $('#subject_area').removeClass('hidden');
        $('#timer_area').removeClass('hidden');
        $('#btn_area').removeClass('hidden');
    }
}

 // 기출문제 이하 영역 은닉, 초기화
function yearReset(){
    $('#year_area').addClass('hidden').find('#year_select').html("");
    subjectReset();
}

// 과목 이하 영역 은닉, 초기화
function subjectReset(){
    $('#subject_area').addClass('hidden').find('.subject_ul').html("");
    $('#timer_area').addClass('hidden').find('#timeInsert').html("");
    $('#btn_area').addClass('hidden');
}

// 선택한 자격증의 기출문제 출력
function yearAppend(){
    var txt='';
    if($('#license_select').val()=="정보처리기사"){ // 정보처리기사 기출문제 출력
        txt+='<option value="">------------</option>';
        for(var i=1; i<=3; i++){
            txt+='<option value="'+testYear[i-1]+'">'+testYear[i-1]+'</option>';
        }
        
    } else if($('#license_select').val()=="리눅스마스터 1급"){ // 리눅스마스터 1급 기출문제 출력
        txt+='<option value="">------------</option>';
        for(var i=1; i<=2; i++){
            txt+='<option value="'+testYear2[i-1]+'">'+testYear2[i-1]+'</option>';
        }
    } 
    $('#year_select').append(txt);
}

// 선택한 기출문제의 과목 출력
function subjectAppend(){
    var txt='';
    if($('#license_select').val()=="정보처리기사"){ // 정보처리기사
        if($('#year_select').val().substr(0,4)=="2020"){ // 정보처리기사 - 2020
            for(var i=1; i<=5; i++){
                txt+='<li class="subject_li">';
                txt+='<input id="part'+i+'_check" name="subjects" type="checkbox" value="20" checked />';
                txt+='<label for="part'+i+'_check"> '+i+'과목 : '+testSubject2[i-1]+'</label>';
                txt+='</li>';
            }
        }else { // 정보처리기사 - not 2020
            for(var i=1; i<=5; i++){
                txt+='<li class="subject_li">';
                txt+='<input id="part'+i+'_check" name="subjects" type="checkbox" value="20" checked />';
                txt+='<label for="part'+i+'_check"> '+i+'과목 : '+testSubject[i-1]+'</label>';
                txt+='</li>';
            }
        }
        
    } else if($('#license_select').val()=="리눅스마스터 1급"){
        for(var i=1; i<=3; i++){
            txt+='<li class="subject_li">';
            txt+='<input id="part'+i+'_check" name="subjects" type="checkbox" value="20" checked />';
            txt+='<label for="part'+i+'_check"> '+i+'과목 : '+testSubject3[i-1]+'</label>';
            txt+='</li>';
        }
    }
    
    txt+='</div>';
    $('.subject_ul').append(txt);
}

// 선택한 기출문제의 시험시간 출력
function timeAppend(){
    var txt='';
    if($('#license_select').val()=="정보처리기사"){ // 정보처리기사 기출문제 출력
        txt+='<input type="radio" id="timer_yes" name="timer" value="'+time[0]+'" checked="checked">';
        txt+='<label for="timer_yes">예</label>';
    } else if($('#license_select').val()=="리눅스마스터 1급"){ // 리눅스마스터 1급 기출문제 출력
        txt+='<input type="radio" id="timer_yes" name="timer" value="'+time[1]+'" checked="checked">';
        txt+='<label for="timer_yes">예</label>';
    } 
    $('#timeInsert').append(txt);
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
    /* 실행시 기출문제 이하 영역 은닉 */
    $('#year_area').addClass('hidden');
    $('#subject_area').addClass('hidden');
    $('#timer_area').addClass('hidden');
    $('#btn_area').addClass('hidden');

    var txt='';
    txt+='<option value="">------------</option>';
    for(var i=1; i<=licenseNum; i++){
        txt+='<option value="'+testLicense[i-1]+'">'+testLicense[i-1]+'</option>';
    }
    $('#license_select').append(txt);

});
