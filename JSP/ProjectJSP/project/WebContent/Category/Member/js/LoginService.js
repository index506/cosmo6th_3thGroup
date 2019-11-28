/**
 * 
 */




/* 아이디 찾기 인증번호 확인하기 find_id.jsp  */

//인증번호를 위한 난수 생성 
var randomInt;

	var generateRandom = function (min, max) {
		var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
		  return ranNum;
		}
//인증번호 보내기 난수 
function random(){
	randomInt = generateRandom(100000,999999);
	
	console.log("인증번호는");
	console.log(randomInt);
	
	return randomInt;
}

        // 인증번호 맞으면 다음 절차로 페이지이동 
        function numberCheck(){        	
        	console.log(randomInt);
            if(document.frmfindid.numConfirm.value==randomInt){
            	
            	document.frmfindid.method="post";
            	document.frmfindid.action="../../login/findid.do";
            	document.frmfindid.submit();
                
            }else if(document.frmfindid.numConfirm.value!=randomInt){
                alert('인증번호가 다릅니다.');
            }
        }

        
/*  login_main.jsp   */
        
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
    			frmLogin.action="../../login/loginCheck.do";
    			frmLogin.submit();
    		}
    	}
    /* 페이지 이동  */
        function member(){
            window.location.href="signup.html";
        };
        function id(){
            window.location.href="find_id.jsp";
        };
        function password(){
            window.location.href="find_pwd.jsp";
        };
/*-------------------------------------//login_main.jsp-------------------------------------------------------------*/
        
        
/* find_pwd */ 
        // 고객아이디의 비밀번호 찾기위해 아이디를 입력 후 다음단계 클릭 
        function nextStep(){
        	var user_id = frm.user_id.value;
        	if((user_id.length==0||user_id=="")){
    			alert("ID는 필수입니다. ");
    			frm.user_id.focus();
    		}else if(user_id.length<=4||user_id.length>=21){
    			alert("아이디는 5글자이상 20글자 이하만 입력가능합니다.");    			
    			frm.user_id.focus();
    		}else{        			
    			frm.method="post";
    			frm.action="../../login/find_pwd.do";
    			frm.submit();
    		}	           
        }
        
/* find_pwd2.jsp  */
        // 비밀번호 찾기에서 인증번호 확인하기 
        function userConfirm(){  
        	
        	console.log(randomInt);
        	
            if(document.frmPWD2.userCon.value==randomInt){            	
            	window.location.href="../../Project/Category/Member/reset_pwd.jsp";
            }else if(document.frmPWD2.userCon.value!=randomInt){              	
            	alert("인증번호가 틀립니다.");           	
            }                
        }
        
/* reset_pwd.jsp  */

        /* 비밀번호 입력칸에 작성시  */
$(document).ready(function(){
	$(".pwd3_wrap #pwd_lbl").blur(function(){
		var pwd1 = document.frmReset.pwd1.value;
    	var pwd2 = document.frmReset.user_pwd.value;
		var getCheck = /^[A-Za-z0-9+]{8,15}$/;
		var pattern1 = /[0-9]/;
	    var pattern2 = /[a-zA-Z]/;
	    var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
	    

     	if(!pattern1.test(pwd1)||!pattern2.test(pwd1)||!pattern3.test(pwd1)||pwd1.length<8||pwd1.length>16){
 	        document.frmReset.pwd1.value=""; 	        
 	        $(".hidden1").show().css("color","red"); 	        
 	    }else{
 	    	$(".hidden1").hide();
 	    }
	    if(pwd1 != pwd2){
	    	$(".hidden2").show().css("color","red");
	    }else {
	    	$(".hidden2").hide();
	    }
	});
});
	        
        
        
        /* 비밀번호 변경 버튼을 눌렀을때  */
        function resetPwd(){           	    	    
        	if(document.frmReset.pwd1.value.length == 0) {
 	           alert("비밀번호를 입력해주세요");
 	           return false;
        	}else{
 	            if( document.frmReset.pwd1.value  !=  document.frmReset.user_pwd.value) {
 	                  alert("비밀번호가 일치하지 않습니다.");
 	                  return false;
 	             }
        	}
        	document.frmReset.action="../../login/resetPWD.do";
        	document.frmReset.submit();
        }
        
        
/* -----------------------------------------MemberShipWithDrawal----------------------------------------------------------------*/        
/* MemberShipWithDrawal.jsp */
            function pwdConfirm(){
        	
            if(document.frmOUT.user_pwd.value==''){
            	alert('비밀번호를 입력해주세요');
            	$('#mem_pwd').focus();           	           	                
            }else{
            	document.frmOUT.method="post";
            	document.frmOUT.action="../../login/mwc.do";
            	document.frmOUT.submit();
            }
        }
        
 /*  MemberShipWithDrawal2.jsp  */ 
            
            function mv_cancle(){
            	if (confirm("정말 취소하시겠습니까??") == true){
            	    window.location.href="/index.html";
            	}else{//취소
            	    return;
            	}
            	}
            function withdrawal(){
            	if (confirm("정말 회원 탈퇴하시겠습니까??") == true){
            	    window.location.href="../../Project/login/memberOut.do";
            	}else{//취소
            	    return;
            	}
            	}