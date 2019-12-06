<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Main Page</title>
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${contextPath}/css/main.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${contextPath}/js/main.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" flush="false"/>
    <!--main_image-->
    <div id="main_image">
        <img src="${contextPath}/images/main_BtnL.png" alt="left" class="left_Btn">
        <img src="${contextPath}/images/main_BtnR.png" alt="right" class="right_Btn">
        <div class="book_image">
            <ul>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_01.jpg" alt="book_1"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_02.jpg" alt="book_2"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_03.jpg" alt="book_3"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_04.jpg" alt="book_4"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_05.jpg" alt="book_5"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_06.jpg" alt="book_6"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_07.jpg" alt="book_7"></li>
                <li><img src="${contextPath}/Category/Book/images/buybook/img_book_08.jpg" alt="book_8"></li>
            </ul>
        </div> 
    </div>
    <!--//main_image-->
    <!--main_first_section-->
    <section id="main_first_section">
        <!--main_login-->
		<c:choose>
			<c:when test="${isLogon}">
				<div id="main_logout">
		            <div>
		                <p><strong>${loginId}</strong> 님 환영합니다.</p>
		                <a href="../mypage/mypage.do">내정보</a>
		                <a href="../logout/logout.do" title="로그아웃">로그아웃</a>
		                <a href="../book/cart.do" title="장바구니">장바구니</a>
		            </div>
		        </div>
			</c:when>
			<c:otherwise>
				<div id="main_login">
		            <a href="../form/login_form.do" title="login"><div class="loginBtn">로그인</div></a>
		            <a href="../form/signup_form.do" title="assign"><div class="assignBtn">회원가입</div></a>
		        </div>
			</c:otherwise>
		</c:choose>
        <!--//main_login-->
        <!--main_table-->
        <div id="main_table">
            <ul class="row first">
                <li class="item_0">마감일</li>
                <li class="item_1">접수기간</li>
                <li class="item_2">시험일</li>
                <li class="item_3">성적발표일</li>
            </ul>
            <ul class="line"></ul>
            <ul class="row second">
                <li class="item_0">D-0</li>
                <li class="item_1">2019-11-11(월)~2019-11-13(수)</li>
                <li class="item_2">2019-12-23(월)</li>
                <li class="item_3">2019-12-30(월)</li>
            </ul>
        </div>
        <!--//main_table-->
    </section>
    <!--//main_first_section-->
    <!--main_second_section-->
    <section id="main_second_section">
        <article class="link">
            <ul>
	            <li><a href="javascript:;" class="alert_ready" title="시험안내"><img src="${contextPath}/images/main_img_01.jpg" alt="시험안내"/></a></li>
				<c:choose>
					<c:when test="${isLogon}">
	            	    <li><a href="../test/checkLog.do" title="문제유형"><img src="${contextPath}/images/main_img_02.jpg" alt="문제유형"/></a></li>
	                	<li><a href="../book/buybook.do" title="교재구매"><img src="${contextPath}/images/main_img_03.jpg" alt="교재구매"/></a></li>
	            	</c:when>
					<c:otherwise>
	                	<li><a href="javascript:logoff();" title="문제유형"><img src="${contextPath}/images/main_img_02.jpg" alt="문제유형"/></a></li>
	            	    <li><a href="javascript:logoff();" title="교재구매"><img src="${contextPath}/images/main_img_03.jpg" alt="교재구매"/></a></li>				
					</c:otherwise>
				</c:choose>
				<li><a href="../board/questionList.do" title="질문 게시판"><img src="${contextPath}/images/main_img_04.jpg" alt="질문 게시판"/></a></li>
            </ul>
        </article>
    </section>
    <!--//main_second_section-->
    <!--main_third_section-->
    <section id="main_third_section">
        <article class="articles">
        	<h2 class="title">공지사항<a href="../board/noticeList.do" title="공지사항">더보기</a></h2>
        	<ul class="list">
	        	<c:choose>
	        		<c:when test="${empty noticeList}">
	        			<p align="center">
							<b><span>등록된 글이 없습니다.</span></b>
						</p>
	        		</c:when>
	        		<c:otherwise>
	        			<c:forEach items="${noticeList}" var="notice">
							<li><a href="../board/readPost.do?board_category=notice_List&num=${notice.num}"><span class="title">${notice.title}</span><span class="day">${notice.writeDate}</span></a></li>
	        			</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
        	</ul>
        </article> 
        <article class="articles">
            <h2 class="title">자유 게시판<a href="../board/communityList.do" title="자유 게시판">더보기</a></h2>
            <ul class="list">
				<c:choose>
	        		<c:when test="${empty communityList}">
	        			<p align="center">
							<b><span>등록된 글이 없습니다.</span></b>
						</p>
	        		</c:when>
	        		<c:otherwise>
	        			<c:forEach items="${communityList}" var="commu">
							<li><a href="../board/readPost.do?board_category=community_List&num=${commu.num}"><span class="title">${commu.title}</span><span class="day">${commu.writeDate}</span></a></li>
	        			</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
            </ul>
        </article> 
        <article class="articles">
            <h2 class="title">질문 게시판<a href="../board/questionList.do" title="질문 게시판">더보기</a></h2>
            <ul class="list">
				<c:choose>
	        		<c:when test="${empty questionList==null}">
	        			<p align="center">
							<b><span>등록된 글이 없습니다.</span></b>
						</p>
	        		</c:when>
	        		<c:otherwise>
	        			<c:forEach items="${questionList}" var="quest">
							<li><a href="../board/readPost.do?board_category=question_List&num=${quest.num}"><span class="title">${quest.title}</span><span class="day">${quest.writeDate}</span></a></li>
	        			</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
            </ul>
        </article> 
    </section>
    <!--//main_third_section-->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
</body>
</html>