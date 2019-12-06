

$(document).ready(function(){
	var answer_string = document.getElementById('answer_string').innerHTML;
	console.log(answer_string);
	 /* 시험 답안 Update */
	$('.answer').click(function(){
		var stringIs = answer_string.indexOf($(this).attr('name')+":");
		console.log(stringIs);
		
		if(stringIs == -1){ // 시험 답안에 추가 (새로 푼 문제)
			answer_string += "/"+$(this).attr('name')+":"+$(this).val();
			console.log(answer_string);
		} else { // 시험 답안 변경 (풀었던 문제)
			var pattern = new RegExp($(this).attr("name")+':[0-4]'+':0');
			console.log(pattern);
			answer_string = answer_string.replace(pattern, $(this).attr('name')+":"+$(this).val()+":0");
			console.log(answer_string);
		}

		if(answer_string.charAt(0) == "/"){
			answer_string = answer_string.substring(1);
		}
			
		console.log($('.timer').val());
		
		var URL =  "../answer"; 
		URL += "?answer_string="+answer_string; // 시험 답안 전송
		URL += "&log_time="+$('.timer').val(); // 시험 답안 전송
		
		
		console.log(URL);
       	            
		$.ajax({
			type:"get",
               async:false, 
               url:URL, // 보내는 경로
               success:function (data,textStatus){
    	   	},
    	   	error:function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		});  //end of ajax	

	}); // end of '.answer' click
	/*//end of 시험 답안 Update */
	
}); // end of document