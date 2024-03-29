<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사이트맵</title>
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>

    <link rel="stylesheet" href="${contextPath}/Category/Service/css/style.css"/>
</head>
<body>
    <!--main_header_wrap-->
    <jsp:include page="/WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    <!--section-->
    <section>
        <jsp:include page="/WEB-INF/view/sideService.jsp" flush="false"/>
        <div id="sitemap" class="content"> 
            <img src="${contextPath}/images/image_support/tit23.gif"/>
            <div>
                <ul>
                    <li><a href="#" class="alert_ready">시험안내</a></li>
                </ul>
                <c:choose>
              		<c:when test="${isLogon}">
		                <ul>
		                    <li><a href="../book/buybook.do">교재구매목록</a></li>
		                    <li><a href="../book/cart.do">장바구니</a></li>
		                </ul>
		                <ul>
		                    <li><a href="../test/checkLog.do">문제유형</a></li>
		                </ul>
	                </c:when>
	                <c:otherwise>
	                	<ul>
		                    <li><a href="javascript:logoff();">교재구매목록</a></li>
		                    <li><a href="javascript:logoff();">장바구니</a></li>
		                </ul>
		                <ul>
		                    <li><a href="javascript:logoff();">문제유형</a></li>
		                </ul>
	                </c:otherwise>
                </c:choose>
                <ul>
                    <li><a href="../board/noticeList.do">공지사항</a></li>
                    <li><a href="../board/communityList.do">자유 게시판</a></li>
                    <li><a href="../board/questionList.do">질문 게시판</a></li>
                </ul>
                <ul>
                    <li><a href="../form/pps_form.do">개인정보보호정책</a></li>
                    <li><a href="../form/accessTerms_form.do">이용약관</a></li>
                    <li><a href="../form/sitemap_form.do">사이트맵</a></li>
                </ul>
            </div>
        </div>
    </section>
    <!--//section-->
    <!--main_footer-->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->
</body>
</html>