const TOTALNUM=60; // 총 문제
const LAST_NUM=3; // 마지막 문제번호
var nowNum=1; // 현재 문제번호

var quiz = new Array();

quiz[0] = [
    '데크(Deque)에 대한 설명으로 옳지 않은 것은?'
    ,null
    ,'입력 제한 데크는 Shelf이고, 출력 제한 테크는 Scroll이다.'
    ,'삽입과 삭제가 리스트의 양쪽 끝에서 발생할 수 있는 자료 구조이다.'
    ,'스택과 큐의 장점으로 구성한 것이다.'
    ,'Double Ended Queue의 약자이다.'
];

quiz[1] = [
    '다음 트리에서 터미널 노드 수는?'
    ,'https://img.comcbt.com/cbt/data/j4/j420190427/j420190427m2.gif?1560202322'
    ,'2'
    ,'3'
    ,'4'
    ,'8'
];

quiz[2] = [
    '관계해석에서 ‘for all : 모든 것에 대하여’의 의미를 나타내는 논리 기호는?'
    ,null
    ,'∃'
    ,'∈'
    ,'∀'
    ,'U'
];

$(document).ready(function(){

    // start of 번호이동 버튼 생성 기능
    for(var i=1; i<=TOTALNUM; i++){
        $('#gbtn').append('<input type="button" class="go_btn" value="'+i+'" id="gbtn'+i+'">');
        if(i%5==0) $('#gbtn').append('<br>');
    }
    // end of 번호이동 버튼 생성 기능

    // start of  번호 이동 기능
    $('.go_btn').click(function(){ 
        $('#quiz_box_'+nowNum).removeClass('now');
        nowNum = Number($(this).val());
        $('#quiz_box_'+nowNum).addClass('now');          
     });
    // end of 번호 이동 기능

    // start of 다음, 이전 버튼 기능
    $('#next').click(function(){ quizPrevNext(LAST_NUM); });
    $('#prev').click(function(){ quizPrevNext(1); });

    function quizPrevNext(num_limit){
        
        if(nowNum!=num_limit) {
            $('#quiz_box_'+nowNum).removeClass('now'); // now-remove
            if(num_limit==1) //prev-add
                $('#quiz_box_'+(--nowNum)).addClass('now');
            else //next-add
                $('#quiz_box_'+(++nowNum)).addClass('now');
        }
    }
    // end of 다음, 이전 버튼 기능

});