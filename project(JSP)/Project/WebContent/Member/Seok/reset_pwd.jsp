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
    <link rel="stylesheet" href="./css/find_pwd.css"/>
    <link rel="stylesheet" href="./css/init.css"/>
    <link rel="stylesheet" href="./css/main.css"/>
    <link rel="stylesheet" href="./css/lnb.css"/>
    <link rel="stylesheet" href="./css/support.css"/>
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="./js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./js/prefixfree.min.js"></script>

    <title>Reset Password</title>
	<script type="text/javascript">
	//비밀번호 유효성 체크 정규식 
	//if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
    //    alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
    //    $('#password').val('').focus();
    //    return false;
    //}
		$(document).ready(function(){			
			$("#pwd_lbl").blur(function(){
				var value = $(this).val();				

				 
				// 영문/숫자조합 이외의 문자를 입력했을 때의 예외처리
				var reg1 = /^[a-z0-9]{8,16}$/; // a-z 0-9 중에 7자리 부터 14자리만 허용 한다는 뜻이구요
				var reg2 = /[a-z]/g;
				var reg3 = /[0-9]/g;
				if (reg1.test(value) && reg2.test(value)
						&& reg3.test(value)) {
					// regExp1.test(value) : input태그의 값이 정규표현식 일치하면 true, 일치하지 않으면 false를 반환
					$(this).next().text("");
				} else  {
					$(".hidden1").css('display','block').css('color','red');
					//$(this).val("");
					//$(this).next().text("영문/숫자조합 8~16자리를 입력해주세요.").css(
					//		'color', 'red');
				}
			});
			
			// 비밀번호 확인 input태그
			$("#pwd2_lbl").blur(function() {
				
				var pwd1 = $("#pwd_lbl").val();
				var pwd2 = $("#pwd2_lbl").val();

				if (pwd1 != pwd2) {
					$(".hidden2").css('display','block').css('color','red');
					//$(this).next().text("비밀번호가 일치하지 않습니다.").css('color', 'red');
					//$(this).val("");
				} else if (pwd1 == pwd2) {
					$(".hidden2").css('display','none');
					$(this).next().text("");
				}
			});
		});
		function pwdCheck(){
			var pwd1 = $("#pwd_lbl").val();
			var pwd2 = $("#pwd2_lbl").val();
			// 비밀번호 확인 input태그
			$("#pwd2_lbl").blur(function() {												
				if (pwd1 != pwd2) {
					$(".hidden2").css('display','block').css('color','red');
					//$(this).next().text("비밀번호가 일치하지 않습니다.").css('color', 'red');
					//$(this).val("");
				} 
			});
			if (pwd1 == pwd2) {
				alert("here");
				frmLogin.method="post";
    			frmLogin.action="${contextPath}/login/resetPWD.do";
    			frmLogin.submit();
    			$(this).next().text("");
			}
		}		
	</script>
</head>
<body>
<!--main_header_wrap-->
<div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <div id="main_logo">
                <a href="#"><img src="http://placehold.it/150x70" alt="iriver"/></a>
            </div>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="list">
                    <li class="item_0">
                        <a href="#"><p>시험안내</p></a>
                    </li>
                    <li class="item_1">
                        <a href="#"><p>교재구매</p></a>
                        <ul class="list hover">
                            <a href="#"><li class="item_0">구매목록</li></a>
                            <a href="#"><li class="item_1">장바구니</li></a>
                        </ul>
                    </li>
                    <li class="item_2">
                        <a href="#"><p>문제유형</p></a>
                    </li>
                    <li class="item_3">
                        <a href="#"><p>커뮤니티</p></a>
                        <ul class="list hover">
                            <a href="#"><li class="item_0">공지사항</li></a>
                            <a href="#"><li class="item_1">자유 게시판</li></a>
                            <a href="#"><li class="item_2">질문 게시판</li></a>
                        </ul>
                    </li>
                    <li class="item_4">
                        <a href="#"><p>고객센터</p></a>
                        <ul class="list hover">
                            <a href="#"><li class="item_0">Q&A</li></a>
                            <a href="#"><li class="item_1">개인정보보호정책</li></a>
                            <a href="#"><li class="item_2">이용약관</li></a>
                            <a href="#"><li class="item_3">사이트맵</li></a>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
                <ul class="list">
                    <a href="#"><li class="item_0"><p>회원가입</p></li></a>
                    <a href="./login_main.html"><li class="item_1"><p>로그인</p></li></a>
                    <a href="#"><li class="item_2"><p>FAQ</p></li></a>
                    <a href="#"><li class="item_3"><p>사이트맵</p></li></a>
                </ul>
            </div>
            <!--//top_menu-->
        </header>
        <!--//main_header-->
    </div>
    <!--//main_header_wrap-->
    <!--section-->
    <section>
        <div class="lnb">
            <div>
                <img class="top" src="./images/image_support/201508270312264232400.jpg"/>
                <ul>
                    <a href="#"><li>Q&A</li></a>
                    <a href="#"><li>개인정보보호정책</li></a>
                    <a href="#"><li>이용약관</li></a>
                    <a href="./sitemap.html"><li>사이트맵</li></a>
                </ul>
                <img class="bottom" src="./images/image_support/left_t08.gif"/>
            </div>
        </div>
    
    <div id="PPS" class="content">
    
    <!-- reset_password-->    
    <form method="post" name="frmLogin"  encType="UTF-8">
    <div class="pwd3_wrap">
        <h2>비밀번호 재설정</h2>
        <p>비밀번호 작성시 9~20자리 가능, 알파벳 소문자, 숫자, 특수기호 조합</p>
        <div class="repwd_box">
            <ul>
                <li class="clear">
                    <label for="pwd_lbl" class="tit_lbl">비밀번호</label>
                    <div class="pass">
                        <input type="password" class="w100p" id="pwd_lbl" maxlength="20" placeholder="비밀번호를 입력해주세요.">
                        <p class="hidden1">영문/숫자조합 8~16자리를 입력해주세요. </p>
                    </div>
                </li>
                <li class="clear">
                    <label for="pwd2_lbl" class="tit_lbl">비밀번호 확인</label>
                    <div class="pass">
                        <input type="password" class="w100p" id="pwd2_lbl" maxlength="20"
                        name="user_pwd" placeholder="다시 한번 입력해주세요.">
                    </div>
                    <p class="hidden2">비밀번호가 일치하지 않습니다.</p>
                </li>
            </ul>
            <hr>
            <button class="btn cancel" type="reset">취 소</button>
            <button class="btn confirm" onclick="pwdCheck();">비밀번호변경</button>
        </div>
    </div>
    </form>
    <!--//reset_password-->
    </div>
    
    </section>
    <!--//section-->
    <!--main_footer-->
    <footer id="main_footer">
        <img src="./images/bottom_long_bar.gif">
        <ul>
            <li><a href="#"><img src="./images/footer_menu_2.gif"/></a></li><li>|</li>
            <li><a href="#"><img src="./images/footer_menu_3.gif"/></a></li><li>|</li>
            <li><a href="#"><img src="./images/footer_menu_4.gif"/></a></li><li>|</li>
            <li><a href="#"><img src="./images/footer_menu_5.gif"/></a></li><li>|</li>
            <li><a href="#"><img src="./images/footer_menu_6.gif"/></a></li>
        </ul>
        <hr/>
    </footer>
    <!--//main_footer-->    
</body>
</html>