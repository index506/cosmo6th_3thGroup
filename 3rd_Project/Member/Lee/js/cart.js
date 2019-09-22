$(document).ready(function () {

    // var num = $("input[type="number"]").eq(0).val();

    $(".amtModify").on("click", function () {
        var num = $(".inputNumber").val();
        if (num > 0) {

        } else {
            alert("잘못 입력하셨습니다.");
            $(".inputNumber").val(0);
        }
    });

});