$(document).ready(function(){

    const TOTALNUM=60;
    var ans = new Array('C','W','C','C','W'
                        ,'C','W','C','C','W'
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

    // start of 맞은문제, 틀린문제 번호이동버튼

    for(var i=1; i<=TOTALNUM; i++){
        if(ans[i-1]=='C'){
            $('#gbtn'+i).addClass('correct');
        }else {
            $('#gbtn'+i).addClass('wrong');
        }
    }

    // end of 맞은문제, 틀린문제 번호이동버튼

});