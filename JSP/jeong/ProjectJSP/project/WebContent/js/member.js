/* id 중복 체크 */

function idCheck(){
	
}

/* 회원가입 검증 */

function joinCheck(){
	//틀리면 false

	if(document.frm.id.value.length == 0){
		alert("아이디를 입력해주세요.")
		document.frm.id.focus();
		return false;
	}
	if(document.frm.pwd.value.length < 4){
		alert("비밀번호는 4글자 이상으로 반드시 입력해주세요.")
		document.frm.pwd.focus();
		return false;
	}
	if(document.frm.pwd.value != document.frm.pwdcheck.value){
		alert("비밀번호가 일치하지 않습니다.")
		document.frm.pwdcheck.focus();
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
	}
	if(document.frm.address.value.length == 0){
		alert("주소를 입력해주세요.")
		document.frm.address.focus();
		return false;
	}
	if(document.frm.tel.value.length == 0){
		alert("전화번호를 입력해주세요.")
		document.frm.tel.focus();
		return false;
	}
	if(document.frm.phone.value.length == 0){
		alert("휴대폰번호를 입력해주세요.")
		document.frm.phone.focus();
		return false;
	}
	return true;
}