<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
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
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/testResult.css" />

    <script src="${contextPath}/Category/Test/js/jquery-2.1.1.min.js"></script>
    <script src="${contextPath}/Category/Test/js/take-result.js"></script>
    <script src="${contextPath}/Category/Test/js/testResult.js"></script>
</head>

<body>
   	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<!-- //header -->	
    <!--section-->
    <section>
        <!-- lnb -->
        <jsp:include page="/Category/Test/lnb.jsp" flush="false" />
        <!-- //lnb -->
 
        <div id="content_wrap">
            <div id="content_title">
                <h3>시험 결과</h3>
            </div>
            <!-- quiz_form -->
            <form id="quiz_form" action="${contextPath}/test/explanationsTest.do">
                <!-- fieldset -->
                <fieldset>
                    <legend class="hidden">
                        문제 풀기
                    </legend>
                    <!-- info_area -->
                    <div id="info_area">
                        <div>
                            <span>정보처리기사 - </span><span>2019년 03월 03일</span>
                        </div>
                        <div>
                            <span>남은시간 - </span><span>01:15:33</span>
                        </div>
                    </div>
                    <!-- //info_area -->
                    <!-- content_area -->
                    <div id="content_area">
                        <ul>
                            <li>[맞은 개수] </li>
                            <li>1과목: 19/20</li>
                            <li>2과목: 12/20</li>
                            <li>3과목: 15/20</li>
                            <li>4과목: 14/20</li>
                            <li>5과목: 16/20</li>
                            <li>총합: 86/100</li>
                        </ul>
                        <c:forEach var="aaa" items="${quizList}">
                        	${aaa.title}
                        </c:forEach>
                        <!-- btn_area2 -->
                        <p id="btn_area2" class="btn_area">
                            <input type="submit" id="save" class="btn" value="해설보기">
                            <input type="button" class="btn" value="시험 재선택" onclick="location.href='${contextPath}/test/selectTest.do'" >
                        </p>
                        <!-- //btn_area2 -->
                    </div>
                    <!-- //move_area -->
                </fieldset>
                <!-- //fieldset -->
            </form>
            <!-- //quiz_form -->
        </div>
        <!-- //content_wrap -->
    </section>
    <!--//section-->

   	<!-- footer -->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
    <!-- //footer -->
</body>
</html>