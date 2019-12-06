<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문제 선택</title>
<!-- 철욱 -->
<link rel="stylesheet" href="${contextPath}/css/init.css" />
<link rel="stylesheet" href="${contextPath}/css/common.css" />
<script type="text/javascript"
	src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript"
	src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>
<!-- //철욱 -->

<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/myCommon.css" />
<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/test/testCommon.css" />
<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/test/testSelect.css" />
<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/test/manual.css" />
<script src="${contextPath}/Category/Test/js/testSelect.js"></script>
<script src="${contextPath}/Category/Test/js/testSelectAjax.js"></script>
<script src="${contextPath}/Category/Test/js/manual.js"></script>

</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	<!-- //header -->
	<!--section-->
	<section>
		<!-- lnb -->
		<div class="lnb">
			<div>
				<img class="top" src="../images/image_support/sideTitle_test.jpg" />
				<ul>
					<li>기록확인</li>
					<li style="color: rgb(38, 130, 187);">시험선택</li>
					<li>시험풀기</li>
					<li>시험결과</li>
					<li>시험해설</li>
				</ul>
				<img class="bottom" src="../images/image_support/left_t08.gif" />
			</div>
		</div>
		<!-- //lnb -->
		<!-- content_wrap -->
		<div id="content_wrap">
			<div id="content_title">
				<h3>시험 선택</h3>
				<button class="manual_btn btn manual_item">?</button>
			</div>
			<!-- form -->
			<form id="option_form" name="frm" method="GET"
				action="${contextPath}/test/createLog.do">
				<fieldset>
					<div id="hidden_area" class="hidden">
						<input type="hidden" name="mod" value="new"> <input
							type="hidden" class="license_name" name="license_name" value="">
						<input type="hidden" class="subject_total" name="subject_total"
							value="">
					</div>
					<div id="license_area" class="q_area manual_item">
						<h4>1. 자격증을 선택해주세요.</h4>
						<select id="license_select" class="license_select "
							name="license_abbreviation" onchange="selectlicense();">
							<option value="">------------</option>
							<c:forEach var="license" items="${licensesList}">
								<option value="${license.license_abbreviation}">${license.license_name}</option>
							</c:forEach>
						</select>
					</div>
					<div id="year_area" class="q_area  manual_item">
						<h4>2. 기출년도를 선택해주세요.</h4>
						<select id="year_select" class="year_select" name="year"
							onchange="selectYear()">
						</select>
					</div>
					<div id="subject_area" class="q_area manual_item">
						<h4>3. 과목을 선택해주세요.</h4>
						<ul class="subject_ul">
						</ul>
					</div>
					<div id="timer_area" class="q_area manual_item">
						<h4>4. 시간 제한 여부를 선택해주세요.</h4>
						<ul>
							<li><input type="radio" id="timer_yes" name="timer" value=""
								checked="checked"> <label for="timer_yes">예</label></li>
							<li><input type="radio" id="timer_no" name="timer"
								value="NOTTIMER"> <label for="timer_no">아니오</label></li>
						</ul>
					</div>
					<p id="btn_area" class="btn_area manual_item">
						<input type="submit" id="solve_sub" class="btn" value="시험풀기"
							onclick="return selectCheck();">
					</p>
				</fieldset>
			</form>
			<!-- //option_form -->
		</div>
		<!-- //content_wrap -->
	</section>
	<!--//section-->
	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
	<!-- //footer -->
</body>
</html>