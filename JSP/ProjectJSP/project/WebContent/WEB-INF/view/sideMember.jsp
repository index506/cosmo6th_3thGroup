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
<title>sideCategory</title>
</head>
<body>
	<div class="lnb">
    	<div>
        	<img class="top" src="${contextPath}/images/image_support/201508270312264232401.jpg"/>
	        	<ul>
		           <li><a href="${contextPath}/Category/Service/mypage.jsp">회원정보</a></li>
		           <li><a href="${contextPath}/Category/Member/memberModify.jsp">회원정보 수정</a></li>
		           <li><a href="${contextPath}/Category/Member/find_id.jsp">아이디 찾기</a></li>
		           <li><a href="${contextPath}/Category/Member/find_pwd.jsp">비밀번호 찾기</a></li>
		           <li><a href="${contextPath}/Category/Member/membership_Withdrawal.jsp">회원 탈퇴</a></li>
		       </ul>
	       <img class="bottom" src="${contextPath}/images/image_support/left_t08.gif"/>
	   </div>
	</div>
</body>
</html>