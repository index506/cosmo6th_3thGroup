<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기록 체크</title>
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
	href="${contextPath}/Category/Test/css/test/logCheck.css" />
<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/test/manual.css" />
<script src="${contextPath}/Category/Test/js/logCheck.js"></script>
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
					<li style="color: rgb(38, 130, 187);">기록확인</li>
					<li>시험선택</li>
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
				<h3>기록 확인</h3>
				<button class="manual_btn btn manual_item">?</button>
			</div>
			<!-- form -->
			<form id="log_form" name="frm" method="GET"
				action="${contextPath}/test/takeTest.do">
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
							varStatus="stat">
							<tr>
								<th>과목${stat.count}</th>
								<td>${subName}</td>
							</tr>
						</c:forEach>
						<tr>
							<th>푼 문제</th>
							<!-- 총 문제 계산 -->
							<c:set var="toalNum" value="0" />
							<c:forEach var="sn" items="${logVo.subjects_number}">
								<c:set var="toalNum" value="${toalNum + sn}" />
							</c:forEach>
							<!-- //총 문제 계산 -->
							<!-- 푼 문제 계산 -->
							<c:set var="takeNum" value="0" />
							<c:forEach var="answerArr" items="${logVo.test_answer}">
								<c:if test="${answerArr[1] != 0}">
									<c:set var="takeNum" value="${takeNum + 1}" />
								</c:if>
							</c:forEach>
							<!-- //푼 문제 계산 -->
							<td>${takeNum}문제(전체 ${toalNum}문제)</td>
						</tr>
						<tr>
							<c:if test="${logVo.log_time ne 'NOTTIMER'}">
								<th>남은시간</th>
								<td>${logVo.log_time}</td>
							</c:if>
						</tr>
						<tr>
							<th>저장시각</th>
							<td><fmt:formatDate value="${logVo.log_date}"
									pattern="yyyy년 MM월 dd일 - a hh시 mm분 ss초" /></td>
						</tr>
					</table>
					<p id="btn_area" class="btn_area manual_item">
						<input type="button" id="solve_sub" class="btn" value="이어풀기"
							onclick="loadTest();"> <input type="button"
							id="solve_sub" class="btn" value="새로풀기" onclick="newTest();">
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