<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 등록</title>
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

	// 오브제 시작 날짜에 자동으로 오늘 날짜 넣기
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
 
	$("#objetstartdate").val(yyyy+"-"+mm+"-"+dd);

	
	
	 // 이미지 클릭 시 파일 열리기
	 $("#objetposter").click(function(){
		$("#originmainposter").click(); 
	 });
	 
	 // 닉네임 10자 제한
	 $("#objettitle").keyup(function(e){
		 var content = $(this).val();
		 $("#counter1").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 30자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 30){
			 alert("최대 30자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,30));
			 $("#counter1").html("( <span style='color:red;font-size:9pt;'>30 </span>/ 최대 30자)");
		 } 
	 });
	 
	// 소개 500자 제한
	 $("#objetintro").keyup(function(e){
		 var content = $(this).val();
		 $("#counter2").html("( <span style='color:#4ecdc4;font-size:9pt;'>"+content.length+"</span> / 최대 500자 )");	// 글자수 실시간 카운팅
		 
		 if(content.length > 500){
			 alert("최대 500자까지만 입력 가능합니다.");
			 $(this).val(content.substring(0,500));
			 $("#counter2").html("( <span style='color:red;font-size:9pt;'>500 </span>/ 최대 500자)");
		 } 
	 });
	
	
	 //소개 글 입력 후 DB 저장시 적용
	 var str1 = $('#objetintro').val();
	 str1 = str1.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	 $('#objetintro').val(str1);
	 
	 //소개 DB에서 불러와 textarea로 수정 시 <br>이 그대로 노출되는 것을 방지
	 var str1 = $('.#objetintro').val();
	 str1 = str1.split('<br/>').join("\r\n");
	 $('#objetintro').val(str1);
	 
	 
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

		var chkbox = document.getElementsByName("objettag");
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

<!-- 오브제 등록 페이지 시작 -->
	<div class="wrapCreateObjet">
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">오브제 등록</p>
		
		<!-- 등록 테이블 시작 -->
		<form action="" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userid" value="">
		<div align="center">
			<table class="createObjetTable">
				<tr>
					<th>오브제명</th>
					<td><div class="ui input"><input type="text" name="objettitle" id="objettitle" placeholder="전시회 제목을 입력해주세요." required style="width:300px; height:30px;"></div>
						<span style="color:#aaa; font-size:9pt;" id="counter1">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 30자 )</span>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">오브제 소개</th>
					<td><div class="ui form"><div class="field"><textarea name="objetintro" id="objetintro" style="font-size: 9pt;" placeholder="내용을 입력해주세요."></textarea></div></div>
						<span style="color:#aaa; font-size:9pt;" id="counter2">( <span style="color:#4ecdc4;font-size:9pt;">0</span> / 최대 500자 )</span>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">오브제 포스터</th>
					<td><img class="objetposter" id="objetposter" src="resources/images/objet/originposter.jpg">
						<input type="file" name="originmainposter" id="originmainposter" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#objetposter'));" style="display:none;">
						<div style="color:#00c73c; font-size:9pt;">권장 크기 : 1400 x 450px jpg,jpeg,png 형식의 정지 이미지만 등록됩니다.</div>
					</td>
				</tr>
				
				<tr>
					<th>오브제 기간</th>
					<td><input type="date" id="objetstartdate" min="sysdate" required> ~ <input type="date" id="objetenddate"></td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">관련태그<br><span style="color:#aaa; font-size: 9pt; font-weight: normal;">(최대 3개 선택)</span></th>
					<td>
						<table class="editTagTable">
							<tr>
								<td><input type="checkbox" name="objettag" value="건축" onClick="count_ck(this);"> 건축</td>
								<td><input type="checkbox" name="objettag" value="공예" onClick="count_ck(this);"> 공예</td>
								<td><input type="checkbox" name="objettag" value="디자인" onClick="count_ck(this);"> 디자인</td>
								<td><input type="checkbox" name="objettag" value="사진" onClick="count_ck(this);"> 사진</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="objettag" value="서예" onClick="count_ck(this);"> 서예</td>
								<td><input type="checkbox" name="objettag" value="조각" onClick="count_ck(this);"> 조각</td>
								<td><input type="checkbox" name="objettag" value="회화" onClick="count_ck(this);"> 회화</td>
								<td><input type="checkbox" name="objettag" value="기타" onClick="count_ck(this);"> 기타</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><hr><br>
			
			
			<% for(int i = 1; i < 2; i++){ %>
				<table class="createObjetTable2">
					<tr>
						<td rowspan="2" style="width:5%"><%= i %></td>
					</tr>
					<tr>
						<td rowspan="2" style="width:15%">ㅎㅎ</td>
					</tr>
					<tr>
						<td style="width:40%">gg</td>
					</tr>
					<tr>
						<td style="width:40%">dd</td>
					</tr>
				</table>
			<%} %>
			
			
		</div>
		</form>
		<!-- 등록 테이블 끝 -->
		
		
		
	</div>
<!-- 전시 등록 페이지 끝 -->


</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<c:import url="../footer.jsp" />
</html>