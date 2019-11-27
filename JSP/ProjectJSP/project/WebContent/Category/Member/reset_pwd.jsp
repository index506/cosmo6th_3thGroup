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
<link rel="stylesheet" href="${contextPath}/Category/Member/css/find_pwd.css"/>  
<script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>  	
<title>Reset Password</title>
</head>
<body>

	<jsp:include page="../../WEB-INF/view/header.jsp" flush="false"/>
    <!--section-->
    <section>
	<jsp:include page="../../WEB-INF/view/sideMember.jsp" flush="false"/>
    
    <div id="PPS" class="content">
    
    <!-- reset_password-->
    <div class="pwd3_wrap">    
    <form method="post" name="frmReset"  encType="UTF-8" action="../../login/resetPWD.do">
    
        <h2>비밀번호 재설정</h2>
        <p>비밀번호 작성시 8~15자리 가능, 알파벳 소문자, 숫자, 특수기호 조합</p>
        <div class="repwd_box">
            <ul>
                <li class="clear">
                    <label for="pwd_lbl" class="tit_lbl">비밀번호</label>
                    <div class="pass">
                        <input type="password" class="w100p" id="pwd_lbl" maxlength="20" placeholder="비밀번호를 입력해주세요." name="pwd1">
                        <p class="hidden1">영문+숫자+특수기호 8~15자리로 구성하여야 합니다.</p>
                    </div>
                </li>
                <li class="clear">
                    <label for="pwd2_lbl" class="tit_lbl">비밀번호 확인</label>
                    <div class="pass">
                        <input type="password" class="w100p" id="pwd2_lbl" maxlength="20"
                        name="user_pwd" placeholder="다시 한번 입력해주세요.">
                    </div>
                    <p class="hidden2">비밀번호가 일치하지 않습니다.</p>
                </li>
            </ul>
            <hr>
            <button class="btn cancel" type="reset">취 소</button>
            <input type="button" class="btn confirm"  value="비밀번호변경" onclick="javascript: return resetPwd();">
        </div>
    
    </form>
    </div>
    <!--//reset_password-->
    </div>
    
    </section>
    <!--//section-->
 	<jsp:include page="../../WEB-INF/view/footer.jsp" flush="false"/>
</body>
</html>