
function selectlicense(){
    if($('#license_select').val()==""){
        $('#year_area').addClass('hidden');
        $('#subject_area').addClass('hidden');
        $('#btn_area').addClass('hidden');
    }else {
        $('#year_area').removeClass('hidden');
    }
}

function selectYear(){
    if($('#license_select').val()==""){
        $('#year_area').addClass('hidden');
    }else {
        $('#subject_area').removeClass('hidden');
        $('#btn_area').removeClass('hidden');
    }
    
}

$(document).ready(function(){

    var licenseNum=2;
    var yearNum=2;
    var subjectNum=2;

    var testLicense = ['정보처리기사','JLPT N2'];
    var testYear = ['2019년 04월 27일','2019년 03월 03일'];
    var testSubject = [
         '데이터베이스 [20문항]'
        ,'전자계산기 구조 [20문항]'
        ,'운영체제 [20문항]'
        ,'소프트웨어 공학 [20문항]'
        ,'소프트웨어 공학 [20문항]'
    ];

    var txt='';
    txt+='<div id="license_area" class="q_area">';
    txt+='<h4>1. 자격증을 선택해주세요.</h4>';
    txt+='<select id="license_select" class="license_select" name="license" onchange="selectlicense();">';
    txt+='<option value="">------------</option>';
    for(var i=1; i<=2; i++){
        txt+='<option value="'+testLicense[i-1]+'">'+testLicense[i-1]+'</option>';
    }

    txt+='</select>';
    txt+='</div>';
    txt+='<div id="year_area" class="q_area hidden">';
    txt+='<h4>2. 기출문제를 선택해주세요.</h4>';
    txt+='<select id="year_select" class="year_select" name="year"  onchange="selectYear();">';
    txt+='<option value="">------------</option>';
    for(var i=1; i<=2; i++){
        txt+='<option value="'+testYear[i-1]+'">'+testYear[i-1]+'</option>';
    }
    txt+='</select>';
    txt+='</div>';
    txt+='<div id="subject_area" class="q_area hidden">';
    txt+='<h4>3. 과목을 선택해주세요.</h4>';
    txt+='<ul class="subject_ul">';
    for(var i=1; i<=5; i++){
        txt+='<li class="subject_li">';
        txt+='<input id="part'+i+'_check" name="part'+i+'" type="checkbox" value="20" checked />';
        txt+='<label for="part'+i+'_check"> '+i+'과목 : '+testSubject[i-1]+'</label>';
        txt+='</li>';
    }
    txt+='<p id="btn_area" class="btn_area hidden">';
    txt+='<input type="submit" id="solve_sub" class="btn" value="문제풀기">';
    txt+='<a id="cancel_a" class="btn" onclick="history.back();">돌아가기</a>';
    txt+='</p>';
    $('#option_form fieldset').append(txt);
    
});