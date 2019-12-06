<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문제 풀기</title>
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
	href="${contextPath}/Category/Test/css/test/take-result.css" />
<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/test/testResult.css" />

<script src="${contextPath}/Category/Test/js/jquery-2.1.1.min.js"></script>
<script src="${contextPath}/Category/Test/js/take-result.js"></script>
<script src="${contextPath}/Category/Test/js/testResult.js"></script>
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
					<li>시험선택</li>
					<li>시험풀기</li>
					<li style="color: rgb(38, 130, 187);">시험결과</li>
					<li>시험해설</li>
				</ul>
				<img class="bottom" src="../images/image_support/left_t08.gif" />
			</div>
		</div>
		<!-- //lnb -->
		<div id="content_wrap">
			<div id="content_title">
				<h3>시험 결과</h3>
			</div>
			<!-- form -->
			<form id="log_form" name="frm" method="GET"
				action="${contextPath}/test/explanationsTest.do">
				<fieldset>
					<table class="log_table">
						<tr>
							<th width="75px">자격증</th>
							<td>${logVo.license_name}</td>
						</tr>
						<tr>
							<th>시험년도</th>
							<td><fmt:formatDate value="${logVo.year_date}"
									pattern="yyyy년 MM월 dd일" /></td>
						</tr>

						<c:forEach var="subName" items="${logVo.subjects_name}"
							varStatus="v">
							<tr>
								<th>과목${v.count}</th>
								<td>${subName}: ${logVo.subjects_current[v.index]} /
									${logVo.subjects_number[v.index]} (맞은 개수 / 문제 개수)</td>
							</tr>
						</c:forEach>
						<c:if test="${logVo.log_time ne 'NOTTIMER'}">
							<tr>
								<th>남은시간</th>
								<td>${logVo.log_time}</td>
							</tr>
						</c:if>
						<tr>
							<th>제출시각</th>
							<td><fmt:formatDate value="${logVo.log_date}"
									pattern="yyyy년 MM월 dd일 - a hh시 mm분 ss초" /></td>
						</tr>
					</table>
					<p id="btn_area" class="btn_area manual_item">
						<input type="submit" id="save" class="btn" value="해설보기">
						<input type="button" class="btn" value="시험 재선택"
							onclick="location.href='${contextPath}/test/selectTest.do'">
					</p>
				</fieldset>
			</form>
			<!-- //form -->
		</div>
		<!-- //content_wrap -->
	</section>
	<!--//section-->
	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
	<!-- //footer -->
</body>
</html>