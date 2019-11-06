/* id 중복 체크 */

function idCheck(){
   
}

/* 회원가입 검증 */
var pw_passed = true;
function joinCheck(){
   //틀리면 false
	  if(document.frm.id.value.length == 0){
	      alert("아이디를 입력해주세요.")
	      document.frm.id.focus();
	      return false;
	   }else if(document.frm.id.value.length < 8 || document.frm.id.value.length > 16){
		   alert("아이디를 정확하게 입력해주세요.")
		   document.frm.id.focus();
	   		document.frm.id.value = "";
		      return false; 
	   }
	  var pw = document.getElementById("txtPassword1").value; //비밀번호
	    var pw2 = document.getElementById("txtPassword2").value; // 확인 비밀번호
//	    var id = document.getElementById("txtId").value; // 아이디
	    pw_passed = true;
	    var pattern1 = /[0-9]/;
	    var pattern2 = /[a-zA-Z]/;
	    var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
	    var pw_msg = "";
	    if(pw.length == 0) {
	           alert("비밀번호를 입력해주세요");
	           return false;
	     } else {
	            if( pw  !=  pw2) {
	                  alert("비밀번호가 일치하지 않습니다.");
	                  return false;
	             }
	     }
	   if(!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>16){
	        alert("영문+숫자+특수기호 8자리 이상 15자리 이하로 구성하여야 합니다.");
	        document.frm.pwd.value="";
	        document.frm.pwdcheck.value="";
	        return false;
	    }          
   if(document.frm.name.value.length == 0){
      alert("이름을 입력하세요.");
      document.frm.name.focus();
      return false;
   }
   if(document.frm.email.value.length == 0){
      alert("이메일을 입력해주세요.")
      document.frm.email.focus();
      return false;
   }else{
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이 메일형식이 올바르지 않습니다.");
			document.frm.email.focus();
			document.frm.email.value="";
			return false;
    }
   }
   if(document.frm.adress.value.length == 0){
      alert("주소를 입력해주세요.")
      document.frm.address.focus();
      return false;
   }
   if(document.frm.home.value.length == 0){
      alert("전화번호를 입력해주세요.")
      document.frm.home.focus();
      return false;
   }
   if(document.frm.phone.value.length == 0){
      alert("휴대폰번호를 입력해주세요.")
      document.frm.phone.focus();
      return false;
   }
// if(document.frm.pwd.value.length < 4){
// alert("비밀번호는 4글자 이상으로 반드시 입력해주세요.")
// document.frm.pwd.focus();
// return false;
//}
//if(document.frm.pwd.value != document.frm.pwdcheck.value){
// alert("비밀번호가 일치하지 않습니다.")
// document.frm.pwdcheck.focus();
// return false;
//}
   return true;
}