<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보 변경</title>
    <style>
   	
	.textmove{	
	width:80%;
	height:100%;
	}
	 table  {
	 	width:75%;
	 	border-collapse: separate;
  		border-spacing: 0 12px;
        border: 1px solid #bcbcbc;        
      }
     th, td{
     	cellpadding:5px;
      	border:none;
      }      
	</style>
    <link rel="stylesheet" href="css/init.css"/>
    <link rel="stylesheet" href="css/common.css"/>
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/prefixfree.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/modify.js"></script>
    <script type="text/javascript" src="js/number.js"></script>
    <script type="text/javascript" src="js/hangul.js"></script>
    <script type="text/javascript" src="js/cancel.js"></script>
    <script type="text/javascript" src="js/alphanumber.js"></script>
    <link rel="stylesheet" href="css/add.css"/>
</head>
<body>
    <!--main_header_wrap-->
    <div id="main_header_wrap">
        <!--main_header-->
        <header id="main_header">
            <!--main_logo-->
            <h1 id="main_logo">
                <a href="../../index.html" title="title"><img src="http://placehold.it/150x70" alt="title"></a>
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
                    <li><a href="../Yoo/Membership Join.html" title="회원가입">회원가입</a></li>
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
                    <a href="../Yoo/Membership Modify.html"><li>회원정보</li></a>
                    <a href="../Seok/find_id.html"><li>아이디 찾기</li></a>
                    <a href="../Seok/find_pwd.html"><li>비밀번호 찾기</li></a>
                    <a href="../Seok/membership_Withdrawal.html"><li>회원 탈퇴</li></a>
                </ul>
                <img class="bottom" src="./images/image_support/left_t08.gif"/>
            </div>
        </div>
        <form name="frm">
			<table > 
				<tr>
				<th>아이디 <th><input type="text" class="textmove" name="id" placeholder="영문/숫자조합  8~15자리" value="Daniel12" readonly></th>
				</tr>
				<tr>
				
				<tr>
				<th>이름<th><input type="text" id="hangul" name="name" class="textmove" maxlength="15"></th>
				</tr>
				<tr>
				<th>이메일<th><input type="email" name="email" id="email" class="textmove"></th>
				</tr>
				<tr>
				<th>주소<th><input type="text" name="adress" class="textmove"></th>
				</tr>
				<tr>
				<th>집 전화<th><input type="text" class="onlyNumber textmove"  name="home" size=35 maxlength="11" placeholder="'-'을 제외한 집전화번호를 입력해 주세요" style="ime-mode disabled"  ></th>
				</tr>
				<tr>
				<th>휴대전화<th><input type="text" class="onlyNumber textmove" name="phone" size=35 maxlength="11" placeholder=" '-'을 제외한 휴대폰번호를 입력해 주세요" style="ime-mode disabled"  ></th>
				</tr>
				<tr>
				<td colspan="2" align ="center" border="none">
				<input type="button" alt="변경" value="정보 변경" onclick="joinCheck1();" style="margin-right:15px; width:15%; height:100%;" />
				<input type="reset" alt="취소" value="취소" onclick="cancel();" style="width:15%; height:100%;"/>
				</td>
				</tr>
			</table>
	</form>
 </section>
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
