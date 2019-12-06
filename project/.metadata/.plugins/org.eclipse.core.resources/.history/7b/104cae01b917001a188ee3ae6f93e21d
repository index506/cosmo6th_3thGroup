<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
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
    <link rel="stylesheet" href="${contextPath}/Category/Board/css/postForm.css"/>
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
        <div class="lnb">
            <div>
                <img class="top" src="../images/image_support/sideTitle_community.jpg"/>
                <ul>
                    <li><a href="${contextPath}/board/noticeList.do" class="on">공지사항</a></li>
                    <li><a href="${contextPath}/board/communityList.do">자유 게시판</a></li>
                    <li><a href="${contextPath}/board/questionList.do">질문 게시판</a></li>
                </ul>
                <img class="bottom" src="../images/image_support/left_t08.gif"/>
            </div>
        </div>
        <!-- //lnb -->
         <!-- board_wrap -->
        <div class="board_wrap">
        	<!-- board_title -->
        	<div class="board_title">
        		<h3>${head_title}&nbsp;&nbsp;-&nbsp;&nbsp; 글 수정하기 </h3>
        	</div>
        	<!-- //board_title -->
			<form class="post_form" method="post" enctype="multipart/form-data" 
				action="${contextPath}/board/modifyPostRegister.do?board_category=${board_category}" >
				<fieldset>
					<input type="hidden" name="num" value="${ postVO.num }">
				</fieldset>
				<fieldset>
					<legend>글 수정하기</legend>
					<!-- form_table -->
					<table class="form_table">
						<tbody>
							<tr class="title">
								<th>제목</th>
								<td><input type="text" size="50"  name="title" maxlength="30" value="${postVO.title}" placeholder="제목"></td>
							</tr>
							<tr class="content">
								<th>내용</th>
								<td><textarea name="content" maxlength="500" placeholder="내용" >${postVO.content}</textarea></td>
							</tr>
							<tr class="image">
								<th>이미지</th>
								<td><input type="file" name="imageName" onchange="readURL(this);" accept="image/*"></td>
							</tr>
							<tr class="image">
								<th>이미지</th>
								<td><img src="${contextPath}/download.do?board_category=${board_category}&num=${postVO.num}&downFileName=${postVO.imageName}" onerror="this.src='${contextPath}/Category/Board/images/preview.png'" id="preview"  /><br></td>
							</tr>
							<tr class="file">
								<th>파일</th>
								<td><input type="file" name="fileName"></td>
							</tr>
						</tbody>
					</table>
					<!-- //form_table -->
					<input  type= "hidden"   name="originalImageName" value="${postVO.imageName }" />
					<input  type= "hidden"   name="originalFileName" value="${postVO.fileName }" />
				</fieldset>
			<!-- board_button -->
			<div class="board_button">	
				<input type="submit" class="btn green" value="등록">
				<input type="button" class="btn white" value="목록" 
					onclick="go_list('${contextPath}','${board_category}','${ param.now_pnum }','${ param.search_option }','${param.search_value}');">
			</div>
			<!-- //board_button -->
			</form>
        </div>
        <!-- //board_wrap -->
    </section>
    <!--//section-->
    <!-- footer -->
    <%@include file="/WEB-INF/view/footer.jsp"%>
    <!-- //footer -->
</body>
</html>