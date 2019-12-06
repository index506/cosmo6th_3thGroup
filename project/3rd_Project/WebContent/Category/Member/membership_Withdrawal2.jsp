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

    <link rel="stylesheet" href="${contextPath}/Category/Member/css/Withdrawal_1.css"/>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>

    <title>회원탈퇴신청</title>
</head>
<body>
    <!--main_header_wrap-->
	<jsp:include page="../../WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    <!--section-->
    <section>
	<jsp:include page="../../WEB-INF/view/sideMember.jsp" flush="false"/>
        <div id="PPS" class="content">
              
    <!--회원탈퇴-->
    <div class="outWrap">
    <div class="line">
    <h2 class="t_memout"><span>회원 탈퇴</span></h2>
    </div>
    <br>
    <div class="textalert">
        <span> | "회원 탈퇴 후 재가입시에는 신규회원가입으로 처리되어 탈퇴 전의 회원 정보는 복구 되지 않습니다."</span>
    </div>
    <div>
        <h3 class="h_text">
            <span>서비스 이용 중 불편사항을 선택해주세요.(복수선택가능)</span>
        </h3>
    </div>
    <div class="combine_box">
        <ul class="list_check">
            <li><input title="checkbox" type="checkbox" value="01"><label for="chk1">이용빈도 낮음</label></li>
            <li><input title="checkbox" type="checkbox" value="02"><label for="chk1">개인정보유출</label></li>
            <li><input title="checkbox" type="checkbox" value="03"><label for="chk1">자료 부족</label></li>
            <li><input title="checkbox" type="checkbox" value="04"><label for="chk1">기타</label></li>
        </ul>
    </div>
    <div>
        <h3 class="h_text">
            <span>그 이외에 남기고 싶으신 의견이 있으시면 기재해주세요.</span>
        </h3>
    </div>
    <div>
        <textarea title="textarea" cols="80" rows="7" ></textarea>
    </div>
    <div class="btn">
        <a href="javascript:withdrawal();">
            <span>회원 탈퇴 신청</span>
        </a>
        <a href="javascript:mv_cancle();">
            <span>취소</span>
        </a>
    </div>
    </div>
    <!--//회원탈퇴-->
	</div>
	</section>
	<!--//section-->
	<!--main_footer-->
	<jsp:include page="../../WEB-INF/view/footer.jsp" flush="false"/>
	<!--//main_footer-->
</body>
</html>