<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>sideService</title>
</head>
<body>
	<div class="lnb">
		<div>
			<img class="top" src="${contextPath}/images/image_support/201508270312264232400.jpg"/>
				<ul>
					<li><a href="${contextPath}/Category/Service/privacyPolicyStatement.jsp">개인정보보호정책</a></li>
	                <li><a href="${contextPath}/Category/Service/accessTerms.jsp">이용약관</a></li>
	                <li><a href="${contextPath}/Category/Service/sitemap.jsp">사이트맵</a></li>
              	</ul>
			<img class="bottom" src="${contextPath}/images/image_support/left_t08.gif"/>
		</div>
	</div>
</body>
</html>