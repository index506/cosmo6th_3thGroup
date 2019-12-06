<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 
<%
    request.setCharacterEncoding("UTF-8"); 
%> 
<!DOCTYPE html>
<html lang="ko">
<head>   
    <title>find ID</title>
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
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/find_id.css">
    <script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>
</head>
<body>
    <!--main_header_wrap-->
	<jsp:include page="../../WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    <!--section-->
    <section>
		<div class="lnb">
			<div style="border:0;">
				
			</div>
		</div>
	<div id="PPS" class="content">
    <!--Find_ID-->
    <div id="find_id_wrap">
        <div class="id_img">
            <img src="${contextPath}/Category/Member/images/id.png" >
        </div>
        
        <form name="frmfindid" method="post" encType="UTF-8">
            <p class="name">이름   <input type="text" name="name" ></p><br>
            <p class="mail_add">이메일 주소  
                <input type="email" name="email">
                <input type="button" onclick="return random();" value="인증번호 보내기" name="randomNum">
                
            </p>
            <p class="numcheck" >
                <input type="text" class="numConfirm" name="numConfirm">
                <input type='button' onclick='numberCheck();' value='인증번호확인'/>
            </p></br>
        </form>
        <hr class="IDhr">
        <p>●  비밀번호를 찾으시나요?  <a href="../form/find_pwd_form.do">비밀번호 찾기 〉</a></p>
        </div>
        <!--//Find_ID-->
        </div>
    </section>
    <!--//section-->
    <!--main_footer-->
	<jsp:include page="../../WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->
</body>
</html>