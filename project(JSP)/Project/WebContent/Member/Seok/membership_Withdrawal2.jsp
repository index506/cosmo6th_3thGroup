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

    <link rel="stylesheet" href="./css/Withdrawal_1.css"/>
    
    <script type="text/javascript">
    function mv_cancle(){
    	if (confirm("정말 취소하시겠습니까??") == true){
    	    window.location.href="${contextPath}/index.jsp";
    	}else{//취소
    	    return;
    	}
    	}
    function withdrawal(){
    	if (confirm("정말 회원 탈퇴하시겠습니까??") == true){
    	    window.location.href="${contextPath}/index.jsp";
    	}else{//취소
    	    return;
    	}
    	}	
    </script>
    <title>회원탈퇴신청</title>
</head>
<body>
    <!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="${contextPath}/index.html" title="title"><img src="http://placehold.it/150x70" alt="title"></a>
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
        <div id="PPS" class="content">
              
    <!--회원탈퇴-->
    <div class="outWrap">
    <div class="line">
    <h2 class="t_memout"><span>회원 탈퇴</span></h2>
    </div>
    <br>
    <div class="textalert">
        <span> | "회원 탈퇴 후 재가입시에는 신규회원가입으로 처리되어 탈퇴 전의 회원 정보는 복구 되지 않습니다."</span>
    </div>
    <div>
        <h3 class="h_text">
            <span>서비스 이용 중 불편사항을 선택해주세요.(복수선택가능)</span>
        </h3>
    </div>
    <div class="combine_box">
        <ul class="list_check">
            <li><input title="checkbox" type="checkbox" value="01"><label for="chk1">이용빈도 낮음</label></li>
            <li><input title="checkbox" type="checkbox" value="02"><label for="chk1">개인정보유출</label></li>
            <li><input title="checkbox" type="checkbox" value="03"><label for="chk1">자료 부족</label></li>
            <li><input title="checkbox" type="checkbox" value="04"><label for="chk1">기타</label></li>
        </ul>
    </div>
    <div>
        <h3 class="h_text">
            <span>그 이외에 남기고 싶으신 의견이 있으시면 기재해주세요.</span>
        </h3>
    </div>
    <div>
        <textarea title="textarea" cols="80" rows="7" ></textarea>
    </div>
    <div class="btn">
        <a href="javascript:withdrawal();">
            <span>회원 탈퇴 신청</span>
        </a>
        <a href="javascript:mv_cancle();">
            <span>취소</span>
        </a>
    </div>
    </div>
    <!--//회원탈퇴-->
</div>
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