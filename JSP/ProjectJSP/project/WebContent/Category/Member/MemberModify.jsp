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
	    <link rel="stylesheet" href="../../css/init.css"/>
    <link rel="stylesheet" href="../../css/common.css"/>
    <script type="text/javascript" src="../../js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="../../js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../../js/prefixfree.min.js"></script>
    <script type="text/javascript" src="js/modify.js"></script>
    <script type="text/javascript" src="js/number.js"></script>
    <script type="text/javascript" src="js/hangul.js"></script>
    <script type="text/javascript" src="js/cancel.js"></script>
    <script type="text/javascript" src="js/alphanumber.js"></script>
    <link rel="stylesheet" href="css/add.css"/>
</head>
<body>
    <!--main_header_wrap-->
  	<jsp:include page="/WEB-INF/view/header.jsp" flush="false" />
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
	<jsp:include page="/WEB-INF/view/footer.jsp" flush="false" />
    <!--//main_footer-->
</body>
</html>
