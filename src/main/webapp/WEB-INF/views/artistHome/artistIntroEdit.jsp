<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 소개 수정</title>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 $(function(){
	 $("#userpic").click(function(){
		$("#useropic").click(); 
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
 </script>
</head>
<body>

<!-- 회원가입 페이지 시작 -->
<div class="wrapArtistIntroEdit">


<p style="text-align:center; font-size: 20pt;">작가소개 편집</p>
<br><br>

	<!-- 프로필 사진 유무에 따라 조건 걸어야 함. -->
	<form>
	<input type="hidden" name="userid" value="">
	<div align="center">
		<img class="profileImage2" id="userpic" src="resources/images/basicprofilepic2.png">
			<input type="file" name="up_useropic" id="useropic"accept=".jpg,.jpeg,.png" onChange="preview(this, $('#userpic'));" style="display:none;">
			<input type="hidden" name="useropic" id="useropic" value="">
			<input type="hidden" name="userrpic" id="userrpic" value="">
		<br><br>
		<p style="font-size: 15pt; font-weight: 500;">오브제프로젝트</p>
	</div>
	
	<p class="artistIntroCategory2">한 단어 소개</p>
	<p class="artistIntroContent2"><div class="ui input"><input type="text" name="userintros" id="userintros" value="" placeholder="나를 표현할 한 단어"></div></p>
	
	<p class="artistIntroCategory2">소개</p>
	<p class="artistIntroContent2">
		<div class="ui form">
			<div class="field">
    			<textarea name="userintrol" id="userintrol" value="" placeholder="본인에 대해 소개해주세요"></textarea>
  			</div>
  		</div>
	
	<p class="artistIntroCategory2">관련태그<span style="color:#aaa; font-size: 9pt; font-weight: normal;">&ensp;(최대 3개 선택가능)</span></p>
	<p class="artistIntroContent2">
		<table class="editTagTable">
			<tr>
				<td><input type="checkbox" class="usertag" name="usertag" value="건축"> 건축<td>
				<td><input type="checkbox" class="usertag" name="usertag" value="공예"> 공예<td>
				<td><input type="checkbox" class="usertag" name="usertag" value="디자인"> 디자인<td>
				<td><input type="checkbox" class="usertag" name="usertag" value="사진"> 사진<td>
			</tr>
			<tr>
				<td><input type="checkbox" class="usertag" name="usertag" value="서예"> 서예<td>
				<td><input type="checkbox" class="usertag" name="usertag" value="조각"> 조각<td>
				<td><input type="checkbox" class="usertag" name="usertag" value="회화"> 회화<td>
				<td><input type="checkbox" class="usertag" name="usertag" value="기타"> 기타<td>
			</tr>
		</table>
	</p>
	
	
	</form>
	
	
	
</div><!-- 회원가입 페이지 끝 -->
<br><br><br><br><br>
</body>
</html>