<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${head_title}</title>
    <!-- 철욱 -->
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
     <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script> 
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <!-- //철욱 -->
    <link rel="stylesheet" href="${contextPath}/Category/Board/css/myCommon.css" />
	<link rel="stylesheet" href="${contextPath}/Category/Board/css/postCommon.css" />
    <link rel="stylesheet" href="${contextPath}/Category/Board/css/postRead.css"/>
    <script type="text/javascript" src="${contextPath}/Category/Board/js/board.js"></script> 
    <script type="text/javascript" src="${contextPath}/Category/Board/js/postForm.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	<!-- //header -->	
    <!--section-->
    <!--section-->
    <section>
    	<!-- lnb -->
        <%@include file="lnb.jsp"%>
        <!-- //lnb -->
        <!-- board_wrap -->
        <div class="board_wrap">
        	<!-- board_title -->
        	<div class="board_title">
        		<h3>${head_title}</h3>
        	</div>
        	<!-- //board_title -->
        	<!-- read_table -->
        	<table class="read_table">
        		<thead>
					<tr class="title">
						<th align="left" colspan="3" width="80%"><h4>${postVO.title}</h4></th>
						<th align="right" width="20%"><span>조회수</span> ${postVO.readcount}</>
					</tr>
					<tr>
						<th align="left" colspan="3" width="50%"><span>작성자</span> ${postVO.id}</th>
						<th align="right" colspan="1" width="50%"><span>작성일</span> ${postVO.writeDate}</th>
					</tr>
        		</thead>
        		<tbody>
        			<c:if test="${not empty postVO.imageName && postVO.imageName!='null' }">
	        			<tr class="image">
	        				<td align="center" colspan="4">
	        					<img src="${contextPath}/download.do?board_category=${board_category}&num=${postVO.num}&downFileName=${postVO.imageName}"/><br>
	        				</td>
	        			</tr>
        			</c:if>
        			<tr class="content">
        				<td align="left" colspan="4">${postVO.content}</td>
        			</tr>
        			<c:if test="${not empty postVO.fileName && postVO.fileName!='null' }">
	        			<tr class="file">
	        				<td align="right" colspan="4"><span>첨부파일</span> <a href="${contextPath}/download.do?board_category=${board_category}&num=${postVO.num}&downFileName=${postVO.fileName}">${postVO.fileName}</a></td>
	        			</tr>
        			</c:if>
				</tbody>
				<tfoot>
					<c:if test="${postPNArr[0].num != 0 and postPNArr[0].num != null}">
						<tr>
	        				<td align="center" width="15%">
	        					<a href="${contextPath}/board/readPost.do?board_category=${board_category}&num=${postPNArr[0].num}">
	        						<b>▲</b> 이전글
	        					</a>
	        				</td>
	        				<td align="left" colspan="3" width="85%">
	        					<a href="${contextPath}/board/readPost.do?board_category=${board_category}&num=${postPNArr[0].num}">
	        						${postPNArr[0].title}
	        					</a>
	        				</td>
	        			</tr>
        			</c:if>
        			<c:if test="${postPNArr[1].num != 0  and postPNArr[1].num != null}">
	        			<tr>
	        				<td align="center" width="15%">
	        					<a href="${contextPath}/board/readPost.do?board_category=${board_category}&num=${postPNArr[1].num}">
	        						<b>▼</b> 다음글
	        					</a>
	        				</td>
	        				<td align="left" colspan="3"  width="85%">
	        					<a href="${contextPath}/board/readPost.do?board_category=${board_category}&num=${postPNArr[1].num}">
	        						${postPNArr[1].title}
	        					</a>
	        				</td>
	        			</tr>
        			</c:if>
				</tfoot>
        	</table>
        	<!-- //read_table -->
        	<!-- board_button -->
        	<div class="board_button">	
        		<c:if test="${ loginUser.id !=null }">
					<input type="button" class="btn green" value="글쓰기" 
						onclick="go_write('${contextPath}','writePostForm.do','${board_category}','${ param.now_pnum }','${ param.search_option }','${param.search_value}');">
					<c:if test="${board_category eq 'question_List' and postVO.parentNum == 0}">
						<input type="button" class="btn green" value="답변"
						onclick="go_reply('${contextPath}','replyPostForm.do','${board_category}','${postVO.num}','${ param.now_pnum }','${ param.search_option }','${param.search_value}');">
					</c:if>
					<c:if test="${postVO.id eq loginUser.id}">
						<input type="button" class="btn green" value="수정"
							onclick="go_modify('${contextPath}','modifyPostForm.do','${board_category}','${postVO.num}','${ param.now_pnum }','${ param.search_option }','${param.search_value}');">
					</c:if>
					admi = ${ loginUser.admin }
					<c:if test="${postVO.id eq loginUser.id or loginUser.admin == 1 }">
						<input type="button" class="btn green" value="삭제"
							onclick="go_delete('${contextPath}','deletePost.do','${board_category}','${ postVO.num }');">  
					</c:if>
				</c:if>
					<input type="button" class="btn white" value="목록" 
						onclick="go_list('${contextPath}','${board_category}','${ param.now_pnum }','${ param.search_option }','${param.search_value}');">
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