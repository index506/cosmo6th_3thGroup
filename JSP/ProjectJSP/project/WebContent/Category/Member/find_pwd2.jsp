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
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/find_pwd.css"/>
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/init.css"/>
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/main.css"/>
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/lnb.css"/>
    <link rel="stylesheet" href="${contextPath}/Category/Member/css/support.css"/>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/Category/Member/js/prefixfree.min.js"></script>

    <title>Find Password2</title>
    <script language="javascript">
        var min = 100000, max = 999999;
        var randomNum = function(min, max){
            var ranNum = Math.floor(Math.random()*(max-min+1))+min;
            return ranNum;
        }
        function confirm(){
            if($('.confirmNum').val()==456123){
            	window.location.href="reset_pwd.jsp";
            }else if($('.confirmNum').val()!=456123){              	
            	alert("인증번호가 틀립니다.");           	
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
    <!--find_password-->
    <form action="">
    <div class="pwd2_wrap">
        <h2>본인 확인</h2>
        <p>E-mail로 인증하기 </p>
        <div class="certi_box">
            <p>회원 가입시 입력한 이메일을 적어주시면 인증번호를 보내드립니다.</p>
            
            <input type="email" placeholder="이메일을 입력해주세요. "><input type="button" onclick="certiNum();" value="인증번호 보내기"></br>

            <input type="text" class="confirmNum" ><input type="button" onclick="confirm();" value="인증번호 확인" >

        </div>
    </div>
    </form>
    <!--//find_password-->
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
