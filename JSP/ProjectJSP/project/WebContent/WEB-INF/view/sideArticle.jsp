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
<title>sideBuy</title>
</head>
<body>
	<div class="lnb">
    	<div>
        	<img class="top" src="${contextPath}/images/image_support/201508270312264232402.jpg"/>
        	<ul>
	           <li><a href="${contextPath}/Category/Board/Notice_List.jsp">공지사항</a></li>
	           <li><a href="${contextPath}/Category/Board/Community_List.jsp">자유 게시판</a></li>
	           <li><a href="${contextPath}/Category/Board/Question_List.jsp">질문 게시판</a></li>
	       </ul>
	       <img class="bottom" src="${contextPath}/images/image_support/left_t08.gif"/>
	   </div>
	</div>
</body>
</html>