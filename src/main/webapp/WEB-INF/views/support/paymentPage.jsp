<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 후원</title>
<!-- 아임포트 라이브러리 ============================================== -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('imp42650900'); // 부여받은 "가맹점 식별코드"를 사용

IMP.request_pay({
    pg : 'html5_inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : '${support.artistid}_' + new Date().getTime(),
    name : '오브제 작가후원',
    amount : '${support.sptamount}',
    buyer_email : '${loginUser.email}',
    buyer_name : '${loginUser.username}',
    buyer_tel : '${loginUser.phone}',
    buyer_addr : '',
    buyer_postcode : ''
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "insertSupport.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    		type: 'POST',
    		data: {
    			artistid : '${support.artistid}', sptid : '${support.sptid}', sptamount:${support.sptamount}, sptcomment:'${support.sptcomment}', sptno:rsp.imp_uid
    		}
    	}).done(function(result) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if (result=="ok") {
    			var msg = '후원 금액 : ' + rsp.paid_amount;
    			msg += '\n후원해주셔서 감사드립니다. :)';
    			alert(msg);
    			window.location.href="artistHomeMain.do?userid=${support.artistid}&loginUser=${support.sptid}";
    		} else {
    			var msg = '결제가 정상적으로 진행되지 않아 자동취소처리 하였습니다.';
    			alert(msg);
    			window.location.href="artistHomeMain.do?userid=${support.artistid}&loginUser=${support.sptid}";
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        alert(msg);
    }
    
    /*jQuery.ajax({
		url : "insertSupport.do",
		type: "post",
		data: {artistid : '${support.artistid}', sptid : '${support.sptid}', sptamount:${support.sptamount}, sptcomment:'${support.sptcomment}'},
		success : function(result){
			if(result == "ok"){
				window.location.href="artistHomeMain.do?userid=${support.artistid}&loginUser=${loginUser.userid}"
			}else{
				window.location.href="artistHomeMain.do?userid=${support.artistid}&loginUser=${loginUser.userid}"
			}
			
		},
		error : function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	})//ajax...
	*/
});

</script>
<!-- 아임포트 라이브러리 ============================================== -->

</head>
<body>

</body>
</html>