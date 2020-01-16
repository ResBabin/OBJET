<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- 	<c:if test="${support.sptbank == '국민'}"><c:set var="sptbank1" value="selected"/></c:if>
	<c:if test="${support.sptbank == '기업'}"><c:set var="sptbank2" value="selected"/></c:if>
	<c:if test="${support.sptbank == '농협'}"><c:set var="sptbank3" value="selected"/></c:if>
	<c:if test="${support.sptbank == '대구'}"><c:set var="sptbank4" value="selected"/></c:if>
	<c:if test="${support.sptbank == '수협'}"><c:set var="sptbank5" value="selected"/></c:if>
	<c:if test="${support.sptbank == '신한'}"><c:set var="sptbank6" value="selected"/></c:if>
	<c:if test="${support.sptbank == '씨티'}"><c:set var="sptbank7" value="selected"/></c:if>
	<c:if test="${support.sptbank == '우리'}"><c:set var="sptbank8" value="selected"/></c:if>
	<c:if test="${support.sptbank == '우체국'}"><c:set var="sptbank9" value="selected"/></c:if>
	<c:if test="${support.sptbank == '전북'}"><c:set var="sptbank10" value="selected"/></c:if>
	<c:if test="${support.sptbank == '제일'}"><c:set var="sptbank11" value="selected"/></c:if>
	<c:if test="${support.sptbank == '제주'}"><c:set var="sptbank12" value="selected"/></c:if>
	<c:if test="${support.sptbank == '하나'}"><c:set var="sptbank13" value="selected"/></c:if> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 설정하기</title>
<c:import url="../header.jsp" />
<c:import url="../headerSearch.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 
 $(function(){
 // 헤드라인 글자수 세기
		 $("#sptheader").keyup(function(e){
			 var content = $(this).val();
			 $("#counter1").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 30자 )");	// 글자수 실시간 카운팅
			 
			 if(content.length > 30){
				 alert("최대 30자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,30));
				 $("#counter1").html("( <span style='color:red;font-size:9pt;'>30 </span>/ 최대 30자)");
			 } 
		 });
 
	// 소개 글자수 세기
	 $("#sptintro").keyup(function(e){
		 var content = $(this).val();
		 $("#counter2").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 1000자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 1000){
			 alert("최대 1000자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,1000));
			 $("#counter2").html("( <span style='color:red;font-size:9pt;'>1000 </span>/ 최대 1000자)");
		 } 
	 });
	
	// 감사메시지 글자수 세기
	 $("#thanksmsg").keyup(function(e){
		 var content = $(this).val();
		 $("#counter3").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 300자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 300){
			 alert("최대 300자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,300));
			 $("#counter3").html("( <span style='color:red;font-size:9pt;'>300 </span>/ 최대 300자)");
		 } 
	 });
	
	// 체크박스 전체선택 및 전체해제
		$("#allCheck").click(function(){
			if($(this).is(":checked")){
				$(".chk").prop("checked", true);
			} else {
				$(".chk").prop("checked", false);
			}
		});

		// 한개 체크박스 선택 해제시 전체선텍 체크박스도 해제 & 약관 전체동의 시에만 가입하기 버튼 활성화
		$(".chk").click(function(){
			if($("input[name='RowCheck']:checked").length == 2){
				$("#allCheck").prop("checked", true);
				$("#btnsub").removeAttr('disabled');
			}else{
				$("#allCheck").prop("checked", false);
				$("#btnsub").attr("disabled", true);
			}	
		});
		
	
 })// documentReady..
 </script>
</head>

<body>
	<!-- 후원설정 페이지 시작 -->
<div class="wrapEnrollPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">후원 상세정보 설정</p>
	
	<!-- 후원정보입력섹션 시작! -->
	
	<div class="applySection">
	<form action="updateApplySupport.do" method="post">
			<input type="hidden" name="artistid" value="${loginUser.userid }">
		<table class="applyTable">
			<tr><th>헤드라인<span style="color:red">*</span></th></tr>
			<tr><td>나를 한마디로 표현할 수 있는 멋진 문구를 입력해주세요.&emsp;
					<span style="color:#aaa; font-size:9pt;" id="counter1">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 30자 )</span>
					<div class="ui form"><span class="field">
		    		<input type="text" name="sptheader" id="sptheader" value="${applysupport.sptheader}" style="width:100%;" required></span></div>
			</td></tr>
			
			<tr><th><br><br>소개<span style="color:red">*</span></th></tr>
			<tr><td>성공적인 후원을 위해 가장 중요한 영역입니다. 간략한 작가 소개, 창작동기, 후원 목표 등 <br>
					후원자들이 궁금해 할 내용들이 포함되면 좋습니다.&emsp;
					<span style="color:#aaa; font-size:9pt;" id="counter2">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 1000자 )</span>
					<div class="ui form"><span class="field">
		    		<textarea name="sptintro" id="sptintro" style="width:100%;height:400px;" required>${applysupport.sptintro}</textarea></span></div>
			</td></tr>
			
			<tr><th><br><br>감사 메시지<span style="color:red">*</span></th></tr>
			<tr><td>후원한 팬들에게 보내는 감사 메시지를 입력해주세요.&emsp;
					<span style="color:#aaa; font-size:9pt;" id="counter3">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 300자 )</span>
					<div class="ui form"><span class="field">
		    		<textarea name="thanksmsg" id="thanksmsg" style="width:100%;height:180px;" required>${applysupport.thanksmsg}</textarea></span></div>
			</td></tr>
			
			<tr><th><br><br>후원 계좌<span style="color:red">*</span></th></tr>
			<tr><td>후원 받을 계좌를 입력해주세요. 후원자에게는 노출되지 않습니다.&emsp;<br>
					<select class="ui search dropdown" name="sptbank" id="sptbank" required>
						  <option value="국민" <c:if test="${applysupport=='국민'}">selected</c:if> >국민</option>
						  <option value="기업" <c:if test="${applysupport=='기업'}">selected</c:if> >기업</option>
						  <option value="농협" ${sptbank3}>농협</option>
						  <option value="대구" ${sptbank4}>대구</option>
						  <option value="수협" ${sptbank5}>수협</option>
						  <option value="신한" ${sptbank6}>신한</option>
						  <option value="씨티" ${sptbank7}>씨티</option>
						  <option value="우리" ${sptbank8}>우리</option>
						  <option value="우체국" <c:if test="${applysupport == '우체국'}">selected</c:if> >우체국</option>
						  <option value="전북" ${sptbank10}>전북</option>
						  <option value="제일" ${sptbank11}>제일</option>
						  <option value="제주" ${sptbank12}>제주</option>
						  <option value="하나" ${sptbank13}>하나</option>
						</select>&emsp;
					<span class="ui form"><span class="field">
		    		<input type="text" name="sptaccount" id="sptaccount" style="width:50%;" placeholder="(-)제외" value="${applysupport.sptaccount}"onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></span></span>
			</td></tr>
			
		</table>
	
	<!-- 후원정보입력섹션 끝! -->
	<br>
	<!-- 약관동의섹션 -->
<!-- 	<div class="termsSection">
		<p style="font-size:15pt; font-weight:600; padding:15px;">이용약관동의<span style="color:red"> *</span>
		<span style="font-size: 9pt; color:#aaa; font-weight: 200;">이용약관에 동의하지 않은 경우, 회원가입 및 서비스 이용이 불가능 합니다.</span></p>
		<div class="termsCheck">
			<input type="checkbox" class="chk" id="allCheck"/> <span style="font-weight: 600;">전체 동의</span><br>
			&emsp;<input type="checkbox" class="chk" name="RowCheck"> 이용약관<span class="termsCheckLabel"> (필수)</span>&ensp;<a onclick="winOpen1();">약관보기▶</a><br>
			&emsp;<input type="checkbox" class="chk" name="RowCheck"> 개인정보 및 고유식별정보 수집 및 이용동의<span class="termsCheckLabel"> (필수)</span>&ensp;<a onclick="winOpen2();">약관보기▶</a>
		</div>
	</div> -->
	<br><br><br>
	<div align="center">
		<input type="submit" class="ui green button" value="저장" id="btnsub"> &nbsp;
		<input type="reset" class="ui button" value="취소"> &nbsp;
	</div>
	
	</form>
	</div>
</div>

<!-- 후원설정 페이지 끝 -->
	
<br><br><br>
<c:import url="../footer.jsp" />
</body>
</html>