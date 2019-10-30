<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
</head>
<body>
    <!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="${contextPath}/index.jsp" title="title"><img src="http://placehold.it/150x70" alt="title"></a>
            </h1>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="gnb">
                    <li class="gnb_list gnb_0">
                        <h2><a href="javascript:;" title="시험안내" class="alert_ready">시험안내</a></h2>
                    </li>
                    <li class="gnb_list gnb_1">
                        <h2><a href="${contextPath}/Member/Lee/buybook.html" title="교재구매">교재구매</a></h2>
                        <ul class="menu">
                            <a href="${contextPath}/Member/Lee/buybook.html" title="구매목록"><li>구매목록</li></a>
                            <a href="${contextPath}/Member/Lee/cart.html" title="장바구니"><li>장바구니</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_2">
                        <h2><a href="${contextPath}/Member/An/testSelect.html" title="문제유형">문제유형</a></h2>
                    </li>
                    <li class="gnb_list gnb_3">
                        <h2><a href="${contextPath}/Member/Nam/Notice_List.html" title="커뮤니티">커뮤니티</a></h2>
                        <ul class="menu">
                            <a href="${contextPath}/Member/Nam/Notice_List.html" title="공지사항"><li>공지사항</li></a>
                            <a href="${contextPath}/Member/Nam/Community_List.html" title="자유 게시판"><li>자유 게시판</li></a>
                            <a href="${contextPath}/Member/Nam/Question_List.html" title="질문 게시판"><li>질문 게시판</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_4">
                        <h2><a href="${contextPath}/Member/Jeong/PrivacyPolicyStatement.html" title="고객센터">고객센터</a></h2>
                        <ul class="menu">
                            <a href="${contextPath}/Member/Jeong/PrivacyPolicyStatement.html" title="개인정보보호정책"><li>개인정보보호정책</li></a>
                            <a href="${contextPath}/Member/Jeong/accessTerms.html" title="이용약관"><li>이용약관</li></a>
                            <a href="${contextPath}/Member/Jeong/sitemap.html" title="사이트맵"><li>사이트맵</li></a>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
                <ul class="on">
                    <li><a href="javascript:;" title="회원가입">회원가입</a></li>
                    <li><a href="javascript:;" title="로그인" class="loginOnOff">로그인</a></li>
                    <li><a href="${contextPath}/Member/Jeong/sitemap.html" title="사이트맵">사이트맵</a></li>
                </ul>
                <ul>
                    <li><a href="${contextPath}/Member/Jeong/mypage.html" title="회원정보">회원정보</a></li>
                    <li><a href="javascript:;" title="로그아웃" class="loginOnOff">로그아웃</a></li>
                    <li><a href="${contextPath}/Member/Jeong/sitemap.html" title="사이트맵">사이트맵</a></li>
                </ul>
            </div>
            <!--//top_menu-->
        </header>
        <!--//main_header-->
    </div>
    <!--//main_header_wrap-->
</body>
</html>