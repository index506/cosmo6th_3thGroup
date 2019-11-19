<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>문제 선택</title>

    <!-- 철욱 -->
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
     <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script> 
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <!-- //철욱 -->


    <link rel="stylesheet" href="${contextPath}/Category/Test/css/myCommon.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/testCommon.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/testSelect.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/manual.css" />
    <script src="${contextPath}/Category/Test/js/testSelect.js"></script>
    <script src="${contextPath}/Category/Test/js/manual.js"></script>
    <script>

		/* 자격증 재선택시 - 해당하는 기출문제 목록 가져오기 */
	    function selectlicense(){
         $('#year_area').addClass('hidden');
         $('#subject_area').addClass('hidden');
         $('#timer_area').addClass('hidden');
         $('#btn_area').addClass('hidden');
         
	        if($('#license_select').val()!=""){ // 자격증 select option "----------"을 선택한 경우가 아닐 때
	            $('#year_area').removeClass('hidden'); // 년도 영역 보이기
	            
	            var license_text = $('#license_select option:selected').text();
	            $('input[type=hidden].license_name').val(license_text);
	            var URL = "${contextPath}/years";
	            URL += "?license_name="+license_text;
	            console.log(URL);
	            
	            $.ajax({ // 선택한 license에 해당하는 year 가져오기 
					type:"get",
	                async:false, 
	                url: URL, // 보내는 경로
	                success:function (data,textStatus){ // data : 성공 후 리턴 받은 데이터
	                	console.log("AjaxReturnYearsJSON");
						var jsonInfo = JSON.parse(data); // json 형태로 다시 파싱
						var txt="<option value=''>------------</option>";

		    	     	for(var i in jsonInfo.years) {
		    	         	var year_date = jsonInfo.years[i].year_date;
		    	         	txt+='<option value="'+year_date+'">'+year_date+'</option>';
		    	   		 }
		    	     	 $('#year_select').html(txt);
		    	   	},
		    	   	error:function(data,textStatus){
						alert("에러가 발생했습니다.");
					}
				});  //end ajax	
			}
	    }
	    
		 /* 년도 재선택시 - 해당하는 과목 목록 가져오기 */
	    function selectYear(){
         $('#subject_area').addClass('hidden');
         $('#timer_area').addClass('hidden');
         $('#btn_area').addClass('hidden');
         $('#hidden_area').find('.quizNums').remove(); // quizNum 삭제
         
	        if($('#year_select').val()!=""){ // 년도 select option "----------"을 선택한 경우가 아닐 때
	            $('#subject_area').removeClass('hidden');
	            $('#timer_area').removeClass('hidden');
	            $('#btn_area').removeClass('hidden');
	            
	            var license_text = $('#license_select option:selected').text(); // 자격증 약어
	            var year_date = $('#year_select option:selected').val(); // yyyy-MM-dd
	            	            
	            var URL =  "${contextPath}/subjects";
	            URL += "?license_name="+license_text;
	            URL += "&year_date="+year_date;
	            
	            console.log(URL);
	            	            
	            $.ajax({ // 선택한 year에 해당하는 subject 가져오기 
					type:"get",
	                async:false, 
	                url:URL, // 보내는 경로
	                success:function (data,textStatus){ // data : 성공 후 리턴 받은 데이터
	                	console.log("AjaxReturnSubjectsJSON");
						var jsonInfo = JSON.parse(data); // json 형태로 다시 파싱
						console.log(jsonInfo);
						
	    	         	var subject_names = jsonInfo.subject.subject_names;
 	     			console.log("과목 이름 "+subject_names);	
	    	         	var subject_quiznums = jsonInfo.subject.subject_quiznums;
 	     			console.log("과목 문제수 "+subject_quiznums);	
	    	         	var subject_total = jsonInfo.subject.subject_total;
	    	         	console.log("총 과목수 "+subject_total);
	    	         	$('.subject_total').val(subject_total);
	    	         	var subject_time = jsonInfo.subject.subject_time;
	    	         	console.log("시험시간 "+subject_time);
	    	         	$('#timer_yes').val(subject_time);
	    	         	
	    	         	var subjectNameArr = subject_names.split("/");
	    	         	var subjectQuizNumArr = subject_quiznums.split("/");
	    	         	
	    	         	var txt=""; // 과목 삽입 변수
						var txtHidden=""; // hidden 영역 과목 문항 수 append 용 변수
			    	    for(var i=1; i<=subject_total; i++) { // 총과목 수 만큼 반복 
			    	    	console.log("과목이름"+subjectNameArr[i-1]);
			    	    	console.log("과목문제수"+subjectQuizNumArr[i-1]);

			    	         	txt+='<li class="subject_li">';
			    	         		txt+='<input id="part'+i+'_check" class="subjects" name="subjects" type="checkbox" value="'+subjectNameArr[i-1]+'" onclick="selectSubject(this);" checked>';
			    	         		txt+='<label for="part'+i+'_check">'+i+'과목 : '+subjectNameArr[i-1]+' ['+subjectQuizNumArr[i-1]+' 문항]</label>';
			    	         	txt+='</li>';
			    	         	txtHidden+='<input type="hidden" class="quizNums" name="quizNumArr" value="'+subjectQuizNumArr[i-1]+'">';
			    	         	
			    	   		 }
			    	    	console.log(txtHidden);
			    	     	 $('.subject_ul').html(txt); // 과목 삽입
			    	     	 $('#hidden_area').append(txtHidden); // 과목 문항 수 hidden 타입으로 삽입

		    	   	},
		    	   	error:function(data,textStatus){
						alert("에러가 발생했습니다.");
					}
				});  //end ajax	
	        }
	    }
 
 	$(document).ready(function(){
 		$('.subjects').click(function(){
 			
 		});
 	});
 	
 
 	function selectSubject(chk){
 		var index = $('.subjects').index(chk);
 		if(chk.checked){
 			$('.quizNums').eq(index).attr( 'disabled', false );
 		} else {
 			$('.quizNums').eq(index).attr( 'disabled', true );
 		}
 	}
 	

 	
    </script>
   
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/header.jsp" flush="false" />
	<!-- //header -->	
    <!--section-->
    <section>
        <!-- lnb -->
        <jsp:include page="/Category/Test/lnb.jsp" flush="false" />
        <!-- //lnb -->
        <!-- content_wrap -->
        <div id="content_wrap">
            <div id="content_title">
                <h3>시험 선택</h3>
                <button class="manual_btn btn manual_item">?</button>
            </div>
            <!-- form -->
            <form id="option_form" name="frm" method="GET" action="${contextPath}/test/takeTest.do">
                <fieldset>
	                <div id="hidden_area" class="hidden">
		        		<input type="hidden" class="license_name" name="license_name" value="">
		        		<input type="hidden" class="subject_total" name="subject_total" value="">
		        	</div>
                	<div id="license_area" class="q_area manual_item">
                		<h4>1. 자격증을 선택해주세요.</h4>
                		<select id="license_select" class="license_select " name="license" onchange="selectlicense();">
                			<option value="">------------</option>
                			<c:forEach var="license"  items="${licensesList}" >
                				<option value="${license.license_abbreviation}">${license.license_name}</option>
                			</c:forEach>
                		</select>
                	</div>
                	<div id="year_area" class="q_area  manual_item">
                        <h4>2. 기출문제를 선택해주세요.</h4>
                        <select id="year_select" class="year_select" name="year"  onchange="selectYear()">
                        </select>
                    </div>
                    <div id="subject_area" class="q_area manual_item">
                        <h4>3. 과목을 선택해주세요.</h4>
                        <ul class="subject_ul">
                        	
                        </ul>
                    </div>
                    <div id="timer_area" class="q_area manual_item">
                        <h4>4. 시간 제한 여부를 선택해주세요.</h4>
                        <ul>
                        	<li>
                        		<input type="radio" id="timer_yes" name="timer" value="150" checked="checked">
								<label for="timer_yes">예</label>
                        	</li>
                        	<li>
                        		<input type="radio" id="timer_no" name="timer" value="">
                        		<label for="timer_no">아니오</label>
                        	</li>
                        </ul>
                    </div>
					<p id="btn_area" class="btn_area manual_item">
						<input type="submit" id="solve_sub" class="btn" value="시험풀기" onclick="return selectCheck();">
					</p>
                </fieldset>
            </form>
            <!-- //option_form -->
        </div>
        <!-- //content_wrap -->
    </section>
    <!--//section-->
    <!-- footer -->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false" />
    <!-- //footer -->
</body>
</html>