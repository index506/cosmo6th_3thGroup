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

<link rel="stylesheet" href="${contextPath}/Category/Book/css/buybook.css"/>

<script>

// window.onload=function(){}
		

		
$(function () {
	
	if("${message}"=="pass"){
		
		var answer = confirm("선택하신 상품이 장바구니에 담겼습니다." + '\n' +"장바구니로 이동하시겠습니까?");
		if(answer){
			location.href = '${contextPath}/book/cart.do';
			message="";
		}
	}
	
	if("${message}"=="fail"){
		alert("선택하신 상품은 이미 장바구니에 존재합니다.");
	}

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
});

</script>

<!-- 
<c:choose>
	<c:when test='${message=="pass"}'>
		<script>
			window.onload=function(){
				
				var answer = confirm("선택하신 상품이 장바구니에 담겼습니다." + '\n' +"장바구니로 이동하시겠습니까?");
				if(answer){
					location.href = '${contextPath}/book/cart.do';
					message="";
				}
					
			}
		</script>	
	</c:when>
	
	<c:when test='${message=="fail"}'>
		<script>
			window.onload=function(){
				alert("선택하신 상품은 이미 장바구니에 존재합니다.");
			}
		</script>
	</c:when>
</c:choose>
 -->

</head>
<body>
    <!--main_header_wrap-->
    <jsp:include page="/WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    
    <!-- wrap -->
    <div id="wrap">
    
        <!-- lnb -->
        <jsp:include page="/WEB-INF/view/sideBuy.jsp" flush="false"/>
        <!-- //lnb -->

        <h2 id="title">
            <img src="${contextPath}/Category/Book/images/buybook/201004261210266218855.gif" />
        </h2>
        <!-- buy_book -->
        <div id="buy_book">
        <c:forEach var="bookVO" items="${bookList}">
        	<form action="${contextPath}/book/cartInsert.do" name="frm" method="post">
            <!-- boxWrap -->
            <div class="boxWrap">
                <h3>${bookVO.title}</h3>
                <!-- box1 -->
                <div class="box">
                    <!-- imageBox -->
                    <div class="imageBox">
                        <img src="${contextPath}/Category/Book/images/buybook/img_book_${bookVO.imgURL}.jpg"/>
                    </div>
                    <!-- //imageBox -->
                    <!-- textBox -->
                    <div class="textBox">
		                   <p>
			                            정가 : <fmt:formatNumber value="${bookVO.price}"/>원
			               <input type="hidden" name="price" value="${bookVO.price}">
			                            <br>
			                            할인가 : <fmt:formatNumber value="${bookVO.salePrice}"/>원
			               <input type="hidden" name="salePrice" value="${bookVO.salePrice}">
			                            <br>
			               ${bookVO.publisher}<span style="font-size:12px;">(저)</span>
			               <input type="hidden" name="publisher" value="${bookVO.publisher}">
			                            <br>
			                            발행 : ${bookVO.writeDate}
			               <input type="hidden" name="writeDate" value="${bookVO.writeDate}">
			               <input type="hidden" name="imgUrl" value="${bookVO.imgURL}">
			               <input type="hidden" name="title" value="${bookVO.title}">
			               <input type="hidden" name="bseq" value="${bookVO.bseq}">
			                            <br>
			                            수량 : <input type="number" name="quantity" value="1">
                           </p>
                    </div>
                    <!-- //textBox -->
                    <input type="submit" class="buyBox" value="장바구니 담기">
           			
                </div>
                <!-- //box1 -->
            </div>
            <!-- //boxWrap -->
            </form>
            </c:forEach>

            <!-- buyButton -->
            <div class="buyButton" onclick="location.href='${contextPath}/book/cart.do'">
                <b>장바구니 >></b>
            </div>
            <!-- //buyButton -->
        </div>
        <!-- //buy_book -->
        
    </div>
    <!-- //wrap -->

    <!--main_footer-->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->

</body>
</html>
