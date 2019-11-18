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

<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<link rel="stylesheet" href="${contextPath}/css/common.css"/>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>

<link rel="stylesheet" href="${contextPath}/Category/Book/css/cart.css" />

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
    <jsp:include page="/WEB-INF/view/header.jsp" flush="false"/>
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
		        <img class="top" src="${contextPath}/images/image_support/201508270312264232403.jpg"/>
		        <ul>
		            <li>
		            	<a href="${contextPath}/Category/Book/buybook.jsp">구매목록</a>
		            </li>
		            <li style="color:rgb(38,130,187);">
		            	<a href="${contextPath}/Category/Book/cart.jsp">장바구니</a>
		            </li>
		        </ul>
		        <img class="bottom" src="${contextPath}/images/image_support/left_t08.gif" />
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
                        <img src="${contextPath}/Category/Book/images/icn_modify.gif" class="amtModify" />
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
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->

</body>
</html>