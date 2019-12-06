<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- jstl을 사용하기 위한 디렉티브 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보 변경</title>
    <style>
   	
	.textmove{	
	width:80%;
	height:100%;
	}
	 table  {
	 	width:75%;
	 	border-collapse: separate;
  		border-spacing: 0 12px;
        border: 1px solid #bcbcbc;        
      }
     th, td{
     	cellpadding:5px;
      	border:none;
      }      
	</style>
	
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    
    <script type="text/javascript" src="${contextPath}/Category/Member/js/cancel.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/modify.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/number.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/hangul.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/alphanumber.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/alphanumber.js"></script>
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/add.css"/>
</head>
<body>
    <!--main_header_wrap-->
  	<jsp:include page="/WEB-INF/view/header.jsp" flush="false" />
    <!--//main_header_wrap-->
    <!--section-->
    <section>
        <jsp:include page="/WEB-INF/view/sideMember.jsp" flush="false"/>
        <form name="frm" method="post">
			<table > 
				<tr>
				<th>아이디 <th><input type="text" class="textmove" name="id" placeholder="영문/숫자조합  8~15자리" value="${loginId}" readonly></th>
				</tr>
				<tr>
				
				<tr>
				<th>이름<th><input type="text" id="hangul" name="name" class="textmove" maxlength="15"></th>
				</tr>
				<tr>
				<th>이메일<th><input type="email" name="email" id="email" class="textmove"></th>
				</tr>
				<tr>
				<th>주소<th><input type="text" name="address" class="textmove"></th>
				</tr>
				<tr>
				<th>집 전화<th><input type="text" class="onlyNumber textmove"  name="tel" size=35 maxlength="11" placeholder="'-'을 제외한 집전화번호를 입력해 주세요" style="ime-mode disabled"  ></th>
				</tr>
				<tr>
				<th>휴대전화<th><input type="text" class="onlyNumber textmove" name="phone" size=35 maxlength="11" placeholder=" '-'을 제외한 휴대폰번호를 입력해 주세요" style="ime-mode disabled"  ></th>
				</tr>
				<tr>
				<td colspan="2" align ="center" border="none">
				<input type="button" alt="변경" value="정보 변경" onclick="joinCheck1();" style="margin-right:15px; width:15%; height:100%;" />
				<input type="reset" alt="취소" value="취소" onclick="cancel();" style="width:15%; height:100%;"/>
				</td>
				</tr>
			</table>
	</form>
 </section>
  <!--main_footer-->
	<jsp:include page="/WEB-INF/view/footer.jsp" flush="false" />
    <!--//main_footer-->
</body>
</html>
