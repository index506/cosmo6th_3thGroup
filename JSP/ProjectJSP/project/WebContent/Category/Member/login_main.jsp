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

<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
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
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/login.css">
	<script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>    
     
     
    <jsp:include page="../../WEB-INF/view/header.jsp" flush="false"/>
    <!--section-->
    
        
    <!--Login-->
    <form name="frmLogin" method="post" >
    <div class="loginWrap" >
    <div align="center">
        <a href="javascript:window.location.reload();"><img src="${contextPath}/Category/Member/images/login_logo.png" title="mainPic"></a>
    </div>
    <input class="login_id" placeholder="   아이디를 입력해주세요" maxlength="20"
    type="text" required="required" name="user_id"><br>
    <input class="login_pwd" placeholder="   비밀번호를 입력해주세요" maxlength="17" 
    type="password" required="required" name="user_pw">
    <hr class="loginhr">
    <p class="btn_login">
        <a  href="javascript:login_validate();">로그인</a>        
    </p>

    <div class="buttonwrap">
        <div class="memberbutton"><a href="${contextPath}/Category/Member/signup.html" ><img src="${contextPath}/Category/Member/images/login_b_12.gif" title="회원가입"></a></div>
        <div class="idsearch"><a href="find_id.jsp"><img src="${contextPath}/Category/Member/images/login_b_15.gif" title="id 찾기"></a></div>
        <div class="pwdsearch"><a href="find_pwd.jsp"><img src="${contextPath}/Category/Member/images/login_b_17.gif" title="비밀번호 찾기"></a></div>
    </div>
    </div>
    </form>
    <!--//Login-->
    

<!--//section-->
<%@ include file="../../WEB-INF/view/footer.jsp" %>  