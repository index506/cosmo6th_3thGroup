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
    <link rel="stylesheet" href="${contextPath}/css/main.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <!--개인 css, js-->
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/find_id.css">

    <title>Find_ID2</title>
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

        <!--find_id2-->
        <div class="customer_idbox" >
        <h2>고객님의 아이디 </h2>
        <p>고객님의 정보와 일치하는 아이디입니다. </p>
        <div class="idInfoBox">
            <p >아이디 : <em>${FindIDinfo.id} </em> <span>가입일 : ${FindIDinfo.assignDate}</span></p>
        </div>
        <p class="btns">
            <button onclick="window.location.href='../form/login_form.do'" >로그인하기</button>
            <button onclick="window.location.href='../form/find_pwd_form.do'">비밀번호 찾기</button>
        </p>
        </div>
        <!--//find_id2-->
        </div>
    </section>
    <!--//section-->
    <!--main_footer-->
 	<jsp:include page="../../WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->      
</body>
</html>