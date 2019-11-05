function search_click() {
    alert("검색을 시작합니다");
    if($('input:checkbox[class="search_tit"]').is(":checked") == true){
        alert("제목으로 검색을 시작합니다");
        var a=$('input:text[class="search_inp"]').val();
        console.log(a);
        if($('input:checkbox[class="search_con"]').is(":checked") == true){
            alert("내용으로 검색을 시작합니다");
        }
        if($('input:checkbox[class="search_nam"]').is(":checked") == true){
            alert("이름으로 검색을 시작합니다");
        }
    }   
    else if($('input:checkbox[class="search_con"]').is(":checked") == true){
        alert("내용으로 검색을 시작합니다");
        if($('input:checkbox[class="search_nam"]').is(":checked") == true){
            alert("이름으로 검색을 시작합니다");
        }
    }
    else if($('input:checkbox[class="search_nam"]').is(":checked") == true){
        alert("이름으로 검색을 시작합니다");
    }
    else
        alert("검색 조건을 체크해주세요");
    
    var text =$('input:text[class="search_inp"]').val();
    console.log(text);

    if(text=="")
        alert("검색어를 입력해주세요");
}

function write_click() {
    alert("글쓰기를 시작합니다");
};

$(document).ready(function(){
    $(".pg_num").on("click",function(){
        $(this).css({"font-weight":"bold"});
    });
});