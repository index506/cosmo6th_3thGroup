<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- jstl을 사용하기 위한 디렉티브 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 
<%
    request.setCharacterEncoding("UTF-8"); //요청 받아온 글자 깨지지 안도록 UTF-8설정
%>
    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <!--개인 css, js-->
	<title>Find Password2</title>
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/find_pwd.css">
    <script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>
</head>
<body>
    <!--main_header_wrap-->
	<jsp:include page="../../WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    
    <!--section-->
    <section>
	<jsp:include page="../../WEB-INF/view/sideMember.jsp" flush="false"/>

    <div id="PPS" class="content">
    <!--find_password-->
    <form name="frm" method="post">
    <div class="pwd2_wrap">
        <h2>본인 확인</h2>
        <p>E-mail로 인증하기 </p>
        <div class="certi_box">
            <p>회원 가입시 입력한 이메일을 적어주시면 인증번호를 보내드립니다.</p>
            
            <input type="email" placeholder="이메일을 입력해주세요. "><input type="button" onclick="certiNum();" value="인증번호 보내기"></br>

            <input type="text" class="confirmNum" name="userCon"><input type="button" onclick="userConfirm();" value="인증번호 확인" >

        </div>
    </div>
    </form>
    <!--//find_password-->
    </div>
    </section>
    <!--//section-->

<%@ include file="../../WEB-INF/view/footer.jsp" %> 