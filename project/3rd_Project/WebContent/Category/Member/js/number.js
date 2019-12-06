/**
 * 
 */

$(function() {
	$(".onlyNumber").keyup(function(event){
	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^0-9]/gi,''));
	});
	$(document).ready(function(){
		$('.hanguel').css("ime-mode", "active");
	});
});