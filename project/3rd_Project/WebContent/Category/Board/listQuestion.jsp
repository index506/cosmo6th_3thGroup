<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>질문 게시판</title>
	<!-- 철욱 -->
	<link rel="stylesheet" href="${contextPath}/css/init.css" />
	<link rel="stylesheet" href="${contextPath}/css/common.css" />
	<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
	<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
	<script type="text/javascript" src="${contextPath}/js/common.js"></script>
	<!-- //철욱 -->
	<link rel="stylesheet "href="${contextPath}/Category/Board/css/myCommon.css" />
	<link rel="stylesheet" href="${contextPath}/Category/Board/css/postCommon.css" />
	<link rel="stylesheet" href="${contextPath}/Category/Board/css/postList.css" />
	<script type="text/javascript" src="${contextPath}/Category/Board/js/board.js"></script>
	<script type="text/javascript" src="${contextPath}/Category/Board/js/postList.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	<!-- //header -->
	<!--section-->
	<!--section-->
	<section>
		<!-- lnb -->
		<div class="lnb">
			<div>
				<img class="top"
					src="../images/image_support/sideTitle_community.jpg" />
				<ul>
					<li><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
					<li><a href="${contextPath}/board/communityList.do">자유 게시판</a></li>
					<li><a href="${contextPath}/board/questionList.do" class="on">질문 게시판</a></li>
				</ul>
				<img class="bottom" src="../images/image_support/left_t08.gif" />
			</div>
		</div>
		<!-- //lnb -->
		<!-- board_wrap -->
		<div class="board_wrap">
			<!-- board_title -->
			<div class="board_title">
				<h3>질문 게시판</h3>
			</div>
			<!-- //board_title -->
			<!-- board_search -->
			<form name="frm_search" class="board_search" action="${contextPath}/board/questionList.do">
				<span> 
					<c:choose>
						<c:when test="${ search_option eq 'title' or empty search_option or search_option == 'null' }">
							<input type="radio" name="search_option" id="serach_title" value="title" checked>
						</c:when>
						<c:otherwise>
							<input type="radio" name="search_option" id="serach_title" value="title">
						</c:otherwise>
					</c:choose>
					<label for="serach_title">제목</label> 
					<c:choose>
						<c:when test="${ search_option eq 'content'}">
							<input type="radio" name="search_option" id="serach_content" value="content" checked>
						</c:when>
						<c:otherwise>
							<input type="radio" name="search_option" id="serach_content" value="content">
						</c:otherwise>
					</c:choose>
					<label for="serach_content">내용</label> 
					<c:choose>
						<c:when test="${ search_option eq 'id'}">
							<input type="radio" name="search_option" id="serach_id" value="id" checked>
						</c:when>
						<c:otherwise>
							<input type="radio" name="search_option" id="serach_id" value="id">
						</c:otherwise>
					</c:choose>
					<label for="serach_id">작성자</label>
					<input type="text" name="search_value" value="${ search_value }"> 
					<input type="submit" class="btn white small" value="검색" onclick="return search_check();">
				</span>
			</form>
			<!-- //board_search -->
			<!-- postList -->
			<table class="post_list">
				<thead>
					<tr>
						<th width="7.5%">번호</th>
						<th width="50%">제목</th>
						<th width="15%">작성자</th>
						<th width="15%">작성일</th>
						<th width="7.5%">조회</th>
						<th width="5%">파일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty postsList}">
							<tr>
								<td colspan="6" align="center">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${postsList}" var="postVO">
								<tr>
									<td>
										<c:if test="${postVO.level == 1 }">
											<span>${postVO.num}</span>
										</c:if>
									</td>
									<td align="left">
				                  		<c:if test="${postVO.level > 1}"> 
				                  			<c:forEach begin="2" end="${postVO.level}">
				                  				<span style="padding-left:10px"></span>
				                  			</c:forEach>
				                  			<span><b>┗</b></span>
				                  		</c:if>
			                  			 <a href="${contextPath}/board/readPost.do?board_category=${board_category}&now_pnum=${ param.now_pnum }&num=${postVO.num}&search_option=${search_option}&search_value=${search_value}">${postVO.title}</a>
				                  	</td>
									<td>${postVO.id}</td>
									<td><fmt:formatDate value="${postVO.writeDate}" /></td>
									<td>${postVO.readcount}</td>
									<td>
										<c:if test="${not empty postVO.fileName && postVO.fileName!='null' }">
					        				<a href="${contextPath}/download.do?board_category=${board_category}&num=${postVO.num}&downFileName=${postVO.fileName}">F</a>
					        			</c:if>
				        			</td>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!-- //postList -->
			<c:if test="${!empty postsList}">
			<!-- board_paging -->
			<div class="board_paging">
				<ul>${paging}</ul>
			</div>
			<!-- //board_paging -->
			</c:if>
			<!-- board_button -->
			<div class="board_button">	
				<c:if test="${ id != null }">
					<input type="button" class="btn green" value="글쓰기" 
						onclick="go_write('${contextPath}','writePostForm.do','${board_category}','${ param.now_pnum }','${ param.search_option }','${param.search_value}');">
				</c:if>
			</div>
			<!-- //board_button -->
		</div>
		<!-- //board_wrap -->
	</section>
	<!--//section-->
	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
	<!-- //footer -->
</body>
</html>