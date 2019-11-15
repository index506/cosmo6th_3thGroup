var order_list = [
    ["2019-11-12","../Book/images/buybook/img_book_03.jpg","탑스팟(저)","한 권으로 끝내는 정보처리 필기","2개","서울특별시 00구 00동","결제확인"],
    ["2019-11-12","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","1개","서울특별시 00구 00동","배송중"],
    ["2019-11-11","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","3개","서울특별시 00구 00동","배송대기"],
    ["2019-11-01","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","4개","서울특별시 00구 00동","배송완료"],
    ["2019-10-15","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","5개","서울특별시 00구 00동","배송완료"],
    ["2019-09-11","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","6개","서울특별시 00구 00동","배송완료"],
    ["2019-08-11","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-07-27","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-06-27","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-05-27","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-04-27","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-03-27","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-02-21","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2019-01-14","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2018-12-17","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2018-12-17","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2018-12-17","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"],
    ["2018-12-17","../Book/images/buybook/img_book_01.jpg","예문사(저)","정보처리기사 필기(ALL-PASS)","7개","서울특별시 00구 00동","배송완료"]
];//날짜, 상품정보(이미지), 상품정보(출판사), 상품정보(이름), 상품정보(수량), 상품정보(주소), 상태

var order_search_list = order_list;
var order_sl_num;
var order_sl_4num;

var test_list = [
    ["2019년 11월 12일 16시 01분 51초","1시간 16분 12초","정보처리기사","2019년 9월 21일","55점"],
    ["2019년 11월 11일 12시 18분 23초","1시간 32분 42초","정보처리기사","2019년 9월 21일","69점"],
    ["2019년 11월 09일 20시 14분 01초","1시간 31분 11초","정보처리기사","2019년 5월 17일","63점"],
    ["2019년 11월 05일 16시 08분 53초","1시간 32분 42초","정보처리기사","2019년 9월 21일","55점"],
    ["2019년 11월 02일 11시 45분 01초","1시간 32분 42초","정보처리기사","2019년 9월 21일","55점"],
    ["2019년 10월 25일 21시 55분 51초","1시간 32분 42초","정보처리기사","2019년 9월 21일","55점"]
];//완료 날짜, 소요 시간, 과목명, 기출 날짜, 점수

var test_search_list = test_list;
var test_sl_num;
var test_sl_4num;

$(document).ready(function(){
    var now = new Date();
    var sysdateString = DateToString(now,0);
    var sysdateDate = StringToDate(sysdateString);

    order_sl_num = order_search_list.length;
    if(order_sl_num%4==0)
        order_sl_4num = parseInt(order_search_list.length/4);
    else
        order_sl_4num = parseInt(order_search_list.length/4)+1;

    test_sl_num = test_search_list.length;
    if(test_sl_num%4==0)
        test_sl_4num = parseInt(test_search_list.length/4);
    else
        test_sl_4num = parseInt(test_search_list.length/4)+1;

    view_order(order_sl_num,order_sl_4num,order_search_list);
    view_test(test_sl_num,test_sl_4num,test_search_list);

    $("#mypage div.day_search input[name='month']").click(function(){
        var buffer_list = new Array();
        var month = $(this).attr("value");
        var num = parseInt(month.charAt(0));
        var beforeone = DateToString(sysdateDate,num);
        $("#mypage div.day_search input[name='min_day']").attr("value",beforeone);
        $("#mypage div.day_search input[name='max_day']").attr("value",sysdateString);
        var count = 0;
        var minDay = StringToDate(beforeone);
        var maxDay = sysdateDate;
        for(var i=0; i<order_list.length; i++){
            var ol_date = StringToDate(order_list[i][0]);
            if(minDay<=ol_date && ol_date<=maxDay){
                buffer_list[count] = new Array();
                for(var j=0; j<7; j++){
                    buffer_list[count][j] = order_list[i][j];
                }count++;
            }
        }order_search_list = buffer_list;
        order_sl_num = order_search_list.length;
        if(order_sl_num%4==0)
            order_sl_4num = parseInt(order_search_list.length/4);
        else
            order_sl_4num = parseInt(order_search_list.length/4)+1;
        console.log(count);
        view_order(order_sl_num,order_sl_4num,order_search_list);
    });

    $("#mypage div.day_search input[name='search']").click(function(){
        var buffer_list = new Array();
        var min = $("#mypage div.day_search input[name='min_day']").val();
        var max = $("#mypage div.day_search input[name='max_day']").val();
        var count = 0;
        var minDay = StringToDate(min);
        var maxDay = StringToDate(max);
        for(var i=0; i<order_list.length; i++){
            var ol_date = StringToDate(order_list[i][0]);
            if(minDay<=ol_date && ol_date<=maxDay){
                buffer_list[count] = new Array();
                for(var j=0; j<7; j++){
                    buffer_list[count][j] = order_list[i][j];
                }count++;
            }
        }order_search_list = buffer_list;
        order_sl_num = order_search_list.length;
        if(order_sl_num%4==0)
            order_sl_4num = parseInt(order_search_list.length/4);
        else
            order_sl_4num = parseInt(order_search_list.length/4)+1;
        console.log(count);
        view_order(order_sl_num,order_sl_4num,order_search_list);
    });

    $("#mypage table.order tr.number td span").each(function(){
        $(this).click(function(){
            $("#mypage table.order tr.number td span").removeClass("on");
            $(this).addClass("on");

            var thisnum = $(this).text();

            for(var i=0; i<4; i++){
                if(order_sl_num<=i+(4*(thisnum-1))) {
                    $("#mypage table.order tr.body.on").eq(i).hide();
                }else{
                    $("#mypage table.order tr.body.on").show();
                    $("#mypage table.order tr.body.on").eq(i).children("td.date").text(order_search_list[i+(4*(thisnum-1))][0]);
                    $("#mypage table.order tr.body.on").eq(i).children("td.content").children("img").attr("src",order_search_list[i+(4*(thisnum-1))][1]);
                    $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.company").text(order_search_list[i+(4*(thisnum-1))][2]);
                    $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.bookname").text(order_search_list[i+(4*(thisnum-1))][3]);
                    $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.third").children("span.count").text(order_search_list[i+(4*(thisnum-1))][4]);
                    $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.third").children("span.address").text(order_search_list[i+(4*(thisnum-1))][5]);
                    $("#mypage table.order tr.body.on").eq(i).children("td.status").text(order_search_list[i+(4*(thisnum-1))][6]);
                }
            }
        });
    });
    $("#mypage table.test tr.number td span").each(function(){
        $(this).click(function(){
            $("#mypage table.test tr.number td span").removeClass("on");
            $(this).addClass("on");

            var thisnum = $(this).text();

            for(var i=0; i<4; i++){
                if(test_sl_num<=i+(4*(thisnum-1))) {
                    $("#mypage table.test tr.body.on").eq(i).hide();
                }else{
                    $("#mypage table.test tr.body.on").show();
                    $("#mypage table.test tr.body.on").eq(i).children("td.finish").text(test_search_list[i+(4*(thisnum-1))][0]);
                    $("#mypage table.test tr.body.on").eq(i).children("td.lead").text(test_search_list[i+(4*(thisnum-1))][1]);
                    $("#mypage table.test tr.body.on").eq(i).children("td.name").text(test_search_list[i+(4*(thisnum-1))][2]);
                    $("#mypage table.test tr.body.on").eq(i).children("td.day").text(test_search_list[i+(4*(thisnum-1))][3]);
                    $("#mypage table.test tr.body.on").eq(i).children("td.grade").text(test_search_list[i+(4*(thisnum-1))][4]);
                }
            }
        });
    });
});

function DateToString(sysdate,i) {
    var year = sysdate.getFullYear();
    var month = sysdate.getMonth()+(1-i);
    var day = sysdate.getDate();
    var str = year.toString()+"-";
    if(month<10)
        str += "0"+month.toString()+"-";
    else
        str += month.toString()+"-";
    if(day<10)
        str += "0"+day.toString();
    else
        str += day.toString();
    return str;
}

function StringToDate(str) {
    var y = str.substr(0, 4);
    var m = str.substr(5, 2);
    var d = str.substr(8, 2);
    return new Date(y,m-1,d);
}

function view_order(num,num4,list){
    $("#mypage table.order tr.number td span").removeClass("on");
    $("#mypage table.order tr.number td span:first-of-type").addClass("on");

    $("#mypage table.order tr.number td span").css("display","none");

    for(var i=0; i<num4; i++){
        $("#mypage table.order tr.number td span").eq(i).css("display","inline");
    }

    if(num==0){
        $("#mypage table.order tr.body.on").hide();
        $("#mypage table.order tr.body.off").show();
    }else{
        $("#mypage table.order tr.body.on").hide();
        $("#mypage table.order tr.body.off").hide();
        for(var i=0; i<4; i++){
            if(num<=i) {
                $("#mypage table.order tr.body.on").eq(i).hide();
            }else{
                $("#mypage table.order tr.body.on").show();
                $("#mypage table.order tr.body.on").eq(i).children("td.date").text(list[i][0]);
                $("#mypage table.order tr.body.on").eq(i).children("td.content").children("img").attr("src",list[i][1]);
                $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.company").text(list[i][2]);
                $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.bookname").text(list[i][3]);
                $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.third").children("span.count").text(list[i][4]);
                $("#mypage table.order tr.body.on").eq(i).children("td.content").children("p.third").children("span.address").text(list[i][5]);
                $("#mypage table.order tr.body.on").eq(i).children("td.status").text(list[i][6]);
            }
        }
    }
}

function view_test(num,num4,list){
    $("#mypage table.test tr.number td span").removeClass("on");
    $("#mypage table.test tr.number td span:first-of-type").addClass("on");

    $("#mypage table.test tr.number td span").css("display","none");

    for(var i=0; i<num4; i++){
        $("#mypage table.test tr.number td span").eq(i).css("display","inline");
    }

    if(num==0){
        $("#mypage table.test tr.body.on").hide();
        $("#mypage table.test tr.body.off").show();
    }else{
        $("#mypage table.test tr.body.on").hide();
        $("#mypage table.test tr.body.off").hide();
        for(var i=0; i<4; i++){
            if(num<=i) {
                $("#mypage table.test tr.body.on").eq(i).hide();
            }else{
                $("#mypage table.test tr.body.on").show();
                $("#mypage table.test tr.body.on").eq(i).children("td.finish").text(list[i][0]);
                $("#mypage table.test tr.body.on").eq(i).children("td.lead").text(list[i][1]);
                $("#mypage table.test tr.body.on").eq(i).children("td.name").text(list[i][2]);
                $("#mypage table.test tr.body.on").eq(i).children("td.day").text(list[i][3]);
                $("#mypage table.test tr.body.on").eq(i).children("td.grade").text(list[i][4]);
            }
        }
    }
}
