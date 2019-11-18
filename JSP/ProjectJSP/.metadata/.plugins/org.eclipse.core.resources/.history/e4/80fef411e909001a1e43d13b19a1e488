<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교재구매</title>
<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<link rel="stylesheet" href="${contextPath}/css/common.css"/>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>

<link rel="stylesheet" href="${contextPath}/css/buybook.css"/>
<script>
        $(function () {

            // 교재구매 [수량] 공백일 때, alert(경고창)
            $('input[type=number]').blur(function () {
                var value = $(this).val();
                if (value == "") {
                    alert("최소 구매수량은 1개입니다.");
                    $(this).val("1").focus();
                }
            });

            // 교재구매 [수량] 변경 시, 1보다 작은 값을 입력하면 alert(경고창)
            $('input[type=number]').on("change keyup paste", function () {
                var value = $(this).val();
                if(value != "" && value < 1 ){
                    alert("최소 구매수량은 1개입니다.");
                    $(this).val("1").focus();
                } 
                else if (value != "" && value > 999){
                    alert("최대 구매수량은 999개입니다.");
                    $(this).val("999").focus();
                }
                else if (window.event.keyCode == 13 && value != "") {
                    $(this).parent().parent().next().click();
                }
                else if (window.event.keyCode == 13 && value == ""){
                    alert("최소 구매수량은 1개입니다.");
                    $(this).val("1").focus();
                }
            });

            // [장바구니 담기] 클릭 시, confirm(확인/취소)
            $('.buyBox').click(function(){
                var amount = $(this).prev().find('input[type=number]').val();
                console.log(amount);
                var answer = confirm("선택하신 상품이 장바구니에 담겼습니다." + '\n' +"장바구니로 이동하시겠습니까?");
                if(answer)
                    location.href = 'cart.html';
            });

            // [장바구니 >>] 클릭 시, confirm(확인/취소)
            $('.buyButton').click(function(){
            var answer = confirm("장바구니로 이동하시겠습니까?");
                if(answer)    
                    location.href = 'cart.html';
            });
        });
</script>
<script>
	function confirmCart(){ // 장바구니에 교재가 이미 있는지 확인하는 메소드
		alert("click")
	};
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

        <!-- lnb -->
        <div class="lnb">
            <div>
                <img class="top" src="${contextPath}/images/untitled.png" />
                <ul>
                    <a href="#">
                        <li style="color:rgb(38, 130, 187);">구매목록</li>
                    </a>
                    <a href="cart.html">
                        <li>장바구니</li>
                    </a>
                </ul>
                <img class="bottom" src="${contextPath}/images/left_t08.gif" />
            </div>
        </div>
        <!-- //lnb -->

        <h2 id="title">
            <img src="${contextPath}/images/201004261210266218855.gif" />
        </h2>
        <!-- buy_book -->
        <div id="buy_book">
        <c:forEach var="bookLists" items="${bookLists}">
            <!-- boxWrap -->
            <div class="boxWrap">
                <h3>정보처리기사 필기(ALL-PASS)</h3>
                <!-- box1 -->
                <div class="box">
                    <!-- imageBox -->
                    <div class="imageBox">
                        <img src="${contextPath}/images/img_book_01.jpg"/>
                    </div>
                    <!-- //imageBox -->

                    <!-- textBox -->
                    <div class="textBox">
                        <p>
               <form action="AllController/cartConfirm.do" name="frm" method="post">
	                            정가 : ${bookLists.price}원
	               <input type="hidden" name="price" value="${bookLists.price}">
	                            <br>
	                            할인가 : ${bookLists.salePrice}원
	               <input type="hidden" name="salePrice" value="${bookLists.salePrice}">
	                            <br>
	               ${bookLists.publisher}<span style="font-size:12px;">(저)</span>
	               <input type="hidden" name="publisher" value="${bookLists.publisher}">
	                            <br>
	                            발행 : ${bookLists.writeDate}
	               <input type="hidden" name="writeDate" value="${bookLists.writeDate}">
	                            <br>
	                            수량 : <input type="number" name="quantity" value="1">
	                        </p>
	                    </div>
	                    <!-- //textBox -->
	                    <input type="submit" class="buyBox" value="장바구니 담기">
                </form>
                </div>
                <!-- //box1 -->
            </div>
            <!-- //boxWrap -->

            <!-- buyButton -->
            <div class="buyButton">
                <b>장바구니 >></b>
            </div>
            <!-- //buyButton -->
        </div>
        <!-- //buy_book -->
        </c:forEach>
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
</body>
</html>