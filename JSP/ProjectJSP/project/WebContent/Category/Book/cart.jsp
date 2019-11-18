<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<link rel="stylesheet" href="${contextPath}/css/cart.css" />
<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<link rel="stylesheet" href="${contextPath}/css/common.css"/>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>
<script>
        // addComma() : 숫자 타입값을 매개변수로 받아 콤마를 추가하여 문자열로 반환해주는 함수
        function addComma(num) {
            var regexp = /\B(?=(\d{3})+(?!\d))/g;
            return num.toString().replace(regexp, ',');
        }

        $(function () {

            // 페이지 출력시 판매가,할인가,합계를 최초입력
            // addComma() : 숫자 타입값을 매개변수로 받아 콤마를 추가하여 문자열로 반환해주는 함수
            $('span.price').each(function () {
                var value = $(this).text();
                $(this).text(addComma(Number(value)));
            });

            // 장바구니 [수량] 변경 시, 1보다 작은 값을 입력하면 alert(알림창)
            $('.inputNumber').on("change keyup paste", function () {
                var value = $(this).val();
                 // window.event.keyCode == 13 : 엔터(Enter)
                if (value != "" && value < 1)  {
                    alert("최소 구매수량은 1개입니다.");
                    $(this).val("1").focus();
                } else if (value != "" && value > 999){
                    alert("최대 구매수량은 999개입니다.");
                    $(this).val("999").focus();
                } else if (value != "" && window.event.keyCode == 13) {
                    $('.amtModify').click();
                    $('.inputNumber').blur();
                } else if (value == "" && window.event.keyCode == 13) {
                    alert("최소 구매수량은 1개입니다.");
                    $(this).val("1").focus();
                }
            });


            // 장바구니 [수량] 공백일 때, alert(알림창)
            $('.inputNumber').blur(function () {
                var value = $(this).val();
                if (value == "") {
                    alert("최소 구매수량은 1개입니다.");
                    $(this).val("1").focus();
                }
            });

            // [수정] 버튼 클릭 시, alert(알림창)
            $('.amtModify').click(function () {
                var price = Number($('span.price:eq(1)').text().replace(",", ""));
                var aftPrice = price * $('.inputNumber').val();
                var amountSpan = $('span.price:eq(2)');
                amountSpan.text(addComma(aftPrice));
                alert("변경되었습니다.");
            });

            // [삭제] 버튼 클릭 시
            $('.deleteBtn').click(function () {
                var row = $(this).parent().parent();
                if (confirm("삭제하시겠습니까?"))
                    row.remove();
            });

            // [결제하기] 버튼 클릭 시
            $('.pay').click(function () {
                var length = $('#table tr').length;
                console.log(length);
                if (length > 1) {
                    if (confirm("주문결제 페이지로 이동하시겠습니까?"))
                        location.href = "order.html";
                } else
                    alert("장바구니에 상품이 없습니다.");
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
        <div class="processWrap">
            <p class="process">주문완료&nbsp;</p>
            <p class="process">주문결제 >&nbsp;</p>
            <p class="process">장바구니 >&nbsp;</p>
        </div>
        <!-- lnb -->
        <div class="lnb">
            <div>
                <img class="top" src="${contextPath}/images/untitled.png"/>
                <ul>
                    <a href="../../Category/Book/buybook.html">
                        <li>구매목록</li>
                    </a>
                    <a href="#">
                        <li style="color:rgb(38, 130, 187);">장바구니</li>
                    </a>
                </ul>
                <img class="bottom" src="${contextPath}/images/left_t08.gif" />
            </div>
        </div>
        <!-- //lnb -->

        <!-- orderSheet -->
        <h2 id="orderSheet">주문서</h2>
        <!-- //orderSheet -->

        <!-- innerWrap -->
        <div id="innerWrap">
            <!-- table -->
            <table id="table" border="1px" cellspacing="0">
                <tr>
                    <th>상품명</th>
                    <th>판매가</th>
                    <th>할인가</th>
                    <th width="13.8%">수량</th>
                    <th>합계</th>
                    <th>삭제</th>
                </tr>
                <tr>
                    <td>정보처리기사 필기(ALL-PASS)</td>
                    <td>
                        <span class="price">25000</span>원
                    </td>
                    <td>
                        <span class="price">22500</span>원
                    </td>
                    <td>
                        <input type="number" class="inputNumber" value="1">
                        <img src="${contextPath}/images/icn_modify.gif" class="amtModify" />
                    </td>
                    <td>
                        <span class="price">22500</span>원
                    </td>
                    <td>
                        <span style="color: black;" class="deleteBtn">X</span>
                    </td>
                </tr>
            </table>
            <!-- //table -->
            <a href="#" class="pay button">결제하기</a>
            <a href="#" class="back button" onclick="history.back();">구매목록</a>
        </div>
        <!-- //innerWrap -->
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