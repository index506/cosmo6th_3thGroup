<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Main Page</title>
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${contextPath}/css/main.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${contextPath}/js/main.js"></script>
</head>
<body>
	<!--main_header_wrap-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
    <!--//main_header_wrap-->
    <!--main_image-->
    <div id="main_image">
        <img src="${contextPath}/images/main_BtnL.png" alt="left" class="left_Btn">
        <img src="${contextPath}/images/main_BtnR.png" alt="right" class="right_Btn">
        <div class="book_image">
            <ul>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_01.jpg" alt="book_1"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_02.jpg" alt="book_2"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_03.jpg" alt="book_3"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_04.jpg" alt="book_4"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_05.jpg" alt="book_5"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_06.jpg" alt="book_6"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_07.jpg" alt="book_7"></li>
                <li><img src="${contextPath}/Member/Lee/images/buybook/img_book_08.jpg" alt="book_8"></li>
            </ul>
        </div> 
    </div>
    <!--//main_image-->
    <!--main_first_section-->
    <section id="main_first_section">
        <!--main_login-->
        <div id="main_login">
            <a href="${contextPath}/Member/Seok/login_main.html" title="login"><div class="login">로그인</div></a>
            <a href="${contextPath}/Member/Yoo/MembershipJoin.jsp" title="assign"><div class="assign">회원가입</div></a>
        </div>
        <!--//main_login-->
        <!--main_table-->
        <div id="main_table">
            <ul class="row first">
                <li class="item_0">마감일</li>
                <li class="item_1">접수기간</li>
                <li class="item_2">시험일</li>
                <li class="item_3">성적발표일</li>
            </ul>
            <ul class="line"></ul>
            <ul class="row second">
                <li class="item_0">D-0</li>
                <li class="item_1">2019-11-11(월)~2019-11-13(수)</li>
                <li class="item_2">2019-12-23(월)</li>
                <li class="item_3">2019-12-30(월)</li>
            </ul>
        </div>
        <!--//main_table-->
    </section>
    <!--//main_first_section-->
    <!--main_second_section-->
    <section id="main_second_section">
        <article class="link">
            <ul>
                <li><a href="javascript:;" class="alert_ready" title="시험안내"><img src="${contextPath}/images/main_img_01.jpg" alt="시험안내"/></a></li>
                <li><a href="${contextPath}/Member/An/testSelect.html" title="문제유형"><img src="${contextPath}/images/main_img_02.jpg" alt="문제유형"/></a></li>
                <li><a href="${contextPath}/Member/Lee/buybook.html" title="교재구매"><img src="${contextPath}/images/main_img_03.jpg" alt="교재구매"/></a></li>
                <li><a href="${contextPath}/Member/Nam/Question_List.html" title="질문 게시판"><img src="${contextPath}/images/main_img_04.jpg" alt="질문 게시판"/></a></li>
            </ul>
        </article>
    </section>
    <!--//main_second_section-->
    <!--main_third_section-->
    <section id="main_third_section">
        <article class="notice">
            <h2 class="title">공지사항<a href="${contextPath}/Member/Nam/Notice_List.html" title="공지사항">더보기</a></h2>
            <ul class="list">
                <a href="${contextPath}/Member/An/postRead.html"><li>아아아아<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>아미낭<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>다ㅣ람나<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>알르라판<span>2019-04-10</span></li></a>
            </ul>
        </article> 
        <article class="notice">
            <h2 class="title">자유 게시판<a href="${contextPath}/Member/Nam/Community_List.html" title="자유 게시판">더보기</a></h2>
            <ul class="list">
                <a href="${contextPath}/Member/An/postRead.html"><li>아아아아<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>아미낭<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>다ㅣ람나<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>알르라판<span>2019-04-10</span></li></a>
            </ul>
        </article> 
        <article class="notice">
            <h2 class="title">질문 게시판<a href="${contextPath}/Member/Nam/Question_List.html" title="질문 게시판">더보기</a></h2>
            <ul class="list">
                <a href="${contextPath}/Member/An/postRead.html"><li>아아아아<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>아미낭<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>다ㅣ람나<span>2019-04-10</span></li></a>
                <a href="${contextPath}/Member/An/postRead.html"><li>알르라판<span>2019-04-10</span></li></a>
            </ul>
        </article> 
    </section>
    <!--//main_third_section-->
    <!--main_footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
    <!--//main_footer-->
</body>
</html>