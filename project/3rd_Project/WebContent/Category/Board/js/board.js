


/* == 이동 == */
/* 글쓰기 이동 */
function go_write(contextPath, action, board_category, now_pnum, search_option, search_value) {
	
	if(now_pnum== undefined || now_pnum == ''){
		now_pnum = '1';
	}
	
	var url = contextPath+"/"+"board"+"/"+action
	url += "?"+"board_category"+"="+board_category;
	url += "&"+"now_pnum"+"="+now_pnum;
	url += "&"+"search_option"+"="+search_option;
	url += "&"+"search_value"+"="+search_value;
	location.href=url;
}

/* 답변 이동 */
function go_reply(contextPath, action, board_category, parentNum, now_pnum, search_option, search_value) {
	var url = contextPath+"/"+"board"+"/"+action
	url += "?"+"board_category"+"="+board_category;
	url += "&"+"parentNum"+"="+parentNum;
	url += "&"+"now_pnum"+"="+now_pnum;
	url += "&"+"search_option"+"="+search_option;
	url += "&"+"search_value"+"="+search_value;
	location.href=url;
}

/* 수정 이동 */
function go_modify(contextPath, action, board_category, num, now_pnum, search_option, search_value) {
	var url = contextPath+"/"+"board"+"/"+action
	url += "?"+"board_category"+"="+board_category;
	url += "&"+"num"+"="+num;
	url += "&"+"now_pnum"+"="+now_pnum;
	url += "&"+"search_option"+"="+search_option;
	url += "&"+"search_value"+"="+search_value;
	location.href=url;
}

/* 삭제 확인 & 이동 */
function go_delete(contextPath, action, board_category, num) {
		if(confirm("게시글을 삭제하시겠습니까?")){ 
			var url = contextPath+"/"+"board"+"/"+action
			url += "?"+"board_category"+"="+board_category;
			url += "&"+"num"+"="+num;
			location.href=url;
		}
}

/* 목록 이동 */
function go_list(contextPath, board_category, now_pnum, search_option, search_value) {
	var action;
	switch ( board_category ) {
		case 'notice_List' : action = 'noticeList.do';
			break;
		case 'community_List' : action = 'communityList.do';
			break;
		case 'question_List' : action = 'questionList.do';
			break;
	}
		
	var url = contextPath+"/"+"board"+"/"+action
	url += "?"+"now_pnum"+"="+now_pnum;
	url += "&"+"search_option"+"="+search_option;
	url += "&"+"search_value"+"="+search_value;
	location.href=url;
}

