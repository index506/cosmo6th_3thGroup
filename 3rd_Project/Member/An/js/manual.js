$(document).ready(function(){
    $('.manual_btn').click(function(){
        var hei = $('#content_wrap').height();
        $('.manual_bg').height(hei).fadeToggle('fast');
        $('.manual_item').toggleClass('manual_show');
    });
    
});