<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineBR", "<br>"); %>

<c:if test="${usersProfile.usertag != null}">
		<c:forTokens var="value" items="${ usersProfile.usertag }" delims="," >
			<c:if test="${value eq '건축'}"><c:set var="usertag1" value="checked"/></c:if>
			<c:if test="${value eq '공예'}"><c:set var="usertag2" value="checked"/></c:if>
			<c:if test="${value eq '디자인'}"><c:set var="usertag3" value="checked"/></c:if>
			<c:if test="${value eq '사진'}"><c:set var="usertag4" value="checked"/></c:if>
			<c:if test="${value eq '서예'}"><c:set var="usertag5" value="checked"/></c:if>
			<c:if test="${value eq '조각'}"><c:set var="usertag6" value="checked"/></c:if>
			<c:if test="${value eq '회화'}"><c:set var="usertag7" value="checked"/></c:if>
			<c:if test="${value eq '기타'}"><c:set var="usertag8" value="checked"/></c:if>
		</c:forTokens>
 	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 소개 수정</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 $(function(){

	 
	 // 이미지 클릭 시 파일 열리기
	 $("#userpic").click(function(){
		$("#up_useropic").click(); 
	 });
	 
	 
	// 프로필 사진 삭제
	$("#deletePic").click(function(){
		if($(this).is(":checked")){
			$("#up_useropic").val("");
			$("#useropic").val("");
			$("#userrpic").val("");
			$("#userpic").attr('src', 'resources/images/basicprofilepic2.png');
		}
		
	// 프로필 사진 추가 시 라디오버튼 해제
	if($("#up_useropic").val != null){
		$("#deletePic").prop("checked", false);
	}
	});
	 
	

	 // 닉네임 10자 제한
	 $("#userintros").keyup(function(e){
		 var content = $(this).val();
		 $("#counter1").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 10자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 10){
			 alert("최대 10자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,10));
			 $("#counter1").html("( <span style='color:red;'>10 </span>/ 최대 10자)");
		 } 
	 });
	 
	// 소개 500자 제한
	 $("#userintrol").keyup(function(e){
		 var content = $(this).val();
		 $("#counter2").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 500자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 500){
			 alert("최대 500자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,500));
			 $("#counter2").html("( <span style='color:red;'>500 </span>/ 최대 500자)");
		 } 
	 });
	
	
	// 포트폴리오 1000자 제한
	 $("#portfolio").keyup(function(e){
		 var content = $(this).val();
		 $("#counter3").html("( <span style='color:#4ecdc4;'>"+content.length+"</span> / 최대 1000자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 1000){
			 alert("최대 1000자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,1000));
			 $("#counter3").html("( <span style='color:red;'>1000 </span>/ 최대 1000자)");
		 } 
	 });
	
	

	
	 
	
	
 }); // documentReady...
 
 
//프로필 이미지 미리보기
 function preview(input, target) {
 	if(input.files && input.files[0]){
 	  	var fileName= input.files[0].name;
 	  	var ext=fileName.substr(fileName.length-3, fileName.length);
 	  	var isCheck=false; 
 	  	if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='jpeg' || ext.toLowerCase()=='png'){
 	  		isCheck=true;               
 	  	}
 	  	if(isCheck==false){
 	  		alert("jpg, jpeg, png 형식의 이미지만 가능합니다.\n다시 등록하여 주십시오.");
 	  		jQuery(input).val("");
 	  		return;
 	  	}
 	  	var reader = new FileReader();
 	  	reader.readAsDataURL(input.files[0]);          
 	  	reader.onload = function(e) {
 	  	  jQuery(target).attr('src', e.target.result);
 	  	}
 	}
 }
 

 
 // 체크박스 3개 개수제한 걸기
 function count_ck(obj){

		var chkbox = document.getElementsByName("usertag");
		var chkCnt = 0;
		for(var i = 0; i < chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}
		}

		if(chkCnt>3){
			alert("최대 3개까지만 선택 가능합니다.");
			obj.checked = false;
			return false;
		}
	}

 </script>
</head>
<body>

<!-- 작가소개수정 페이지 시작 -->
<div class="wrapArtistIntroEdit">


<p style="text-align:center; font-size: 20pt;">작가소개 편집</p>
<br><br>

	<!-- 프로필 사진 유무에 따라 조건 걸어야 함. -->
	<form action="updateArtistIntro.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userid" value="${usersProfile.userid}">
	<div align="center">

		<c:if test="${usersProfile.userrpic != null }">
		<img class="profileImage2" id="userpic" src="resources/users_upfiles/${usersProfile.userrpic}">
		</c:if>
		<c:if test="${usersProfile.userrpic == null }">
		<img class="profileImage2" id="userpic" src="resources/images/basicprofilepic2.png">
		</c:if>
		<br><br>
		
		<input type="radio" id="deletePic"><span style="font-size: 9pt;">&ensp;프로필 사진 삭제</span>
			<input type="file" name="up_useropic" id="up_useropic" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#userpic'));" style="display:none;">
			<input type="hidden" name="useropic" id="useropic" value="${usersProfile.useropic }">
			<input type="hidden" name="userrpic" id="userrpic" value="${usersProfile.userrpic }">
		<br><br>
		<p style="font-size: 15pt; font-weight: 500;">${usersProfile.nickname }</p>
	</div>
	
	<p class="artistIntroCategory2">한 단어 소개</p>
	<p class="artistIntroContent2"><div class="ui input"><input type="text" name="userintros" id="userintros" value="${usersProfile.userintros }" placeholder="나를 표현할 한 단어"></div>
	<span style="color:#aaa;" id="counter1">( <span style="color:#4ecdc4">0</span> / 최대 10자 )</span></p>
	
	<p class="artistIntroCategory2">소개</p>
	<p class="artistIntroContent2">
		<div class="ui form">
			<div class="field">
    			<textarea name="userintrol" id="userintrol" placeholder="본인에 대해 소개해주세요.(최대 500자)">${usersProfile.userintrol}</textarea>
  			</div>
  			<span style="color:#aaa;" id="counter2">( <span style="color:#4ecdc4">0</span> / 최대 500자 )</span>
  		</div>
  	<p>
	
	<p class="artistIntroCategory2">관련태그<span style="color:#aaa; font-size: 9pt; font-weight: normal;">&ensp;(최대 3개 선택가능)</span></p>
	<p class="artistIntroContent2">
		<table class="editTagTable">
			<tr>
				<td><input type="checkbox" name="usertag" value="건축" onClick="count_ck(this);" ${usertag1}> 건축</td>
				<td><input type="checkbox" name="usertag" value="공예" onClick="count_ck(this);" ${usertag2}> 공예</td>
				<td><input type="checkbox" name="usertag" value="디자인" onClick="count_ck(this);" ${usertag3}> 디자인</td>
				<td><input type="checkbox" name="usertag" value="사진" onClick="count_ck(this);" ${usertag4}> 사진</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="usertag" value="서예" onClick="count_ck(this);" ${usertag5}> 서예</td>
				<td><input type="checkbox" name="usertag" value="조각" onClick="count_ck(this);" ${usertag6}> 조각</td>
				<td><input type="checkbox" name="usertag" value="회화" onClick="count_ck(this);" ${usertag7}> 회화</td>
				<td><input type="checkbox" name="usertag" value="기타" onClick="count_ck(this);" ${usertag8}> 기타</td>
			</tr>
		</table>
	</p>
	
	<p class="artistIntroCategory2">기타이력 및 포트폴리오</p>
	<p class="artistIntroContent2">
		<div class="ui form">
			<div class="field">
    			<textarea name="portfolio" id="portfolio" placeholder="기타 이력 및 수상내역 등을 자유롭게 기술하세요.">${usersProfile.portfolio}</textarea>
  			</div>
  			<span style="color:#aaa;" id="counter3">( <span style="color:#4ecdc4">0</span> / 최대 1000자 )</span>
  		</div>
  	</p>
  	
  	<p class="artistIntroCategory2">웹사이트<span style="font-size: 9pt; color:red; font-weight: normal;">&emsp;*URL의 경우 'http://'를 포함하여 입력하여 주십시오.</span></p>
	<p class="artistIntroContent2">
		<!-- 페이스북 --><div class="artistURL"><i class="facebook f icon"></i></div><div class="ui input" style="width: 500px;">
			<input type="text" name="facebook" id="facebook" value="${usersProfile.facebook}" placeholder="페이스북 계정"></div><br><br>
		
	 	<!-- 인스타그램 --><div class="artistURL"><i class="instagram icon"></i></div><div class="ui input" style="width: 500px;">
	 		<input type="text" name="instagram" id="instagram" value="${usersProfile.instagram}" placeholder="인스타그램 계정"></div><br><br>
		
	 	<!-- 기타URL --><div class="artistURL"><i class="linkify icon"></i></div><div class="ui input" style="width: 500px;">
	 		<input type="text" name="etcurl" id="etcurl" value="${usersProfile.etcurl}" placeholder="기타 URL"></div><br><br>
		
	 	<!-- 이메일 --><div class="artistURL"><i class="envelope outline icon"></i></div><div class="ui input" style="width: 500px;">
	 		<input type="text" name="artistemail" id="artistemail" value="${usersProfile.artistemail}" placeholder="작가 이메일"></div>
  	</p>
	<br><br><br>
	<div align="center">
		<input type="submit" class="ui green button" value="수정하기" id="btnsub"> &nbsp;
		<input type="reset" class="ui button" value="다시작성"> &nbsp;
	</div>
	</form>
	
	
	
</div><!-- 작가소개 페이지 끝 -->
<br><br><br><br>

</body>
<c:import url="../footer.jsp" />
</html>