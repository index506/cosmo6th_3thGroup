<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<link rel="stylesheet" href="${contextPath}/css/common.css"/>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>

<link rel="stylesheet" href="${contextPath}/css/completed.css"/>
<script>
     $(function(){
         $('.payButton').click(function(){
             location.href = "../Jeong/mypage.html";
         });

         $('.payButton.left').click(function(){
             location.href = "buybook.html";
         });
     });
</script>

</head>
<body>
<!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="../../index.html" title="title"><img src="${contextPath}/images/main.jpg" alt="title" width="150px" height="70px"></a>
            </h1>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="gnb">
                    <li class="gnb_list gnb_0">
                        <h2><a href="javascript:;" title="시험안내" class="alert_ready">시험안내</a></h2>
                    </li>
                    <li class="gnb_list gnb_1 login">
                        <h2><a href="../../Category/Book/buybook.html" title="교재구매">교재구매</a></h2>
                        <ul class="menu">
                            <a href="../../Category/Book/buybook.html" title="구매목록"><li>구매목록</li></a>
                            <a href="../../Category/Book/cart.html" title="장바구니"><li>장바구니</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_2 login">
                        <h2><a href="../../Category/Test/testSelect.html" title="문제유형">문제유형</a></h2>
                    </li>
                    <li class="gnb_list gnb_3">
                        <h2><a href="../../Category/Board/Notice_List_1.html" title="커뮤니티">커뮤니티</a></h2>
                        <ul class="menu">
                            <a href="../../Category/Board/Notice_List_1.html" title="공지사항"><li>공지사항</li></a>
                            <a href="../../Category/Board/Community_List_1.html" title="자유 게시판"><li>자유 게시판</li></a>
                            <a href="../../Category/Board/Question_List_1.html" title="질문 게시판"><li>질문 게시판</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_4">
                        <h2><a href="../../Category/Service/PrivacyPolicyStatement.html" title="고객센터">고객센터</a></h2>
                        <ul class="menu">
                            <a href="../../Category/Service/PrivacyPolicyStatement.html" title="개인정보보호정책"><li>개인정보보호정책</li></a>
                            <a href="../../Category/Service/accessTerms.html" title="이용약관"><li>이용약관</li></a>
                            <a href="../../Category/Service/sitemap.html" title="사이트맵"><li>사이트맵</li></a>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
                <ul class="on">
                    <li><a href="../../Category/Member/signup.html" title="회원가입">회원가입</a></li>
                    <li><a href="javascript:;" title="로그인" class="loginOnOff">로그인</a></li>
                    <li><a href="../../Category/Service/sitemap.html" title="사이트맵">사이트맵</a></li>
                </ul>
                <ul>
                    <li><a href="../../Category/Member/mypage.html" title="회원정보">회원정보</a></li>
                    <li><a href="javascript:;" title="로그아웃" class="loginOnOff">로그아웃</a></li>
                    <li><a href="../../Category/Service/sitemap.html" title="사이트맵">사이트맵</a></li>
                </ul>
            </div>
            <!--//top_menu-->
        </header>
        <!--//main_header-->
    </div>
    <!--//main_header_wrap-->

    <!-- wrap -->
    <div id="wrap">
        <!-- processWrap -->
        <div class="processWrap">
            <p class="process">주문완료&nbsp;</p>
            <p class="process">주문결제 >&nbsp;</p>
            <p class="process">장바구니 >&nbsp;</p>
        </div>
        <!-- //processWrap -->
        <!-- lnb -->
        <div class="lnb">
            <div>
                <img class="top" src="${contextPath}/images/untitled.png" />
                <ul>
                    <a href="./index.html">
                        <li>교재구매</li>
                    </a>
                    <a href="#">
                        <li>구매내역</li>
                    </a>
                </ul>
                <img class="bottom" src="${contextPath}/images/left_t08.gif" />
            </div>
        </div>
        <!-- //lnb -->

        <!-- shipping -->
        <div id="shipping">
            <!-- title1 -->
            <h2 id="title">배송지정보</h2>
            <!-- //title1 -->

            <!-- innerWrap -->
            <div id="innerWrap1">
                <table id="table1" cellspacing="0" width="100%">
                    <tr>
                        <th>받는사람 이름</th>
                        <td>테스트</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                            <p>010-1234-5678</p>
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <p>테스트</p>
                        </td>
                    </tr>
                    <tr>
                        <th>배송시 요청사항</th>
                        <td>
                            <p></p>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- //innerWrap1 -->
        </div>
        <!-- //shipping -->

        <!-- payment -->
        <div id="payment">
            <!-- title2 -->
            <h2 id="title">결제정보</h2>
            <!-- //title2 -->

            <!-- innerWrap2 -->
            <div id="innerWrap2">
                <table id="table2" cellspacing="0" width="100%">
                    <tr>
                        <th>결제수단</th>
                        <td>
                            <div class="deposit">무통장입금</div><br>
                            <span><b>기업은행</b>&nbsp;112-562-876312</span>
                        </td>
                    </tr>
                    <tr>
                        <th>결제금액</th>
                        <td>
                            <strong>22,500원</strong>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- //innerWrap2 -->
        </div>
        <!-- //payment -->

        <div class="payButton left">쇼핑 계속하기</div>
        <div class="payButton">구매내역 확인</div>

    </div>
    <!-- //wrap -->


    <!--main_footer-->
    <footer id="main_footer">
        <img src="${contextPath}/images/bottom_long_bar.gif">
        <ul>
            <li><a href="../../Category/Service/accessTerms.html"  title="이용약관"><img src="${contextPath}/images/footer_menu_2.gif" alt="이용약관"/></a></li><li>|</li>
            <li><a href="#" class="alert_ready"><img src="${contextPath}/images/footer_menu_4.gif" alt="이메일주소무단수집거부"/></a></li><li>|</li>
            <li><a href="#" class="alert_ready"><img src="${contextPath}/images/footer_menu_5.gif" alt="Contact us"/></a></li><li>|</li>
            <li><a href="../../Category/Service/PrivacyPolicyStatement.html" title="개인정보취급방침"><img src="${contextPath}/images/footer_menu_3.gif" alt="개인정보취급방침"/></a></li><li>|</li>
            <li><a href="../../Category/Service/sitemap.html" title="사이트맵"><img src="${contextPath}/images/footer_menu_6.gif" alt="사이트맵"/></a></li>
        </ul>
        <hr/>
    </footer>
    <!--//main_footer-->
</body>
</html>