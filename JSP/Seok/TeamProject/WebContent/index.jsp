<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- jstl을 사용하기 위한 디렉티브 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> <!-- context경로를 변수에 담음 여기서는 /Project09 -->
<%
    request.setCharacterEncoding("UTF-8"); //요청 받아온 글자 깨지지 안도록 UTF-8설정
%>
<!DOCTYPE html>
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
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="${contextPath}/index.html" title="title"><img src="http://placehold.it/150x70" alt="title"></a>
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
            <a href="${contextPath}/Member/Yoo/signUp.html" title="assign"><div class="assign">회원가입</div></a>
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
    <footer id="main_footer">
        <img src="${contextPath}/images/bottom_long_bar.gif">
        <ul>
            <li><a href="${contextPath}/Member/Jeong/accessTerms.html"  title="이용약관"><img src="${contextPath}/images/footer_menu_2.gif" alt="이용약관"/></a></li><li>|</li>
            <li><a href="${contextPath}/Member/Jeong/PrivacyPolicyStatement.html" title="개인정보취급방침"><img src="${contextPath}/images/footer_menu_3.gif" alt="개인정보취급방침"/></a></li><li>|</li>
            <li><a href="#" class="alert_ready"><img src="${contextPath}/images/footer_menu_4.gif" alt="이메일주소무단수집거부"/></a></li><li>|</li>
            <li><a href="#" class="alert_ready"><img src="${contextPath}/images/footer_menu_5.gif" alt="Contact us"/></a></li><li>|</li>
            <li><a href="${contextPath}/Member/Jeong/sitemap.html" title="사이트맵"><img src="${contextPath}/images/footer_menu_6.gif" alt="사이트맵"/></a></li>
        </ul>
        <hr/>
    </footer>
    <!--//main_footer-->
</body>
</html>