$(document).ready(function(){

    const TOTALNUM=60;
    var ans = new Array('W','W','W','W','W'
                        ,'C','C','C','C','C'
                        ,'C','W','C','C','W'
                        ,'W','W','C','C','W'
                        ,'C','W','C','C','W'
                        ,'W','W','C','C','W'
                        ,'C','W','W','C','W'
                        ,'C','W','W','C','W'
                        ,'C','W','C','W','W'
                        ,'C','W','C','W','W'
                        ,'W','W','C','W','W'
                        ,'C','W','C','C','W');

    // start of 문제 생성
    for(var i=1; i<=LAST_NUM; i++){
        var txt='';
        txt+='<div id="quiz_box_'+i+'" class="quiz_box">';
        txt+='<ul>';
        txt+='<li><div>['+i+'번문제]</div><div>'+quiz[i-1][0]+'</div></li>';
        if(quiz[i-1][1]!=null){
            txt+='<li><img src="'+quiz[i-1][1]+'"></li>';
        }
        for(j=1; j<=4; j++){
            txt+='<li>';
            txt+='<label for="answer'+i+'_'+j+'">'+quiz[i-1][j+1]+'</label>';
            txt+='</li>';
        }
        txt+='<div class="explanations_area">';
        txt+='<p><span>오답률> </span><span>55%</span></p>';
        txt+='<p><span>해설> </span><span>∀는.....스택과 큐는.....스택과 큐는.....스택과 큐는.....스택과 큐는.....</span></p>';
        txt+='</div>';               
        txt+='</ul>';
        txt+='</div>';   
        $('#content_area').prepend(txt);
    }

    $('#quiz_box_1').addClass('now');
    // end of 문제 생성                    

    // start of 맞은문제, 틀린문제 번호이동버튼
    for(var i=1; i<=TOTALNUM; i++){
        if(ans[i-1]=='C'){
            $('#gbtn'+i).addClass('is');
            $('#')
        }
    }
    // end of 맞은문제, 틀린문제 번호이동버튼

});