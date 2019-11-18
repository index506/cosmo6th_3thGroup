<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 철욱 -->
<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<link rel="stylesheet" href="${contextPath}/css/common.css"/>
<!-- //철욱 -->
</head>
<body>
	<!-- lnb -->
	<div class="lnb">
	    <div>
	        <ul>
	            <a href="${contextPath}/Category/Test/testSelect.html">
	                <li>시험선택</li>
	            </a>
	        </ul>
	        <img class="bottom" src="${contextPath}/images/image_support/left_t08.gif" />
	    </div>
	</div>
	<!-- //lnb -->
</body>
</html>