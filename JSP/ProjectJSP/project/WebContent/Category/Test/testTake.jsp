<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String[] subjects = request.getParameterValues("subjects");
	request.setCharacterEncoding("utf-8");
%>
<c:set var="subjects" value="<%=subjects %>" />

<%
	String[] QuizNumArr = request.getParameterValues("quizNumArr");
	int len = QuizNumArr.length;
	int[] startNum = new int[len];
	int[] endNum = new int[len];
	for(int i=0; i<len; i++){
		String[] subjectStartEndNum = QuizNumArr[i].split("~");
		startNum[i] = Integer.parseInt(subjectStartEndNum[0]); 
		endNum[i] = Integer.parseInt(subjectStartEndNum[1]);
		System.out.println((i+1)+"번쨰 : "+startNum[i]+" , "+endNum[i]);
	}
%>
<c:set var="startNum" value="<%=startNum %>" />
<c:set var="endNum" value="<%=endNum %>" />
<c:set var="quizList" value="${quizList}" scope="request" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>문제 풀기</title>
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
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/take-result.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/takeTest.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/manual.css" />

    <script src="${contextPath}/Category/Test/js/take-result.js"></script>
    <script src="${contextPath}/Category/Test/js/testTake.js"></script>
    <script src="${contextPath}/Category/Test/js/manual.js"></script>
    <script>
    

    $(document).ready(function(){
    	
    // start of 남은 시간
            if(${ param.timer > 0}){
            	/* 타이머 초기화 & 삽입 */
            	 var testTimeMin = ${param.timer}; // DB에서 분 단위로 시험시간 받아오기
                 var hour = parseInt(testTimeMin/60); // 시간단위 : 시간으로 나눈 몫
                 var min = testTimeMin%60; // 분단위 : 시간으로 나눈 나머지
                 var sec = 0; // 초단위 : 초기값은 0
                 
                 timeTextWrite(hour,min,sec); // hh:mm:ss 형식으로 페이지에 삽입

                 /* 타이머 기능 */
                 var timer=setInterval(function(){ // 시험 타이머
                     if(--sec<0) { sec=59; // 초가 0보다 작아지면 59로 초기화
                         if(--min<0){ min=59; // 분이 0보다 작아지면 59로 초기화
                             if(--hour<0){ // 시가 0보다 작아지면 종료
                                 alert("시험이 종료되었습니다.");
                                 $('#save.btn').trigger("click");
                                 //location.href="./testResult.html";
                             } // end of if(hour)
                         } // end of if(min)
                     } // end of if(sec)      
                     timeTextWrite(hour,min,sec);  // hh:mm:ss 형식으로 페이지에 삽입
                 }, 1000); // end of timer

                 // hh:mm:ss 형식으로 페이지에 삽입
                 function timeTextWrite(hour, min, sec){
                     $('.timer').val(zeroConcat(hour)+":"+zeroConcat(min)+":"+zeroConcat(sec)); // HH:MM:SS or 0H:0M:0S
                 } // end of timeTextWrite()

                 // 시,분,초 가 1~9이면 앞에 0 붙이기
                 function zeroConcat(time){
                     if(time<10) time="0"+time; // 0~9는 앞에 0 붙임 => 0H, 0M, 0S
                     return time;
                 } // end of zeroConcat()

            } // end of if(${ param.timer > 0 })
 //  end of 남은시간
 
    });


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
                <h3>시험 풀기</h3>
                <button class="manual_btn btn manual_item">?</button>
            </div>
            <!-- quiz_form -->
            <form id="quiz_form" action="${contextPath}/test/resultTest.do">
                <!-- fieldset -->
                <fieldset>
                    <legend class="hidden">
                        문제 풀기
                    </legend>
                    <!-- info_area -->
                    <div id="info_area">
                        <div>
                            <span>${param.license_name}</span> - <span>${param.year}</span>
                        </div>
                        <c:if test="${param.timer > 0}">
	                        <div class="time manual_item">
	                            <span>남은시간 - </span><input type="text" class="timer" name="timer" value="" readonly>
	                        </div>
                        </c:if>
                    </div>
                    <!-- //info_area -->
                    <!-- content_area -->
                    <div id="content_area">
                    	<c:forEach var="quiz"  items="${quizList}" varStatus="quizNo">
                    		<div id="quiz_box_${quizNo.count}" class="quiz_box">
                    			<ul>
                    				<li><div>${quiz.test_title}</div></li>
                    				<c:if test="${quiz.test_imageSrc!=null}">
                    					<li>
                    						<img src="${contextPath}/Category/Test/images/quizImageFolder/${quiz.test_imageSrc}">
                    					<li>
                    				</c:if>
                    				<li>
                    					<input id="answer${quizNo.count}_1" class="answer" type="radio" name="${quiz.test_num}" value="1"/>
                    					<label for="answer${quizNo.count}_1">${quiz.test_1} </label>
                    				</li>
                    				<li>
                    					<input id="answer${quizNo.count}_2" class="answer" type="radio" name="${quiz.test_num}" value="2"/>
                    					<label for="answer${quizNo.count}_2">${quiz.test_2} </label>
                    				</li>
                    				<li>
                    					<input id="answer${quizNo.count}_3" class="answer" type="radio" name="${quiz.test_num}" value="3"/>
                    					<label for="answer${quizNo.count}_3">${quiz.test_3} </label>
                    				</li>
                    				<li>
                    					<input id="answer${quizNo.count}_4" class="answer" type="radio" name="${quiz.test_num}" value="4"/>
                    					<label for="answer${quizNo.count}_4">${quiz.test_4} </label>
                    				</li>
                    			</ul>
                    		</div>
                    	</c:forEach>
                    </div>
                    <!-- //content_area -->
                    <!-- move_area -->
                    <div id="move_area" class="q_area manual_item">
                        <div id="gbtn">
                        	<c:set var="cnt" value="1"/>
                        	<c:forEach var="sub" items="${subjects}" varStatus="v1">
                        		<div class="subject_box">${sub}</div>
                        		<c:forEach var="j" begin="${startNum[v1.index]}" end="${endNum[v1.index]}" step="1"  varStatus="v2">
                        			<input type="button" class="go_btn" value="${j}" id="gbtn${j}" name="${cnt}">
                        			<c:if test="${j%5==0}"><br></c:if>
                        			<c:set var="cnt" value="${cnt+1}"/>
                        		</c:forEach>	
                        	</c:forEach>						      
                        </div>
                        <!-- btn_area2 -->
                        <p id="btn_area2" class="btn_area">
                            <span id="prev" class="btn left-btn  manual_item">◀ 이전</span>
                            <span id="next" class="btn right-btn">다음 ▶</span>
                        </p>
                        <!-- //btn_area2 -->
                    </div>
                    <!-- //move_area -->
                    <div id="btn_area1" class="btn_area">
                        <input type="submit" id="save" class="btn" value="제출">
                       	<input type="button" class="btn" value="시험 재선택" onclick="location.href='${contextPath}/test/selectTest.do'" >
                    </div>
                </fieldset>
                <!-- //fieldset -->
            </form>
            <!-- //quiz_form -->
        </div>
        <!-- //content_wrap -->
    </section>
    <!--//section-->
    <!-- footer -->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false" />
    <!-- //footer -->
</body>
</html>