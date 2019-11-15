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
<title>footer</title>
</head>
<body>
	<!--main_footer-->
    <footer id="main_footer">
        <img src="${contextPath}/images/bottom_long_bar.gif">
        <ul>
            <li><a href="${contextPath}/Category/Service/accessTerms.jsp"  title="이용약관"><img src="${contextPath}/images/footer_menu_2.gif" alt="이용약관"/></a></li><li>|</li>
            <li><a href="${contextPath}/Category/Service/privacyPolicyStatement.jsp" title="개인정보취급방침"><img src="${contextPath}/images/footer_menu_3.gif" alt="개인정보취급방침"/></a></li><li>|</li>
            <li><a href="#" class="alert_ready"><img src="${contextPath}/images/footer_menu_4.gif" alt="이메일주소무단수집거부"/></a></li><li>|</li>
            <li><a href="#" class="alert_ready"><img src="${contextPath}/images/footer_menu_5.gif" alt="Contact us"/></a></li><li>|</li>
            <li><a href="${contextPath}/Category/Service/sitemap.jsp" title="사이트맵"><img src="${contextPath}/images/footer_menu_6.gif" alt="사이트맵"/></a></li>
        </ul>
        <hr/>
    </footer>
    <!--//main_footer-->
</body>
</html>