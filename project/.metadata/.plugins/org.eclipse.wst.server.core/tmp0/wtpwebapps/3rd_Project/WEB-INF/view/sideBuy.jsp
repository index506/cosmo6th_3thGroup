<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>sideMember</title>
</head>
<body>
	<div class="lnb">
	    <div>
	        <img class="top" src="${contextPath}/images/image_support/sideTitle_orderbook.jpg"/>
	        <ul>
	            <li>
	            	<a href="../book/buybook.do">구매목록</a>
	            </li>
	            <li>
	            	<a href="../book/cart.do">장바구니</a>
	            </li>
	        </ul>
	        <img class="bottom" src="${contextPath}/images/image_support/left_t08.gif" />
	    </div>
	</div>
</body>
</html>