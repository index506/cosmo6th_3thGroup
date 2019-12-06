/* ==게시글 목록==*/
/* 글 검색 */
function search_check() {
	var search_value = document.frm_search.search_value;
	if(search_value.value == ''){
		alert("검색어를 입력해주세요.");
		return false;
	}
	return true;
}
