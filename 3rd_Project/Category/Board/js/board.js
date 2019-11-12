function search_click() {
    var text=$('input:text[class="search_inp"]').val();
    var search_cd=[];

    if(text=="")
        alert("검색어를 입력해주세요");

    else if($('input:checkbox[class="search_tit"]').is(":checked") == true){
        search_cd.push('title')
        if($('input:checkbox[class="search_con"]').is(":checked") == true){
            search_cd.push('content')
        }
        if($('input:checkbox[class="search_nam"]').is(":checked") == true){
            search_cd.push('name')
        }
    }   
    else if($('input:checkbox[class="search_con"]').is(":checked") == true){
        search_cd.push('content')
        if($('input:checkbox[class="search_nam"]').is(":checked") == true){
            search_cd.push('name')
        }
    }
    else if($('input:checkbox[class="search_nam"]').is(":checked") == true){
        search_cd.push('name')
    }
    else
        alert("검색 조건을 체크해주세요");

    console.log(search_cd, text);
}

function write_click() {
    location.href="./postWrite.html";
}
