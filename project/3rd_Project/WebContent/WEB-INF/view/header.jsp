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
</head>
<body>
    <!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="../main/main.do" title="title"><img src="${contextPath}/images/main.jpg" alt="title" width="150px" height="70px"></a>
            </h1>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="gnb">
                    <li class="gnb_list gnb_0">
                        <h2><a href="javascript:;" title="시험안내" class="alert_ready">시험안내</a></h2>
                    </li>
                    <li class="gnb_list gnb_1">
	                    <c:choose>
							<c:when test="${isLogon}">
		                   		<h2><a href="../book/buybook.do" title="교재구매">교재구매</a></h2>
		                        <ul class="menu">
		                           	<li><a href="../book/buybook.do" title="구매목록">구매목록</a></li>
		                           	<li><a href="../book/cart.do" title="장바구니">장바구니</a></li>
		                        </ul>
			                </c:when>
			                <c:otherwise>    
		                   		<h2><a href="javascript:logoff();" title="교재구매">교재구매</a></h2>
		                        <ul class="menu">
		                           	<li><a href="javascript:logoff();" title="구매목록">구매목록</a></li>
		                           	<li><a href="javascript:logoff();" title="장바구니">장바구니</a></li>
		                        </ul>
	                    	</c:otherwise>
	                    </c:choose>
                    </li>
                    <li class="gnb_list gnb_2">
                    	<c:choose>
							<c:when test="${isLogon}">
		                    	<h2><a href="../test/checkLog.do" title="문제유형">문제유형</a></h2>
		                	</c:when>
		                	<c:otherwise>
		                   		<h2><a href="javascript:logoff();" title="문제유형">문제유형</a></h2>
                    		</c:otherwise>
                    	</c:choose>
                    </li>
                    <li class="gnb_list gnb_3">
                        <h2><a href="../board/noticeList.do" title="커뮤니티">커뮤니티</a></h2>
                        <ul class="menu">
                            <li><a href="../board/noticeList.do" title="공지사항">공지사항</a></li>
                            <li><a href="../board/communityList.do" title="자유 게시판">자유 게시판</a></li>
                            <li><a href="../board/questionList.do" title="질문 게시판">질문 게시판</a></li>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_4">
                        <h2><a href="../form/pps_form.do" title="고객센터">고객센터</a></h2>
                        <ul class="menu">
                            <li><a href="../form/pps_form.do" title="개인정보보호정책">개인정보보호정책</a></li>
                            <li><a href="../form/accessTerms_form.do" title="이용약관">이용약관</a></li>
                            <li><a href="../form/sitemap_form.do" title="사이트맵">사이트맵</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
            	<ul>
	            	<c:choose>
						<c:when test="${isLogon}">
	                    	<li><a href="../mypage/mypage.do" title="회원정보">회원정보</a></li>
		                    <li><a href="../logout/logout.do" title="로그아웃" onclick="submit();">로그아웃</a></li>
	                	</c:when>
	                	<c:otherwise>
	                   		<li><a href="../form/signup_form.do" title="회원가입">회원가입</a></li>
			               	<li><a href="../form/login_form.do" title="로그인">로그인</a></li>
	                  	</c:otherwise>
	              	</c:choose>
	              	<li><a href="../form/sitemap_form.do" title="사이트맵">사이트맵</a></li>
            	</ul>
            </div>
            <!--//top_menu-->
        </header>
        <!--//main_header-->
    </div>
    <!--//main_header_wrap-->
</body>
</html>