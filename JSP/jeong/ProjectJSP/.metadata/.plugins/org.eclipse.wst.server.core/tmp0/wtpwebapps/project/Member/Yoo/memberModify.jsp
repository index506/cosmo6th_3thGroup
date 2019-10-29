<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="${contextPath}/css/init.css" />
	<link rel="stylesheet" href="${contextPath}/css/common.css" />
	<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
	<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/common.js"></script>
	
	<link rel="stylesheet" href="${contextPath}/Member/Yoo/css/add.css" />
</head>
<body>
	<!--main_header_wrap-->
	<jsp:include page="/WEB-INF/view/header.jsp" flush="false" />
	<!--//main_header_wrap-->
	<!--section-->
	<section>
		<jsp:include page="/WEB-INF/view/lnbMember.jsp" flush="false" />
		<!-- main wrap -->
		<div id="main_wrap" class="content">
		<div id="start">
			<!-- 첫 태그 -->
			<div id="id">
				<img src="images/join_st2_tit03_1.gif" alt="회원아이디" id="id_1" /> 
				<label class="he">
					<input type="name" /> 영문/숫자조합으로 8~16자리
				</label>
			</div>
			<div id="pass">
				<img src="images/join_st2_tit03_2.gif" alt="비밀번호" />
				<label class="he">
					<input type="password" /> 영문/숫자조합으로 9~16자리
				</label>
			</div>
			<div id="repass">
				<img src="images/join_st2_tit03_3.gif" alt="비밀번호확인" />
				<label class="he">
					<input type="password" />
				</label>
			</div>
			<div id="person">
				<img src="images/join_st2_tit03_6.gif" alt="개인정보" />
				<label class="he">
					이름(한글) : <input type="name" />
				</label>
			</div>
			<div id="email">
				<img src="images/join_st2_tit03_7.gif" alt="이메일" />
				<label class="he">
					<input type="text" /> @ 
					<input type="text" /> 
					<select>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>google.com</option>
						<option>직접 입력</option>
					</select>
				</label>
			</div>
			<div id="adress">
				<!-- <fieldset id = "field" style = "height:50px"> -->
				<img src="images/join_st2_tit03_8.gif" alt="주소" /><label class="he">
					<!-- <form action = "#" accept-charset="utf-8" name = "person_info" method = "get"> </form>-->
					<input type="text" />-<input type="text" /> <input
					style="margin-left: 5px" type="button" value="우편번호검색" />
				</label>
				<!-- </fieldset> -->
			</div>
			<div id="home">
				<img src="images/join_st2_tit03_9.gif" alt="전화번호" /> <label
					class="he"><select><option>051</option>
						<option>02</option>
						<option>031</option>
						<option>032</option>
						<option>033</option></select> - <input type="text" /> - <input type="text" /></label>
			</div>
			<div id="phone">
				<img src="images/join_st2_tit03_10.gif" alt="휴대전화" /> <label
					class="he"><select><option>010</option>
						<option>011</option></select> - <input type="text" /> - <input type="text" /></label>
			</div>
			<div id="check">
				<ul>
					<li><a href="#"><img src="images/join_btn03.gif"
							alt="정보변경" /></a></li>
					<li id="pro"><a href="#"><img src="images/join_btn04.gif"
							alt="취소" /></a></li>
				</ul>
			</div>
		</div>
		</div>
		<!-- //main wrap -->
	</section>
	<!--main_footer-->
	<jsp:include page="/WEB-INF/view/footer.jsp" flush="false" />
	<!--//main_footer-->
</body>
</html>