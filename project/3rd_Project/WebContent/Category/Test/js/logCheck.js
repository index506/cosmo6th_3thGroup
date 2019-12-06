function loadTest(){
	if(confirm('시험을 이어서 진행하시겠습니까?')){
		document.frm.submit();
	}
}

function newTest(){
	if(confirm('시험을 새로 진행하시겠습니까?')){
		location.href='selectTest.do';
	}
}