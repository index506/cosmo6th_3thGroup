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
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/Withdrawal.css"/>
	<script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>
    <title>Membership_withdrawal</title>
</head>
<body>

    <!--main_header_wrap-->
	<jsp:include page="../../WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    <!--section-->
    <section>
    <jsp:include page="../../WEB-INF/view/sideMember.jsp" flush="false"/>
    

        <div id="PPS" class="content">   
        <!--password_confirm-->
        <div class="pw_inner">
            <h2 class="tit">비밀번호 재확인</h2>
            <p class="pw_info">회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p><br>
            <div class="pw_box">
                <form name="frmOUT" method="post">
                    <p class="login_id"> 아이디 : <em>${loginId}</em></p>
                    <div class="write_box">
                        <input type="password" name="user_pwd" id="mem_pwd" placeholder="비밀번호를 입력하세요." maxlength="20">
                        <button  class="btn_ok" onclick="pwdConfirm();">
                            <span>확인</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!--//password_confirm-->
            </div>
    </section>
    <!--//section-->
   <!--main_footer-->
	<jsp:include page="../../WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->
</body>
</html>

