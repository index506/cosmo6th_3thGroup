<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>header</title>
<script>
	function logout(){
		alert("로그아웃 되었습니다.");
		window.open("${contextPath}/login/logout.do","_self","toolbar=no");
	}
	function logoff(){
		alert("로그인 후 이용가능합니다.");
	}
</script>
</head>
<body>
    <!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="${contextPath}/board/main.do" title="title"><img src="${contextPath}/images/main.jpg" alt="title" width="150px" height="70px"></a>
            </h1>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="gnb">
                    <li class="gnb_list gnb_0">
                        <h2><a href="javascript:;" title="시험안내" class="alert_ready">시험안내</a></h2>
                    </li>
                    <li class="gnb_list gnb_1">
                    	<c:if test='${isLogon}'>
                    		<h2><a href="${contextPath}/Category/Book/buybook.jsp" title="교재구매">교재구매</a></h2>
                    	</c:if>
                    	<c:if test="${empty isLogon}">
                    		<h2><a href="javascript:logoff();" title="교재구매">교재구매</a></h2>
                    	</c:if>
                        <ul class="menu">
                        	<c:if test='${isLogon}'>
                            	<li><a href="${contextPath}/Category/Book/buybook.jsp" title="구매목록">구매목록</a></li>
                            	<li><a href="${contextPath}/Category/Book/cart.jsp" title="장바구니">장바구니</a></li>
                            </c:if>
                            <c:if test="${empty isLogon}">
                            	<li><a href="javascript:logoff();" title="구매목록">구매목록</a></li>
                            	<li><a href="javascript:logoff();" title="장바구니">장바구니</a></li>
                            </c:if>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_2">
	                    <c:if test='${isLogon}'>
                    		<h2><a href="${contextPath}/Category/Test/testSelect.jsp" title="문제유형">문제유형</a></h2>
                    	</c:if>
                    	<c:if test="${empty isLogon}">
                    		<h2><a href="javascript:logoff();" title="문제유형">문제유형</a></h2>
                    	</c:if>
                    </li>
                    <li class="gnb_list gnb_3">
                        <h2><a href="${contextPath}/Category/Board/Notice_List.jsp" title="커뮤니티">커뮤니티</a></h2>
                        <ul class="menu">
                            <li><a href="${contextPath}/Category/Board/Notice_List.jsp" title="공지사항">공지사항</a></li>
                            <li><a href="${contextPath}/Category/Board/Community_List.jsp" title="자유 게시판">자유 게시판</a></li>
                            <li><a href="${contextPath}/Category/Board/Question_List.jsp" title="질문 게시판">질문 게시판</a></li>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_4">
                        <h2><a href="${contextPath}/Category/Service/privacyPolicyStatement.jsp" title="고객센터">고객센터</a></h2>
                        <ul class="menu">
                            <li><a href="${contextPath}/Category/Service/privacyPolicyStatement.jsp" title="개인정보보호정책">개인정보보호정책</a></li>
                            <li><a href="${contextPath}/Category/Service/accessTerms.jsp" title="이용약관">이용약관</a></li>
                            <li><a href="${contextPath}/Category/Service/sitemap.jsp" title="사이트맵">사이트맵</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
           		<c:if test="${empty isLogon}">
           			<ul>
		               	<li><a href="${contextPath}/Category/Member/signup.jsp" title="회원가입">회원가입</a></li>
		               	<li><a href="${contextPath}/Category/Member/login_main.jsp" title="로그인">로그인</a></li>
		               	<li><a href="${contextPath}/Category/Service/sitemap.jsp" title="사이트맵">사이트맵</a></li>
	               	</ul>
           		</c:if>
           		<c:if test="${isLogon}">
           			<ul>
	                    <li><a href="${contextPath}/Category/Member/mypage.jsp" title="회원정보">회원정보</a></li>
	                    <li>
	                    	<a href="javascript:logout();" title="로그아웃" onclick="submit();">로그아웃</a>
	                    </li>
	                    <li><a href="${contextPath}/Category/Service/sitemap.jsp" title="사이트맵">사이트맵</a></li>
	                </ul>
           		</c:if>
            </div>
            <!--//top_menu-->
        </header>
        <!--//main_header-->
    </div>
    <!--//main_header_wrap-->
</body>
</html>