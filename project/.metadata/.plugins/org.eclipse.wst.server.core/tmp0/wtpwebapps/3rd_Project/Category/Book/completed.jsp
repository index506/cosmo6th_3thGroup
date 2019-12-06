<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                        <td>${orderVO.orderName}</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                        	<c:set var="phoneNumber" value="${orderVO.phoneNumber}"/>
                            <p>${fn:substring(phoneNumber,0,3)}-${fn:substring(phoneNumber,3,7)}-${fn:substring(phoneNumber,7,11)}</p>
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <p>${orderVO.address}</p>
                        </td>
                    </tr>
                    <tr>
                        <th>배송시 요청사항</th>
                        <td>
                            <p>${orderVO.shippingDemand}</p>
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
                            <span><b>${orderVO.depositBank}</b>&nbsp;&nbsp;${orderVO.depositNumber}</span>
                        </td>
                    </tr>
                    <tr>
                        <th>결제금액</th>
                        <td>
                            <strong>
                            	<fmt:formatNumber value="${orderVO.allPrice}"/>	
                            </strong>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- //innerWrap2 -->
        </div>
        <!-- //payment -->

        <div class="payButton left" onclick="location.href='${contextPath}/book/buybook.do'">쇼핑 계속하기</div>
        <div class="payButton" onclick="location.href='${contextPath}/철욱이마이페이지'">구매내역 확인</div>

    </div>
    <!-- //wrap -->

    <!--main_footer-->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->
    
</body>
</html>