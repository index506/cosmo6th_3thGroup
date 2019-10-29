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
<title>lnbMember</title>
</head>
<body>
	<div class="lnb">
    	<div>
        	<img class="top" src="./images/image_support/201508270312264232400.jpg"/>
        	<ul>
	           <a href="../Yoo/Membership Modify.html"><li>회원정보</li></a>
	           <a href="../Seok/find_id.html"><li>아이디 찾기</li></a>
	           <a href="../Seok/find_pwd.html"><li>비밀번호 찾기</li></a>
	           <a href="../Seok/membership_Withdrawal.html"><li>회원 탈퇴</li></a>
	       </ul>
	       <img class="bottom" src="./images/image_support/left_t08.gif"/>
	   </div>
	</div>
</body>
</html>