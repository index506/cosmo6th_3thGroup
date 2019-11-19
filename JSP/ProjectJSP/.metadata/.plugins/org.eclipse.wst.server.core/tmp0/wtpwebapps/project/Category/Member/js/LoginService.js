/**
 * 
 */
/* 아이디 찾기 인증번호 확인하기 find_id.jsp  */
        // 인증번호 맞으면 다음 절차로 페이지이동 
        function numberCheck(){
        	
            if(document.frmfindid.numConfirm.value=='456123'){
            	
            	document.frmfindid.method="post";
            	document.frmfindid.action="../../login/findid.do";
            	document.frmfindid.submit();
                
            }else if(document.frmfindid.numConfirm.value!='456123'){
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
        var min = 100000, max = 999999;
        var randomNum = function(min, max){
            var ranNum = Math.floor(Math.random()*(max-min+1))+min;
            return ranNum;
        }
        function userConfirm(){
        	alert("asdf");
            if(document.frm.userCon.value=='456123'){
            	
            	window.location.href="reset_pwd.jsp";
            }else if(document.frm.userCon.value!='456123'){              	
            	alert("인증번호가 틀립니다.");           	
            }                
        }
        
        