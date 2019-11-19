<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/testExplanations.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Test/css/test/manual.css" />


    <script src="${contextPath}/Category/Test/js/testCommonData.js"></script>
<!--     <script src="${contextPath}/Category/Test/js/take-result.js"></script> -->
    <script src="${contextPath}/Category/Test/js/testExplanations.js"></script>
    <script src="${contextPath}/Category/Test/js/manual.js"></script>
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
                <h3>시험 해설</h3>
                <button class="manual_btn btn manual_item">?</button>
            </div>
            <!-- quiz_form -->
            <form id="quiz_form" action="testResult.html">
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
                        <!-- quiz_area -->
                        <div id="quiz_area">
                            
                        </div>
                        <!-- //quiz_area -->
                    </div>
                    <!-- //content_area -->
                    <!-- move_area -->
                    <div id="move_area" class="q_area manual_item">
                        <div id="gbtn">
                        </div>
                        <!-- btn_area2 -->
                        <p id="btn_area2" class="btn_area">
                            <span id="prev" class="btn left-btn manual_item">◀ 이전</span>
                            <span id="next" class="btn right-btn">다음 ▶</span>
                        </p>
                        <!-- //btn_area2 -->
                    </div>
                    <!-- //move_area -->
                    <!-- btn_area1 -->
                    <div id="btn_area1" class="btn_area">
                        <input type="button" class="btn" value="결과보기" onclick="history.back();" >  
                        <input type="button" class="btn" value="시험 재선택" onclick="location.href='${contextPath}/test/selectTest.do'" >           
                    </div>
                    <!-- //btn_area1 -->
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