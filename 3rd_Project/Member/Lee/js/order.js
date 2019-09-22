$(document).ready(function () {

    // 결제정보 > 무통장입금 이용안내
    $(".depositGuide").hover(

        function () {
            $(".depositExplain").css("display", "block");
        }, function () {
            $(".depositExplain").css("display", "none");
        });


    // 배송정보 > 배송시 요청사항 > 직접입력
    $("#shippingDemand").change(function () {
        var state = $("#shippingDemand option:selected").val();
        if (state == 'input')
            $(".shippingInput").css("display", "inline-block");
        else
            $(".shippingInput").css("display", "none");
    });

    // 주문자동의 내용보기/내용닫기
    $(function () {
        var state = false;
        $(".approvalContents").click(function () {
            $(".slide").stop().slideToggle("fast");
            if (!state) {
                $(this).find("span").text("내용닫기");
                imgOn(this);
                state = true;
            } else {
                $(this).find("span").text("내용보기");
                imgOff(this);
                state = false;
            }
            return false;
        });

        function imgOn(t) {
            var img = $(t).find("img");
            img.attr("src", img.attr("src").replace("down", "up")).attr("alt", "내용닫기");

        }
        function imgOff(t) {
            var img = $(t).find("img");
            img.attr("src", img.attr("src").replace("up", "down")).attr("alt", "내용보기");
        }
    });


    // 체크박스 전체 선택/해제
    $(".approvalAll").on("click", function () {
        if ($(this).prop("checked")) {
            $(".approvalButton").prop("checked", true);
        } else {
            $(".approvalButton").prop("checked", false);
        }
    });

    // 체크박스 전체 선택/해제
    var list = $(".approvalButton");
    var checkCount = 0;;

    list.on("click",function(){

        if($(".approvalAll").prop("checked")){
            checkCount = 3;
        }
        
        if($(this).prop("checked")){
            checkCount++;
        } else{
            checkCount--;
        }

        if (checkCount == list.length) {
        //length : 해당 요소의 개수를 반환
            $(".approvalAll").prop("checked", true);
        } else {
            $(".approvalAll").prop("checked", false);
        }
    
    });
});