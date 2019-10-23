<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Main Page</title>
    <link rel="stylesheet" href="./css/init.css"/>
    <link rel="stylesheet" href="./css/common.css"/>
    <link rel="stylesheet" href="./css/main.css"/>
    <script type="text/javascript" src="./js/jquery-2.1.1.min.js"> </script>
    <script type="text/javascript" src="./js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./js/prefixfree.min.js"></script>
    <script type="text/javascript" src="./js/common.js"></script>
    <script type="text/javascript" src="./js/main.js"></script>
</head>
<body>
	<!--main_header_wrap-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
    <!--//main_header_wrap-->
    <!--main_image-->
    <div id="main_image">
        <img src="./images/main_BtnL.png" alt="left" class="left_Btn">
        <img src="./images/main_BtnR.png" alt="right" class="right_Btn">
        <div class="book_image">
            <ul>
                <li><img src="./Member/Lee/images/buybook/img_book_01.jpg" alt="book_1"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_02.jpg" alt="book_2"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_03.jpg" alt="book_3"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_04.jpg" alt="book_4"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_05.jpg" alt="book_5"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_06.jpg" alt="book_6"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_07.jpg" alt="book_7"></li>
                <li><img src="./Member/Lee/images/buybook/img_book_08.jpg" alt="book_8"></li>
            </ul>
        </div> 
    </div>
    <!--//main_image-->
    <!--main_first_section-->
    <section id="main_first_section">
        <!--main_login-->
        <div id="main_login">
            <a href="./Member/Seok/login_main.html" title="login"><div class="login">�α���</div></a>
            <a href="./Member/Yoo/signUp.html" title="assign"><div class="assign">ȸ������</div></a>
        </div>
        <!--//main_login-->
        <!--main_table-->
        <div id="main_table">
            <ul class="row first">
                <li class="item_0">������</li>
                <li class="item_1">�����Ⱓ</li>
                <li class="item_2">������</li>
                <li class="item_3">������ǥ��</li>
            </ul>
            <ul class="line"></ul>
            <ul class="row second">
                <li class="item_0">D-0</li>
                <li class="item_1">2019-11-11(��)~2019-11-13(��)</li>
                <li class="item_2">2019-12-23(��)</li>
                <li class="item_3">2019-12-30(��)</li>
            </ul>
        </div>
        <!--//main_table-->
    </section>
    <!--//main_first_section-->
    <!--main_second_section-->
    <section id="main_second_section">
        <article class="link">
            <ul>
                <li><a href="javascript:;" class="alert_ready" title="����ȳ�"><img src="./images/main_img_01.jpg" alt="����ȳ�"/></a></li>
                <li><a href="./Member/An/testSelect.html" title="��������"><img src="./images/main_img_02.jpg" alt="��������"/></a></li>
                <li><a href="./Member/Lee/buybook.html" title="���籸��"><img src="./images/main_img_03.jpg" alt="���籸��"/></a></li>
                <li><a href="./Member/Nam/Question_List.html" title="���� �Խ���"><img src="./images/main_img_04.jpg" alt="���� �Խ���"/></a></li>
            </ul>
        </article>
    </section>
    <!--//main_second_section-->
    <!--main_third_section-->
    <section id="main_third_section">
        <article class="notice">
            <h2 class="title">��������<a href="./Member/Nam/Notice_List.html" title="��������">������</a></h2>
            <ul class="list">
                <a href="./Member/An/postRead.html"><li>�ƾƾƾ�<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�ƹ̳�<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�٤Ӷ���<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�˸�����<span>2019-04-10</span></li></a>
            </ul>
        </article> 
        <article class="notice">
            <h2 class="title">���� �Խ���<a href="./Member/Nam/Community_List.html" title="���� �Խ���">������</a></h2>
            <ul class="list">
                <a href="./Member/An/postRead.html"><li>�ƾƾƾ�<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�ƹ̳�<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�٤Ӷ���<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�˸�����<span>2019-04-10</span></li></a>
            </ul>
        </article> 
        <article class="notice">
            <h2 class="title">���� �Խ���<a href="./Member/Nam/Question_List.html" title="���� �Խ���">������</a></h2>
            <ul class="list">
                <a href="./Member/An/postRead.html"><li>�ƾƾƾ�<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�ƹ̳�<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�٤Ӷ���<span>2019-04-10</span></li></a>
                <a href="./Member/An/postRead.html"><li>�˸�����<span>2019-04-10</span></li></a>
            </ul>
        </article> 
    </section>
    <!--//main_third_section-->
    <!--main_footer-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
    <!--//main_footer-->
</body>
</html>