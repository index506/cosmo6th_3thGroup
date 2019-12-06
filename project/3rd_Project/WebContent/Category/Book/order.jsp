<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ▲ JSTL의 함수를 사용하기 위한 태그 -->



<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결제</title>

<link rel="stylesheet" href="${contextPath}/css/init.css"/>
<script type="text/javascript" src="${contextPath}/js/jquery-2.1.1.min.js"> </script>
<script type="text/javascript" src="${contextPath}/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/prefixfree.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>

<link rel="stylesheet" href="${contextPath}/Category/Book/css/order.css" />
<script src="${contextPath}/Category/Book/js/order.js"></script>

<script>

        $(function () {
        	
        	$('input[type="radio"]:first').click();
        	
        	// [기본배송지][신규배송지] 선택
        	$('input[type="radio"]').change(function () {
                if ($('#second').is(':checked')) {
                    for(var i=1; i<=4; i++)
                    	$('input.value'+i).val("");
                }
            });
        	
        	// 무통장입금 버튼 선택/해제시 동작
            $("input[id='deposit']").on("click",function(){

                if($(this).prop("checked"))
                    $(".depositBox").css('display','block'); // 결제정보
                else
                    $(".depositBox").css('display','none'); // 결제정보
            });

            // [입금은행] 선택
            $('.selectBank').change(function () {
                var selectBank = $(this).find('option:not(:first):selected').val();
                var value;
                
                if(selectBank == "기업은행"){
                	value = "112-562-876312";
                } else if (selectBank == "외환은행"){
                	value = "869-232-418332";
                } else if (selectBank == "국민은행"){
                	value = "209-745-968032";
                } else if (selectBank == "농협은행"){
                	value = "142-535-150153";
                } else if (selectBank == "우리은행"){
                	value = "532-445-867492";
                } else if (selectBank == "신한은행"){
                	value = "993-481-102480";
                }
                
                $('.selectedBank').val(value);
            });

            // [결제하기] 버튼 클릭
            $('#payButton').click(function () {

                var index;

            // if ~ else ~ if 문은 하나의 if문으로 잡혀있기 때문에 전체 else if 조건문 중에 하나라도 true가 된다면 나머지는 모두 false가 되어 조건문을 빠져나온다.

                // 이름,연락처,주소 입력여부
                for (index = 1; index <= 4; index++) {
                    if ($('input.value' + index).val() == "") {
                        if(index==1)
                            alert("이름을 입력해주세요.");
                        else if(index==2)
                            alert("연락처를 입력해주세요.");
                        else if(index==3)
                            alert("연락처를 입력해주세요.");
                        else
                            alert("주소를 입력해주세요.");

                        $('input.value' + index).focus(); 
                        break;

                    } else if (index==2 || index ==3){
                        //  regexp : 숫자가 아닌 문자
                        var regexp = /[^0-9]/g;  
                        var temp = $('input.value' + index).val();
                     // regexp 정규표현식 함수 : https://gilugi407.blog.me/221327342192
                        if(regexp.test(temp)){
                            $('input.value' + index).val("").focus();
                            alert("연락처는 숫자만 입력해주세요.");
                            break;
                        } //if
                    } // else if
                } //for
                

                // 입금은행 선택여부
                // scrollTop() offset() 함수 : https://blog.naver.com/seoyoung0425/221360205224
                if(index == 5 && $("input[id='deposit']").prop("checked")==true){
                    if($('input.selectedBank').val()==""){

                    var offset = $('input.value1').offset();

                    $('html').scrollTop(offset.top);
                    alert("입금은행을 선택해주세요.");
                    } else 
                        index++;

                } else if (index == 5 && $("input[id='deposit']").prop("checked")==false){
                    alert("결제수단을 선택해주세요.");
                    var offset = $('input.value1').offset();
                    $('html').scrollTop(offset.top);
                }

                // 주문자 동의 체크여부
                // scrollTop() offset() 함수 : https://blog.naver.com/seoyoung0425/221360205224
                if(index == 6 && !$('input.approvalAll').prop("checked")){
                    var offset = $('input.approvalAll').offset();
                    $('html').scrollTop(offset.top-300);
                    alert("주문자 동의에 모두 동의해주세요.");
                } else
                    index++;

                // 모든 조건 만족시, 페이지 이동
                if(index == 7){ 
                    if(confirm("결제를 진행하시겠습니까?"))
                        $('input[type="submit"]').click();
                }
                /* 
                    location.href : 새로운 페이지로 이동
                    (※ 크롬에서 사용시에는 location.href = "URL주소";)
                    
                    location.replace : 현재 페이지를 새로운 페이지로 변경

                    https://blog.naver.com/dlaskarud2/221430844039
                    https://blog.naver.com/kinsoo007/221328538363
                */
            });

        });
</script>
</head>
<body>

	<!--main_header_wrap-->
    <jsp:include page="/WEB-INF/view/header.jsp" flush="false"/>
    <!--//main_header_wrap-->
    
    <!-- wrap -->
    <div id="wrap">

        <!-- lnb -->
        <jsp:include page="/WEB-INF/view/sideBuy.jsp" flush="false"/>
        <!-- //lnb -->

        <div id="contentWrap">

            <div class="processWrap">
                    <p class="process">주문완료&nbsp;</p>
                    <p class="process">주문결제 >&nbsp;</p>
                    <p class="process">장바구니 >&nbsp;</p>
            </div>
        
            <div id="shippingBox">
                <!-- title1 -->
                <h2 class="title">배송정보</h2>
                <!-- //title1 -->

			<form name="frm" method="post" action="${contextPath}/book/completed.do">
                <!-- innerWrap -->
                <div id="innerWrap1">
           
                    <table id="table1" cellspacing="0" width="100%">
                        <tr>
                            <th>주문자</th>
                            <td>${orderVO.userName}</td>
                        </tr>
                        <tr>
                            <th>배송지선택</th>
                            <td>
                            	<input id="first" type="radio" name="tab"/>
                                <input id="second" type="radio" name="tab"/>
                                <section class="buttons">
                                    <label class="label" for="first" onclick="location.href='${contextPath}/book/order.do'">기본배송지</label>
                                    <label class="label" for="second">신규배송지</label>
                                    <!-- input과 label은 id와 for로 연결 -->
                                    <!-- radio와 label을 연관시키면 텍스트 클릭으로 선택이 가능 -->
                                    <!-- label : 인라인 요소 -->
                                </section>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input type="text" name="name"
                                placeholder="이름을 입력해주세요." class="value1" value="${orderVO.orderName}">
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>
                            	<!-- JSTL의 split 함수를 사용하여 휴대폰번호 입력 --> 
                                <c:set var="phoneNumber" value="${orderVO.phoneNumber}"/>
                                
                                <c:if test="${fn:substring(phoneNumber,0,3)==010}">
	                                <select name="phoneNumber">
	                                    <option selected>010</option>
	                                    <option>011</option>
		                            </select> -
								</c:if>
								
								<c:if test="${fn:substring(phoneNumber,0,3)==011}">
									<select name="phoneNumber">
	                                    <option>010</option>
	                                    <option selected>011</option>
	                                </select> -  
                      	        </c:if> 
                      	        
                      	        <input type="text" name="phoneNumber" class="value2" 
                               	maxlength="4" value="${fn:substring(phoneNumber,3,7)}">
                               	
                               	<input type="text" name="phoneNumber" class="value3" 
                               	maxlength="4" value="${fn:substring(phoneNumber,7,11)}">
                      	        
                               
                                <!-- 
                                <c:forEach var="phoneNumArray" items="${phoneNumArray}" varStatus="status">
	                                
	                                <c:if test="${status.count==1 && phoneNumArray==010}">
		                                <select name="phoneNumber">
		                                    <option selected>010</option>
		                                    <option>011</option>
			                            </select> -
									</c:if>
									
									<c:if test="${status.count==1 && phoneNumArray==011}">
										<select name="phoneNumber">
		                                    <option>010</option>
		                                    <option selected>011</option>
		                                </select> -  
	                      	        </c:if> 

	                                <c:if test="${status.count == 2}">
	                                	<input type="text" name="phoneNumber" class="value2" 
	                                	maxlength="4" value="${phoneNumArray}"> -
	                                </c:if>

	                                <c:if test="${status.count == 3}">
	                                	<input type="text" name="phoneNumber" class="value3" 
	                                	maxlength="4" value="${phoneNumArray}">
	                                </c:if>
	                            
	                            https://gangzzang.tistory.com/entry/JSP-JSTLJSP-Standard-Tag-Library-%ED%95%A8%EC%88%98-%ED%83%9C%EA%B7%B8functions    
                                </c:forEach>
                                 -->
                                
                            </td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>
                                <input type="text" name="address" class="value4" placeholder="주소를 입력해주세요."
                                value="${orderVO.address}">
                            </td>
                        </tr>
                        <tr>
                            <th>배송시 요청사항</th>
                            <td>
                                <select id="shippingDemand" name="shippingDemand">
                                <!-- select의 value값은 option의 value값이 가장 먼저 선택된다. -->
                                    <option selected>배송시 요청사항 선택</option>
                                    <option>부재시 경비실에 맡겨주세요.</option>
                                    <option>부재시 휴대폰으로 연락 바랍니다.</option>
                                    <option>집 앞에 놓아주세요.</option>
                                    <option>택배함에 넣어주세요.</option>
                                    <option>직접입력</option>
                                </select>
                                <input type="text" class="shippingInput" name="shippingInput">
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- //innerWrap1 -->
        </div>
        <!-- //shippingBox -->

        <!-- payment -->
        <div id="payment">
            
            <!-- title2 -->
            <h2 class="title">결제정보</h2>
            <!-- //title2 -->

            <!-- innerWrap2 -->
            <div id="innerWrap2">
                <table id="table2" cellspacing="0" width="100%">
                    <tr>
                        <th>결제수단</th>
                        <td>
                            <div class="payWay">
                                <input id="deposit" type="checkbox">
                                <label class="deposit" for="deposit">무통장입금</label>
                                <div class="depositBox">
                                    <strong>입금은행</strong> &nbsp;&nbsp;&nbsp;
                                    <select class="selectBank" name="depositBank">
                                        <option selected>은행선택</option>
                                        <option value="기업은행">기업은행</option>
                                        <option value="외환은행">외환은행</option>
                                        <option value="국민은행">국민은행</option>
                                        <option value="농협은행">농협은행</option>
                                        <option value="우리은행">우리은행</option>
                                        <option value="신한은행">신한은행</option>
									<!-- 
										  기업 112-562-876312 
										  외환 869-232-418332
										  국민 209-745-968032
										  농협 142-535-150153
										  우리 532-445-867492
										  신한 993-481-102480
										  					-->
                                    </select>
                                    <br><br>
                                    <strong>입금계좌</strong> &nbsp;&nbsp;&nbsp;
                                    <input type="text" name="depositNumber" placeholder="입금은행 선택시 표시됩니다." readonly class="selectedBank">&nbsp;
                                    <div class="depositGuide">무통장입금 이용안내</div>
                                    <ul class="depositExplain">
                                        <li>
                                            입금 시 주문자 이름과 상관없이 금액만 일치하면 정상 입금처리 됩니다.
                                        </li>
                                        <li>
                                            입금 기한이 지나면 주문은 자동취소 되므로 다시 주문해주세요.
                                        </li>
                                        <li>
                                            자동화 기기에서는 카드를 통해 이체해 주시기 바랍니다.<br>
                                            (일부 기기에서는 현금,통장 이체 제한됨)
                                        </li>
                                        <li>
                                            매진,판매 종료로 인해 주문취소가 될 수 있으며 안내문자가 발송됩니다. <br>(주문취소 시, 입금결제건이 전체
                                            취소됩니다.)
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- //innerWrap2 -->
        </div>
        <!-- //payment -->

        <!-- information -->
        <div id="information">
            <!-- title3 -->
            <h2 class="title">주문상품 정보</h2>
            <!-- //title3 -->

            <!-- innerWrap3 -->
            <div id="innerWrap3">
                <table id="table3" cellspacing="0" width="100%">
                    <tr>
                        <th>상품정보</th>
                        <th>수량</th>
                        <th>상품금액</th>
                        <th>할인금액</th>
                        <th>할인적용금액</th>
                        <th>배송비</th>
                    </tr>
                    <c:forEach items="${cartList}" var="cartVO">
	                    <tr>
	                        <td>
	                            <div class="productBox">
	                                <img src="${contextPath}/Category/Book/images/buybook/img_book_${cartVO.imgUrl}.jpg" alt="상품이미지" class="productImg"/><br>
	                                <div class="productExplain">${cartVO.title}</div>
	                            </div>
	                        </td>
	                        <td>${cartVO.quantity}</td>
	                        <td>
	                        	<strong>
	                        		<fmt:formatNumber value="${cartVO.price}"/>
	                        	</strong>원
	                        </td>
	                        <td>
	                        	<strong>
	                        		<fmt:formatNumber value="${cartVO.price - cartVO.salePrice}"/>
	                        	</strong>원
	                        </td>
	                        <td>
	                        	<strong style="color:red;">
	                        		<fmt:formatNumber value="${cartVO.salePrice}"/>
	                        	</strong>원
	                        </td>
	                        <td>무료</td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
            <!-- //innerWrap3 -->
        </div>
        <!-- //information -->

        <!-- buyerApproval -->
        <div id="buyerApproval">
            <!-- title -->
            <h2 class="title">주문자 동의</h2>
            <!-- //title -->

            <!-- innerWrap5 -->
            <div id="innerWrap5">
                <div class="approvalBox">
                    <label>
                        <input class="approval approvalAll" type="checkbox"> 구매 및 결제대행서비스 이용약관 등에 모두 동의합니다. (필수)
                    </label>
                    <div class="approvalContents">
                        <span>내용닫기</span> <img src="${contextPath}/Category/Book/images/btn_up.gif" alt="내용보기" />
                    </div>
                </div>
                <div class="slide">
                    <div class="approvalBox">
                        <label>
                            <input class="approval approvalButton" type="checkbox"> 구매조건 확인 및 결제 진행 동의
                        </label>
                        <div class="approvalBoxSub">위 상품의 구매조건을 확인하였으며, 구매에 동의합니다.</div>
                    </div>
                    <div class="approvalBox">
                        <label>
                            <input class="approval approvalButton" type="checkbox"> 개인정보 수집 이용 및 제3자 정보 제공 동의
                        </label>
                        <div class="approvalBoxSub2">
                            <textarea readonly>저작권의 귀속 및 이용제한

1. “회사”가 작성한 저작물에 대한 저작권 기타 지적재산권은 “회사”에 귀속합니다.

2. 이용자는 “회사”를 이용함으로써 얻은 정보 중 “회사”에게 지적재산권이 귀속된 정보를 “회사”의 사전 승낙없이 복제, 판매, 출판, 송신, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
                                
3. 회원이 창작하여 “회사”에 게재 또는 등록한 게시물에 대한 저작권은 회원 본인에게 있으며 해당 게시물이 타인의 지적 재산권을 침해하여 발생되는 모든 책임은 회원 본인에게 해당됩니다.
                                
4. 회원은 자신이 창작.등록한 게시물을 “회사”의 서비스를 운영, 전송 배포 또는 홍보를 위해 사용료 없는 사용권을 “교보문고”에 부여 합니다. 사용권은 “회사”가 서비스를 운영하는 동안 유효하며 회원의 탈퇴 후에도 유효합니다.
                                
① “회사”가 제공하는 관련 서비스 내에서 회원들의 게시물에 대한 복제.전시.배포.편집.저작물 작성

② “회사” 제휴 파트너에게 회원의 게시물 내용을 제공, 단, 회원의 아이디 외의 개인정보는 제공하지 않는다.

③ 상기 사용권 외에 회원의 게시물을 상업적으로 이용하고자 할 경우 회원의 사전 동의를 얻어야 한다. “회사”가 회원의 게시물을 상업적으로 이용할 경우 별도의 보상제도를 운영할 수 있다.
                                
5. 회원의 게시물에 대해 제3자로부터 저작권 및 기타 권리의 침해로 이의가 제기된 경우 “회사”는 해당 게시물을 임의로 삭제할 수 있으며 해당 게시물에 대한 법적 문제가 종결된 후 이를 근거로 “회사”에 신청이 있는 경우에만 상기 임시 삭제된 게시물을 다시 게재할 수 있습니다.
                            </textarea>
                            
                            <textarea readonly>개인정보의 수집 및 이용목적
                                
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며, 이용 목적이 변경될 시에는 사전동의를 구할 것입니다.
                                    
1) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
① 컨텐츠 제공, 특정 맞춤 서비스 제공
② 물품배송 또는 청구서 등 발송
③ 금융거래 본인 인증 및 금융 서비스
④ 구매 및 요금 결제, 요금추심 등
                                    
2) 회원관리
① 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인 식별
② 불량회원의 부정 이용방지와 비인가 사용방지
③ 가입의사 확인, 가입 및 가입횟수 제한
④ 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부, 추후 법정 대리인 본인확인
⑤ 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
                                    
3) 신규 서비스 개발 및 마케팅·광고에의 활용
① 신규 서비스 개발 및 맞춤 서비스 제공
② 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인
③ 이벤트 및 광고성 정보 제공 및 참여기회 제공
④ 접속빈도 파악 등에 대한 통계
                            </textarea>
                        </div>
                    </div>
                    <div class="approvalBox">
                        <label>
                            <input class="approval approvalButton" type="checkbox"> 결제대행서비스 이용약관 동의
                        </label>
                        <div class="approvalBoxSub2">
                            ㈜ITT는 아래 4사의 전자지급결제대행 서비스 및 결제대금예치 서비스를 사용합니다.
                            <div class="marginLine"></div>
                            <p><strong>주식회사 케이지이니시스</strong></p>
                            <p><strong>주식회사 LG 유플러스</strong></p>
                            <p><strong>한국 사이버 결제 주식회사</strong></p>
                            <p><strong>한국정보통신 주식회사</strong></p>
                            <div class="marginLine"></div>
                            ㈜ITT는 통신판매중개자로 통신판매의 당사자가 아닙니다.<br>
                            상품 정보 및 주문/배송, 취소/환불 등 거래 관련 ㈜ITT는 일체의 책임을 지지 않습니다.
                        </div>
                    </div>
                </div>
            </div>
            <!-- //innerWrap5 -->
        </div>
        <!-- //buyerApproval -->

        
        <!-- paymentSum -->
        <div id="paymentSum">
            <!-- title -->
            <h2 class="title">결제금액</h2>
            <!-- //title -->

            <!-- innerWrap4 -->
            <div id="innerWrap4">
                <table id="table4" cellspacing="0" width="100%">
                    <tr>
                        <th>총상품금액</th>
                        <th>배송비</th>
                        <th>할인금액</th>
                        <th>최종 결제금액</th>
                    </tr>
                    <tr>
                        <td>
                        	<strong>
                        		<fmt:formatNumber value="${orderVO.price}"/>
                       		</strong>
                        </td>
                        <td>무료</td>
                        <td>
                        	<strong>
                        		<fmt:formatNumber value="${orderVO.price - orderVO.allPrice}"/>
                        	</strong>	
                        </td>
                        <td>
                        	<strong style="color:red;">
                        		<fmt:formatNumber value="${orderVO.allPrice}"/>
                        	</strong>	
                        </td>
                    </tr>
                </table>
            </div>
            <!-- //innerWrap4 -->
        </div>
        <!-- //paymentSum -->
        <input type="submit" name="submit" style="display:none;">
        </form>

        <div id="payButton">결제하기</div>
        
        </div>
        <!-- contentWrap -->
    </div>
    <!-- //wrap -->

    <!--main_footer-->
    <jsp:include page="/WEB-INF/view/footer.jsp" flush="false"/>
    <!--//main_footer-->

</body>
</html>