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
    <title>find ID</title>
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
    <link rel="stylesheet" href="./css/find_id.css">
    <script language="javascript">
        // 인증번호 맞으면 다음 절차로 페이지이동 
        function numberCheck(){
            if($('.numConfirm').val()==456123){
            	
            	frmfindid.method="post";
    			frmfindid.action="${contextPath}/login/findid.do";
    			frmfindid.submit();
                
            }else if($('.numConfirm').val()!=456123){
                alert('인증번호가 다릅니다.');
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
            <h1 id="main_logo">
                <a href="./index.html" title="title"><img src="http://placehold.it/150x70" alt="title"></a>
            </h1>
            <!--//main_logo-->
            <!--main_gnb-->
            <div id="main_gnb">
                <ul class="gnb">
                    <li class="gnb_list gnb_0">
                        <h2><a href="javascript:;" title="시험안내">시험안내</a></h2>
                    </li>
                    <li class="gnb_list gnb_1">
                        <h2><a href="./Member/Lee/index.html" title="교재구매">교재구매</a></h2>
                        <ul class="menu">
                            <a href="./Member/Lee/index.html" title="구매목록"><li>구매목록</li></a>
                            <a href="./Member/Lee/cart.html" title="장바구니"><li>장바구니</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_2">
                        <h2><a href="./Member/An/selectOption.html" title="문제유형">문제유형</a></h2>
                    </li>
                    <li class="gnb_list gnb_3">
                        <h2><a href="javascript:;" title="커뮤니티">커뮤니티</a></h2>
                        <ul class="menu">
                            <a href="javascript:;" title="공지사항"><li>공지사항</li></a>
                            <a href="javascript:;" title="자유 게시판"><li>자유 게시판</li></a>
                            <a href="javascript:;" title="질문 게시판"><li>질문 게시판</li></a>
                        </ul>
                    </li>
                    <li class="gnb_list gnb_4">
                        <h2><a href="./Member/Jeong/PrivacyPolicyStatement.html" title="고객센터">고객센터</a></h2>
                        <ul class="menu">
                            <a href="./Member/Jeong/PrivacyPolicyStatement.html" title="개인정보보호정책"><li>개인정보보호정책</li></a>
                            <a href="./Member/Jeong/accessTerms.html" title="이용약관"><li>이용약관</li></a>
                            <a href="./Member/Jeong/sitemap.html" title="사이트맵"><li>사이트맵</li></a>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--//main_gnb-->
            <!--top_menu-->
            <div id="top_menu">
                <ul class="on">
                    <li><a href="javascript:;" title="회원가입">회원가입</a></li>
                    <li><a href="javascript:;" title="로그인">로그인</a></li>
                    <li><a href="javascript:;" title="사이트맵">사이트맵</a></li>
                </ul>
                <ul>
                    <li><a href="javascript:;" title="회원정보">회원정보</a></li>
                    <li><a href="javascript:;" title="로그아웃">로그아웃</a></li>
                    <li><a href="javascript:;" title="사이트맵">사이트맵</a></li>
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
                    <a href="../Jeong/PrivacyPolicyStatement.html"><li>개인정보보호정책</li></a>
                    <a href="../Jeong/accessTerms.html"><li>이용약관</li></a>
                    <a href="../Jeong/sitemap.html"><li>사이트맵</li></a>
                </ul>
                <img class="bottom" src="./images/image_support/left_t08.gif"/>
            </div>
        </div>
    <!--Find_ID-->
    <div id="find_id_wrap">
        <div class="id_img">
            <img src="./images/id.png" >
        </div>
        
        <form name="frmfindid" method="post"  encType="UTF-8">
            <p class="name">이름   <input type="text" name="name" ></p><br>
            <p class="mail_add">이메일 주소  
                <input type="email" name="email">
                <button>인증번호 보내기</button>
            </p>
            <p class="numcheck" >
                <input type="text" class="numConfirm">
                <input type='button' onclick='numberCheck()' value='인증번호확인'/>
            </p></br>
        </form>
        <hr>
        <p>●  비밀번호를 찾으시나요?  <a href="#">비밀번호 찾기 〉</a></p>
        </div>
        <!--//Find_ID-->
    </section>
    <!--//section-->
    <!--main_footer-->
    <footer id="main_footer">
        <img src="./images/bottom_long_bar.gif">
        <ul>
            <li><a href="../Jeong/accessTerms.html"><img src="./images/footer_menu_2.gif"/></a></li><li>|</li>
            <li><a href="../Jeong/PrivacyPolicyStatement.html"><img src="./images/footer_menu_3.gif"/></a></li><li>|</li>
            <li><a href="#"><img src="./images/footer_menu_4.gif"/></a></li><li>|</li>
            <li><a href="#"><img src="./images/footer_menu_5.gif"/></a></li><li>|</li>
            <li><a href="../Jeong/sitemap.html"><img src="./images/footer_menu_6.gif"/></a></li>
        </ul>
        <hr/>
    </footer>
    <!--//main_footer-->
</body>
</html>