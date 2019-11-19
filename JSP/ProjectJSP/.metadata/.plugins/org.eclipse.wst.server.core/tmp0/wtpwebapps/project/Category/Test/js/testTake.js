
$(document).ready(function(){
		
    // start of 풀지 않은 문제, 푼 문제 색칠 기능
    $('.answer').click(function(){
        var quizNum = $(this).attr('name');
        $('#gbtn'+quizNum).addClass('is');
    });
    // end of 풀지 않은 문제, 푼 문제 색칠 기능

});