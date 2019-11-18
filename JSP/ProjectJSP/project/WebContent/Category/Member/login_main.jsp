<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- jstl을 사용하기 위한 디렉티브 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set> 
<%
    request.setCharacterEncoding("UTF-8"); //요청 받아온 글자 깨지지 안도록 UTF-8설정
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${contextPath}/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/css/common.css"/>
    <script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${contextPath}/js/common.js"></script>
    <!--개인 css, js-->
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/login.css">
	<script type="text/javascript" src="${contextPath}/Category/Member/js/LoginService.js"></script>
    <title>Login Page</title>
    <script>
    /* 로그인 유효성 검사  */
    	function login_validate(){
    		var frmLogin = document.frmLogin;
    		var user_id = frmLogin.user_id.value;
    		var user_pw = frmLogin.user_pw.value;
    		//var idRegExp = /^[a-z0-9]{4,20}$/;

    		//if(frmLogin.user_id.value==idRegExp){
    		//	alert("아이디는 영문자와 숫자 5~20자리로 입력해야합니다.");
    		//	frmLogin.user_id.value = "";
    		//	frmLogin.user_id.focus();
    		//}
    		if((user_id.length==0||user_id=="")||
    				(user_pw.length==0||user_pw=="")){
    			alert("ID와 PassWord는 필수입니다. ");
    			frmLogin.user_id.focus();
    		}else if(user_id.length<=4||user_id.length>=21){
    			alert("아이디는 5글자이상 20글자 이하만 입력가능합니다.");    			
    			frmLogin.user_id.focus();
    		}else if(user_pw.length<=7||user_pw.length>=17){
    			alert("비밀번호는 8글자이상 16글자 이하만 입력가능합니다.");
    			frmLogin.user_pw.focus();
    		}
    		//else if(user_id){
    			
    		//	frmLogin.user_id.value.replace(/\s/gi, "");
    		//	user_id.replace(/(^\s*)|(\s*$)/, '');
    		//}
    		//else if(document.frm.memberCheck.value!=true){
	   		//	alert("회원정보가 없습니다.");    			
    		//}
    		else{        			
    			frmLogin.method="post";
    			frmLogin.action="${contextPath}/login/loginCheck.do";
    			frmLogin.submit();
    		}
    	}
    /* 페이지 이동  */
        function member(){
            window.location.href="Member/An/postRead.html";
        };
        function id(){
            window.location.href="find_id.jsp";
        };
        function password(){
            window.location.href="find_pwd.jsp";
        };
    </script>
</head>
<body>
    <!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="../../index.html" title="title"><img src="${contextPath}/images/main.jpg" alt="title"></a>
            </h1>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="gnb">
                    <li class="gnb_list gnb_0">
                        <h2><a href="javascript:;" title="시험안내" class="alert_ready">시험안내</a></h2>
                    </li>
                    <li class="gnb_list gnb_1">
                        <h2><a href="../Lee/buybook.html" title="교재구매">교재구매</a></h2>
                        <ul class="menu">
                            <a href="../Lee/buybook.html" title="구매목록"><li>구매목록</li></a>
                            <a href="../Lee/cart.html" title="장바구니"><li>장바구니</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_2">
                        <h2><a href="../An/testSelect.html" title="문제유형">문제유형</a></h2>
                    </li>
                    <li class="gnb_list gnb_3">
                        <h2><a href="../Nam/Notice_List.html" title="커뮤니티">커뮤니티</a></h2>
                        <ul class="menu">
                            <a href="../Nam/Notice_List.html" title="공지사항"><li>공지사항</li></a>
                            <a href="../Nam/Community_List.html" title="자유 게시판"><li>자유 게시판</li></a>
                            <a href="../Nam/Question_List.html" title="질문 게시판"><li>질문 게시판</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_4">
                        <h2><a href="../Jeong/PrivacyPolicyStatement.html" title="고객센터">고객센터</a></h2>
                        <ul class="menu">
                            <a href="../Jeong/PrivacyPolicyStatement.html" title="개인정보보호정책"><li>개인정보보호정책</li></a>
                            <a href="../Jeong/accessTerms.html" title="이용약관"><li>이용약관</li></a>
                            <a href="../Jeong/sitemap.html" title="사이트맵"><li>사이트맵</li></a>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
                <ul class="on">
                    <li><a href="javascript:;" title="회원가입">회원가입</a></li>
                    <li><a href="../Seok/login_main.html" title="로그인">로그인</a></li>
                    <li><a href="../Jeong/sitemap.html" title="사이트맵">사이트맵</a></li>
                </ul>
                <ul>
                    <li><a href="../Jeong/mypage.html" title="회원정보">회원정보</a></li>
                    <li><a href="javascript:;" title="로그아웃">로그아웃</a></li>
                    <li><a href="../Jeong/sitemap.html" title="사이트맵">사이트맵</a></li>
                </ul>
            </div>
            <!--//top_menu-->
        </header>
        <!--//main_header-->
    </div>
    <!--//main_header_wrap-->
    <!--section-->
    <section>
        
    <!--Login-->
    <form name="frmLogin" method="post"  encType="UTF-8" >
    <div class="loginWrap" >
    <div align="center">
        <a href="javascript:window.location.reload();"><img src="${contextPath}/Category/Member/images/login_logo.png" title="mainPic"></a>
    </div>
    <input class="login_id" placeholder="   아이디" maxlength="20"
    type="text" required="required" name="user_id"><br>
    <input class="login_pwd" placeholder="   비밀번호" maxlength="17" 
    type="password" required="required" name="user_pw">
    <hr class="loginhr">
    <p class="btn_login">
        <a  href="javascript:login_validate();">로그인</a>        
    </p>

    <div class="buttonwrap">
        <div class="memberbutton"><a href="${contextPath}/Member/An/postRead.html" ><img src="${contextPath}/images/login_b_12.gif" title="회원가입"></a></div>
        <div class="idsearch"><a href="find_id.jsp"><img src="${contextPath}/images/login_b_15.gif" title="id 찾기"></a></div>
        <div class="pwdsearch"><a href="find_pwd.jsp"><img src="${contextPath}/images/login_b_17.gif" title="비밀번호 찾기"></div>
    </div>
    </div>
    </form>
    <!--//Login-->
    
</section>
<!--//section-->
<!--main_footer-->
<footer id="main_footer">
    <img src="./images/bottom_long_bar.gif">
    <ul>
        <li><a href="../Jeong/accessTerms.html"  title="이용약관"><img src="./images/footer_menu_2.gif" alt="이용약관"/></a></li><li>|</li>
        <li><a href="../Jeong/PrivacyPolicyStatement.html" title="개인정보취급방침"><img src="./images/footer_menu_3.gif" alt="개인정보취급방침"/></a></li><li>|</li>
        <li><a href="#" class="alert_ready"><img src="./images/footer_menu_4.gif" alt="이메일주소무단수집거부"/></a></li><li>|</li>
        <li><a href="#" class="alert_ready"><img src="./images/footer_menu_5.gif" alt="Contact us"/></a></li><li>|</li>
        <li><a href="../Jeong/sitemap.html" title="사이트맵"><img src="./images/footer_menu_6.gif" alt="사이트맵"/></a></li>
    </ul>
    <hr/>
</footer>
<!--//main_footer-->    
</body>
</html>