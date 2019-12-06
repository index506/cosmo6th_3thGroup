$(document).ready(function(){
	var i=0;
	$(".test .body").each(function(){
		var grade = 0;
		$(".test .body").eq(i).find(".grade p").each(function(){
			grade += parseInt($(this).text());
		});
		
		if($(".test .body").eq(i).find(".name").text()=="정보처리기사"){
			var time = $(".test .body").eq(i).find(".lead p").text();
			
		    var h = 2-parseInt(time.substr(0,2));
		    var m = 30-parseInt(time.substr(3,2));
		    var s = 0-parseInt(time.substr(6,2));
		    
		    if(s<0){
		    	s += 60;
		    	m -= 1;
		    }else if(m<0){
		    	m += 60;
		    	h -= 1;
		    }
		    
		    if(h<10){
		    	h = "0"+h;
		    }
		    if(m<10){
		    	m = "0"+m;
		    }
		    if(s<10){
		    	s = "0"+s;
		    }
		    $(".test .body").eq(i).find(".lead").text(h+":"+m+":"+s);
		}else if($(".test .body").eq(i).find(".name").text()=="리눅스마스터 1급"){
			var time = $(".test .body").eq(i).find(".lead p").text();
			
		    var h = 1-parseInt(time.substr(0,2));
		    var m = 40-parseInt(time.substr(3,2));
		    var s = 0-parseInt(time.substr(6,2));
		    
		    if(s<0){
		    	s += 60;
		    	m -= 1;
		    }else if(m<0){
		    	m += 60;
		    	h -= 1;
		    }
		    
		    if(h<10){
		    	h = "0"+h;
		    }
		    if(m<10){
		    	m = "0"+m;
		    }
		    if(s<10){
		    	s = "0"+s;
		    }
		    $(".test .body").eq(i).find(".lead").text(h+":"+m+":"+s);
		}
		
		$(".test .body").eq(i).find(".grade").text(grade+"점");
		i++;
	});
});