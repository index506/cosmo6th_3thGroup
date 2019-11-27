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
		
		function go_order(){
								   // undefined : 속성의 length가 1일때 undefined가 반환된다. 
			if(document.frm.length == undefined){
				return false;
			}
		}

        function go_cart_update(stsIndex){
        	
        	alert("stsIndex : " + stsIndex);
        	    		
       		if(document.getElementsByClassName('frm').length == 1){
       			document.frm.action = "${contextPath}/book/cartUpdate.do";
           		document.frm.submit();
       		} else {
       			document.frm[stsIndex].action = "${contextPath}/book/cartUpdate.do";
           		document.frm[stsIndex].submit();	
       		}
        }
        
        function go_cart_delete(){
        	if(confirm("삭제하시겠습니까?")){
        		return true;
        	} else {
        		return false;
        	}
        }

        $(function () {

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
        
        
        <!-- lnb -->
        <div class="lnb">
		    <div>
		        <img class="top" src="${contextPath}/images/image_support/201508270312264232403.jpg"/>
		        <ul>
		            <li>
		            	<a href="${contextPath}/book/buybook.do">구매목록</a>
		            </li>
		            <li style="color:rgb(38,130,187);">
		            	<a href="${contextPath}/book/cart.do">장바구니</a>
		            </li>
		        </ul>
		        <img class="bottom" src="${contextPath}/images/image_support/left_t08.gif" />
		    </div>
		</div>	
        <!-- //lnb -->
        
        <!-- processWrap -->
        <div class="processWrap">
            <p class="process">주문완료&nbsp;</p>
            <p class="process">주문결제 >&nbsp;</p>
            <p class="process">장바구니 >&nbsp;</p>
        </div>
		<!-- //processWrap -->
		
        <!-- orderSheet -->
        <h2 id="orderSheet">주문서</h2>
        <!-- //orderSheet -->

		<div id="cartOuterWrap">
        <!-- cartInnerWrap -->
        <div id="cartInnerWrap">
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
                <c:choose>
                	<c:when test="${!empty cartList}">
                											   <!-- varStatus="status" : 인덱스를 활용한 태그 상태 속성 -->
		                <c:forEach var="cartVO" items="${cartList}" varStatus="status">
		                	<form name="frm" method="post" class="frm">
				                <tr>
				                    <td>${cartVO.title}</td>
				                    <td>
				                        <span class="price">
				                        	<fmt:formatNumber value="${cartVO.price}"/>
				                        </span>원
				                    </td>
				                    <td>
				                        <span class="price">
				                        	<fmt:formatNumber value="${cartVO.salePrice}"/>
				                        </span>원
				                    </td>
				                    <td>
				                        <input type="number" name="quantity" value="${cartVO.quantity}" class="inputNumber" >
				                        <input type="hidden" name="cseq" value="${cartVO.cseq}">
				                        <input type="hidden" name="salePrice" value="${cartVO.salePrice}">
				                        <input type="button" value="수정" onclick="go_cart_update(${status.index});">
				                    </td>
				                    <td>
				                        <span class="price">
				                        	<fmt:formatNumber value="${cartVO.amountPrice}"/>
				                        </span>원
				                    </td>
				                    <td>
				                        <a href="${contextPath}/book/cartDelete.do?cseq=${cartVO.cseq}" onclick="return go_cart_delete();"style= "color: black" class="deleteBtn">X</a>
				                    </td>
				                </tr>
			                </form>
		                </c:forEach>
	                </c:when>
	                <c:otherwise>
	                	<tr>
	                		<td>
	                			상품이 존재하지 않습니다.
	                		</td>
	                	</tr>
                	</c:otherwise>
                </c:choose>
            </table>
            <!-- //table -->
        </div>
        <!-- //cartInnerWrap -->
        <p class="buttonBox">
	        <a href="${contextPath}/book/order.do" onclick="return go_order();"class="button">결제하기</a>
	        <a href="${contextPath}/book/buybook.do" class="button">구매목록</a>
        </p>
        </div>
        <!-- cartOuterWrap -->
    </div>
    <!-- //wrap -->

    <!--main_footer-->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->
