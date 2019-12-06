$(document).ready(function(){
	 if($('#license_select').val()==""){ // 자격증 select option ---------- 선택되 있을때
         $('#year_area').addClass('hidden');
         $('#subject_area').addClass('hidden');
         $('#timer_area').addClass('hidden');
         $('#btn_area').addClass('hidden');
     }
});



/* 자격증 재선택시 - 해당하는 기출문제 목록 가져오기 (ajax) */
function selectlicense(){
 $('#year_area').addClass('hidden');
 $('#subject_area').addClass('hidden');
 $('#timer_area').addClass('hidden');
 $('#btn_area').addClass('hidden');
 
    if($('#license_select').val()!=""){ // 자격증 select option "----------"을 선택한 경우가 아닐 때
        $('#year_area').removeClass('hidden'); // 년도 영역 보이기
        
        var license_name = $('#license_select option:selected').text(); // 자격증 이름
        $('input[type=hidden].license_name').val(license_name); // 자격증 이름의 히든타입 추가
        
        var URL = "../years";
        URL += "?license_name="+license_name;
        console.log(URL);
        
        $.ajax({ // 선택한 license에 해당하는 year 가져오기 
			type:"get",
            async:false, 
            url: URL, // 보내는 경로
            success:function (data,textStatus){
            	console.log("AjaxReturnYearsJSON");
				var jsonInfo = JSON.parse(data); // json 형태로 다시 파싱
				var txt="<option value=''>------------</option>";

    	     	for(var i in jsonInfo.years) {
    	         	var year_date = jsonInfo.years[i].year_date;
    	         	txt+='<option value="'+year_date+'">'+year_date+'</option>';
    	   		 }
    	     	 $('#year_select').html(txt);
    	   	}, // end of success
    	   	error:function(data,textStatus){
				alert("에러가 발생했습니다.");
			} // end of error
		});  //end ajax	
	}
}

 /* 년도 재선택시 - 해당하는 과목 목록 가져오기 (ajax) */
function selectYear(){
	$('#subject_area').addClass('hidden');
	$('#timer_area').addClass('hidden');
	$('#btn_area').addClass('hidden');
	$('#hidden_area').find('.subjectRanges').remove(); // 과목 문제 범위 삭제
	$('#hidden_area').find('.subjectNumbers').remove();  // 과목 문제 수 삭제
 
	if($('#year_select').val()!=""){ // 년도 select option "----------"을 선택한 경우가 아닐 때
        $('#subject_area').removeClass('hidden');
        $('#timer_area').removeClass('hidden');
        $('#btn_area').removeClass('hidden');
        
        var license_text = $('#license_select option:selected').text(); // 자격증 약어
        var year_date = $('#year_select option:selected').val(); // yyyy-MM-dd
        	            
        var URL =  "../subjects";
        URL += "?license_name="+license_text;
        URL += "&year_date="+year_date;
        
        console.log(URL);
        	            
        $.ajax({ // 선택한 year에 해당하는 subject 가져오기 
			type:"get",
            async:false, 
            url:URL, // 보내는 경로
            success:function (data,textStatus){
            	console.log("AjaxReturnSubjectsJSON");
				var jsonInfo = JSON.parse(data); // json 형태로 다시 파싱
				console.log(jsonInfo);
				
	         	var subject_names = jsonInfo.subject.subject_names;
  				console.log("과목 이름 "+subject_names);	
	         	var subject_ranges = jsonInfo.subject.subject_ranges;
  				console.log("과목 문제범위 "+subject_ranges);	
	         	var subject_numbers = jsonInfo.subject.subject_numbers;
  				console.log("과목 문제수 "+subject_numbers);	
	         	var subject_total = jsonInfo.subject.subject_total;
	         	console.log("총 과목수 "+subject_total);
	         	$('.subject_total').val(subject_total);
	         	var subject_time = jsonInfo.subject.subject_time;
	         	console.log("시험시간 "+subject_time);
	         	$('#timer_yes').val(subject_time);
	         	
	         	var subjectNameArr = subject_names.split("/");
	         	var subjectRangeArr = subject_ranges.split("/");
	         	var subjectNumberArr = subject_numbers.split("/");
	         	
	         	var txt=""; // 과목 삽입 변수
				var txtHidden=""; // hidden 영역 과목 문항 수 append 용 변수
				for(var i=1; i<=subject_total; i++) { // 총과목 수 만큼 반복 
	    	    	console.log(i+"과목이름:"+subjectNameArr[i-1]);
	    	    	console.log(i+"과목문제범위:"+subjectRangeArr[i-1]);
	    	    	console.log(i+"과목문제수:"+subjectNumberArr[i-1]);

	    	         	txt+='<li class="subject_li">';
	    	         		txt+='<input id="part'+i+'_check" class="subjects" name="subject_name" type="checkbox" value="'+subjectNameArr[i-1]+'" onclick="selectSubject(this);" checked>';
	    	         		txt+='<label for="part'+i+'_check">'+i+'과목 : '+subjectNameArr[i-1]+' ['+subjectRangeArr[i-1]+' 문항]</label>';
	    	         	txt+='</li>';
	    	         	txtHidden+='<input type="hidden" class="subjectRanges" name="subject_range" value="'+subjectRangeArr[i-1]+'">';
	    	         	txtHidden+='<input type="hidden" class="subjectNumbers" name="subject_number" value="'+subjectNumberArr[i-1]+'">';
	    	         	
	    	    }
	    		console.log(txtHidden);
	    		$('.subject_ul').html(txt); // 과목 삽입
	    		$('#hidden_area').append(txtHidden); // 과목 문항 수 hidden 타입으로 삽입
    	   	}, // end of success
    	   	error:function(data,textStatus){
				alert("에러가 발생했습니다.");
			} // end of error
		});  //end ajax	
    }
}