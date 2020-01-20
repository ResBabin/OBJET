<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
 
 	function deleteApplySupport(){
	 if(confirm('후원 정보를 삭제하시겠습니까?')==true){
		 $.ajax({
			 url: 'deleteApplySupport.do',
			 data : {artistid : '${loginUser.userid}'},
			 method : "get",
			 success : function(result){
				 if(result == "ok"){
					 alert("후원 정보가 삭제되었습니다. 작가홈으로 이동합니다.");
					 window.location.href="artistHomeMain.do?userid=${loginUser.userid}&loginUser=${loginUser.userid}";
				 }else{
					 alert("후원 정보 삭제에 실패했습니다.");
					 window.location.href="moveSupportManagement.do?artistid=${loginUser.userid}&sptid=${loginUser.userid}";
				 }
			 },
			error : function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
			 
		 }) // ajax...
		 return true;
	 }else{
		 return false;
	 }
 }
 	
 	
 </script>
</head>

<body>
	<!-- 후원설정 페이지 시작 -->
<div class="wrapEnrollPage">

	<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">후원 상세정보 수정</p>
	
	<!-- 후원정보입력섹션 시작! -->
	
	<div class="applySection">
	<form action="updateApplySupport.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="artistid" value="${loginUser.userid }">
			<input type="hidden" name="artistofile" value="${applysupport.artistofile }">
		    <input type="hidden" name="artistrfile" value="${applysupport.artistrfile }">
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
			<tr><td>후원 받을 계좌를 입력해주세요. <span style="color:#aaa;">(정산용 계좌이며 후원자에게 노출되지 않습니다)</span><br>
					<select class="ui search dropdown" name="sptbank" id="sptbank" required>
						  <option value="국민" <c:if test="${applysupport.sptbank == '국민'}">selected</c:if>>국민</option>
						  <option value="기업" <c:if test="${applysupport.sptbank == '기업'}">selected</c:if>>기업</option>
						  <option value="농협" <c:if test="${applysupport.sptbank == '농협'}">selected</c:if>>농협</option>
						  <option value="대구" <c:if test="${applysupport.sptbank == '대구'}">selected</c:if>>대구</option>
						  <option value="수협" <c:if test="${applysupport.sptbank == '수협'}">selected</c:if>>수협</option>
						  <option value="신한" <c:if test="${applysupport.sptbank == '신한'}">selected</c:if>>신한</option>
						  <option value="씨티" <c:if test="${applysupport.sptbank == '씨티'}">selected</c:if>>씨티</option>
						  <option value="우리" <c:if test="${applysupport.sptbank == '우리'}">selected</c:if>>우리</option>
						  <option value="우체국" <c:if test="${applysupport.sptbank == '우체국'}">selected</c:if>>우체국</option>
						  <option value="전북" <c:if test="${applysupport.sptbank == '전북'}">selected</c:if>>전북</option>
						  <option value="제일" <c:if test="${applysupport.sptbank == '제일'}">selected</c:if>>제일</option>
						  <option value="제주" <c:if test="${applysupport.sptbank == '제주'}">selected</c:if>>제주</option>
						  <option value="하나" <c:if test="${applysupport.sptbank == '하나'}">selected</c:if>>하나</option>
						</select>&emsp;
					<span class="ui form"><span class="field">
		    		<input type="text" name="sptaccount" id="sptaccount" style="width:50%;" placeholder="(-)제외" value="${applysupport.sptaccount}"onKeyup="this.value=this.value.replace(/[^0-9]/g, '');" required></span></span>
			</td></tr>
			
			<tr><th><br><br>필수서류<span style="color:red">*</span></th></tr>
			<tr><td>오브제 공지사항 확인 후, 관련 첨부 파일을 다운 받아 작성한 후 제출해주세요.&emsp;<span style="color:teal; text-decoration: underline;">[공지사항 이동]</span><br>
					<span style="color:#aaa;">해당 파일은 안전하게 보관되며 후원자에게 노출되지 않습니다.</span></td></tr>
			<tr><td><table class="supportdetailTable" style="width:100%;">
						<tr>
							<th>현재</th><td style="text-align: left;"><i class="olive folder open icon"></i><span style="font-weight: 600; color: grey;">${applysupport.artistofile}</span> </td>
						</tr>
						<tr>
							<th>수정</th><td style="text-align: left;"><i class="olive folder open icon"></i><input type="file" name="artistupfile"></td>
						</tr>
					</table>
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
	<br><br>
	<div align="center">
		<input type="submit" class="mainBtn" value="저장" id="btnsub"> &nbsp;
		<input type="reset" class="mainBtn1" value="취소"> &nbsp;
	</div>
	</form>
	<br><br>
	<div align="center">
		<p style="color:#aaa; text-decoration: underline;" onclick="deleteApplySupport()">후원 정보 삭제</p>
	</div>
	
	
	</div>
</div>

<!-- 후원설정 페이지 끝 -->
	
<br><br><br>
<c:import url="../footer.jsp" />
</body>
</html>