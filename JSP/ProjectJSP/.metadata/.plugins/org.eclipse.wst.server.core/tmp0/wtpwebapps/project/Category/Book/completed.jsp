<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<link rel="stylesheet" href="${contextPath}/css/common.css"/>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>

<link rel="stylesheet" href="${contextPath}/Category/Book/css/completed.css"/>

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
    <jsp:include page="/WEB-INF/view/header.jsp" flush="false"/>
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
        <jsp:include page="/WEB-INF/view/sideBuy.jsp" flush="false"/>
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
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->
    
</body>
</html>