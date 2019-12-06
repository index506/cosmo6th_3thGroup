<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="lnb">
    <div>
        <img class="top" src="../images/image_support/sideTitle_community.jpg"/>
        <ul>
        	<c:choose>
        		<c:when test="${ board_category eq  'notice_List' }">
					<li><a href="${contextPath}/board/noticeList.do" class="on">공지사항</a></li>
					<li><a href="${contextPath}/board/communityList.do">자유 게시판</a></li>
					<li><a href="${contextPath}/board/questionList.do">질문 게시판</a></li>
				</c:when>
				<c:when test="${ board_category eq  'community_List' }">
					<li><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
					<li><a href="${contextPath}/board/communityList.do" class="on">자유 게시판</a></li>
					<li><a href="${contextPath}/board/questionList.do">질문 게시판</a></li>
			  	</c:when>
				<c:when test="${ board_category eq  'question_List' }">
					<li><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
					<li><a href="${contextPath}/board/communityList.do">자유 게시판</a></li>
					<li><a href="${contextPath}/board/questionList.do" class="on">질문 게시판</a></li>
            	</c:when>
            </c:choose>
        </ul>
        <img class="bottom" src="../images/image_support/left_t08.gif"/>
    </div>
</div>