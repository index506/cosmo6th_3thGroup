<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${contextPath}/Category/Test/css/test/takeTest.css" />
<link rel="stylesheet"
	href="${contextPath}/Category/Test/css/test/manual.css" />

<script src="${contextPath}/Category/Test/js/take-result.js"></script>
<script src="${contextPath}/Category/Test/js/testTake.js"></script>
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
					<li>시험선택</li>
					<li style="color: rgb(38, 130, 187);">시험풀기</li>
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
				<h3>시험 풀기</h3>
				<button class="manual_btn btn manual_item">?</button>
			</div>
			<!-- quiz_form -->
			<form id="quiz_form" name="frm" method="post"
				action="${contextPath}/test/resultTest.do">
				<!-- fieldset -->
				<fieldset>
					<legend class="hidden"> 문제 풀기 </legend>
					<!-- info_area -->
					<div id="info_area">
						<div>
							<span>${logVo.license_name}</span> - <span><fmt:formatDate
									value="${logVo.year_date}" pattern="yyyy년 MM월 dd일" /></span>
						</div>
						<c:choose>
							<c:when test="${logVo.log_time ne 'NOTTIMER'}">
								<span>남은시간 - </span>
								<input type="text" class="timer" name="timer"
									value="${logVo.log_time}" readonly>
							</c:when>
							<c:otherwise>
								<input type="hidden" class="timer" name="timer" value="NOTTIMER"
									readonly>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="submit" value="Y"> <input
							type="hidden" name="log_seq" value="${logVo.log_seq}">
					</div>
					<!-- //info_area -->
					<!-- content_area -->
					<div id="content_area">
						<c:set var="cntQuiz" value="1" />
						<!-- forEach 반복시 1씩 증가 시킬 변수 cntQuiz -->
						<c:forEach var="quizArrayListSubject" items="${quizList}"
							varStatus="listNo">
							<c:if test="${empty quizArrayListSubject}">
								<h4>선택한 시험은 데이터가 없습니다.</h4>
							</c:if>
							<c:forEach var="quiz" items="${quizArrayListSubject}"
								varStatus="quizSubjectNo">
								<div id="quiz_box_${cntQuiz}" class="quiz_box">
									<ul>
										<li><div>${quiz.quiz_title}</div></li>
										<c:if test="${quiz.quiz_image!=null}">
											<li><img
												src="${contextPath}/Category/Test/images/quizImageFolder/${quiz.quiz_image}">
											<li>
										</c:if>
										<li><c:choose>
												<c:when test="${logVo.test_answer.get(cntQuiz-1)[1]==1}">
													<input id="answer${cntQuiz}_1" class="answer" type="radio"
														name="${quiz.quiz_num}" value="1" checked="checked" />
												</c:when>
												<c:otherwise>
													<input id="answer${cntQuiz}_1" class="answer" type="radio"
														name="${quiz.quiz_num}" value="1" />
												</c:otherwise>
											</c:choose> <label for="answer${cntQuiz}_1">${quiz.quiz_1} </label></li>
										<li><c:choose>
												<c:when test="${logVo.test_answer.get(cntQuiz-1)[1]==2}">
													<input id="answer${cntQuiz}_2" class="answer" type="radio"
														name="${quiz.quiz_num}" value="2" checked="checked" />
												</c:when>
												<c:otherwise>
													<input id="answer${cntQuiz}_2" class="answer" type="radio"
														name="${quiz.quiz_num}" value="2" />
												</c:otherwise>
											</c:choose> <label for="answer${cntQuiz}_2">${quiz.quiz_2} </label></li>
										<li><c:choose>
												<c:when test="${logVo.test_answer.get(cntQuiz-1)[1]==3}">
													<input id="answer${cntQuiz}_3" class="answer" type="radio"
														name="${quiz.quiz_num}" value="3" checked="checked" />
												</c:when>
												<c:otherwise>
													<input id="answer${cntQuiz}_3" class="answer" type="radio"
														name="${quiz.quiz_num}" value="3" />
												</c:otherwise>
											</c:choose> <label for="answer${cntQuiz}_3">${quiz.quiz_3} </label></li>
										<li><c:choose>
												<c:when test="${logVo.test_answer.get(cntQuiz-1)[1]==4}">
													<input id="answer${cntQuiz}_4" class="answer" type="radio"
														name="${quiz.quiz_num}" value="4" checked="checked" />
												</c:when>
												<c:otherwise>
													<input id="answer${cntQuiz}_4" class="answer" type="radio"
														name="${quiz.quiz_num}" value="4" />
												</c:otherwise>
											</c:choose> <label for="answer${cntQuiz}_4">${quiz.quiz_4} </label></li>
									</ul>
								</div>
								<c:set var="cntQuiz" value="${cntQuiz+1}" />
							</c:forEach>
						</c:forEach>
						<span id="answer_string" class="hidden">${answer_string}</span>
					</div>
					<!-- //content_area -->
					<!-- move_area -->
					<div id="move_area" class="q_area manual_item">
						<div id="gbtn">
							<c:set var="cntBtn" value="1" />
							<c:forEach var="quizArrayListSubject" items="${quizList}"
								varStatus="listNo">
								<c:forEach var="quiz" items="${quizArrayListSubject}"
									varStatus="quizSubjectNo">
									<c:if test="${quizSubjectNo.index==0}">
										<div class="subject_box">${quiz.quiz_subject}</div>
									</c:if>
									<c:choose>
										<c:when test="${logVo.test_answer.get(cntBtn-1)[1]==0}">
											<input type="button" class="go_btn" value="${quiz.quiz_num}"
												id="gbtn${quiz.quiz_num}" name="${cntBtn}">
										</c:when>
										<c:otherwise>
											<input type="button" class="go_btn is"
												value="${quiz.quiz_num}" id="gbtn${quiz.quiz_num}"
												name="${cntBtn}">
										</c:otherwise>
									</c:choose>
									<c:if test="${quiz.quiz_num%5==0}">
										<br>
									</c:if>
									<c:set var="cntBtn" value="${cntBtn+1}" />
								</c:forEach>
							</c:forEach>
						</div>
						<!-- btn_area2 -->
						<p id="btn_area2" class="btn_area">
							<span id="prev" class="btn left-btn  manual_item">◀ 이전</span> <span
								id="next" class="btn right-btn">다음 ▶</span>
						</p>
						<!-- //btn_area2 -->
					</div>
					<!-- //move_area -->
					<div id="btn_area1" class="btn_area">
						<input type="button" class="btn" value="제출"
							onclick="location.href='${contextPath}/test/resultTest.do?submit=Y&log_seq=${logVo.log_seq}'">
						<input type="button" class="btn" value="시험 재선택"
							onclick="location.href='${contextPath}/test/selectTest.do'">
					</div>
				</fieldset>
				<!-- //fieldset -->
			</form>
			<!-- //quiz_form -->
		</div>
		<!-- //content_wrap -->
	</section>
	<!--//section-->
	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
	<!-- //footer -->
	<script type="text/javascript"
		src="${contextPath}/Category/Test/js/testTakeAjax.js"></script>
</body>
</html>