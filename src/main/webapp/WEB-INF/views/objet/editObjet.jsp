<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오브제 수정</title>
<c:import url="../header.jsp" />
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- 제작용 css -->
 <link rel= "stylesheet" type="text/css" href="resources/css/mychoe.css">
 
<!-- color picker -->
<script src="resources/js/jquery.minicolors.js"></script>
<link rel="stylesheet" href="resources/css/jquery.minicolors.css">
  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css">

<style>
.minicolors-sprite {
  background-image: url(resources/images/jquery.minicolors.png);
}

input[type="date"] {padding: 1em 1.5em; font-size:1.2em}

</style>

<script type="text/javascript">
$(function(){

	/* // 오브제 시작 날짜에 자동으로 오늘 날짜 넣기
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
 
	$("#objetstartdate").val(yyyy+"-"+mm+"-"+dd); */
	
	 // 이미지 클릭 시 파일 열리기
	 $("#objetposter").click(function(){
		$("#upmainposter").click(); 
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
	
	// 작품각각
	for(var i = 1; i < 9; i++){
		// 작품명 30자 제한
		$("#objettitle"+i).keyup(function(e){
			 var content = $(this).val();
			 
			 if(content.length > 30){
				 alert("최대 30자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,30));
			 } 
		 });
		 
		// 작품소개 500자 제한
		 $("#objetintro"+i).keyup(function(e){
			 var content = $(this).val(); 
			 
			 if(content.length > 500){
				 alert("최대 500자까지만 입력 가능합니다.");
				 $(this).val(content.substring(0,500));
			 } 
		 });
	
	}// for문 끝

	
	
	// 이미지 파일 클릭시 파일 열리게
	 $("#createobjetimg1").click(function(){
		 $("#objetofile1").click(); 
	 });
	
	 $("#createobjetimg2").click(function(){
		 $("#objetofile2").click(); 
	 });
	 
	 $("#createobjetimg3").click(function(){
		 $("#objetofile3").click(); 
	 });
	 
	 $("#createobjetimg4").click(function(){
		 $("#objetofile4").click(); 
	 });
	 
	 $("#createobjetimg5").click(function(){
		 $("#objetofile5").click(); 
	 });
	 
	 $("#createobjetimg6").click(function(){
		 $("#objetofile6").click(); 
	 });
	 
	 $("#createobjetimg7").click(function(){
		 $("#objetofile7").click(); 
	 });
	 
	 $("#createobjetimg8").click(function(){
		 $("#objetofile8").click(); 
	 });
	 
	 //소개 글 입력 후 DB 저장시 적용
	 var str1 = $('#objetintro').val();
	 str1 = str1.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	 $('#objetintro').val(str1);
	 
	 //소개 DB에서 불러와 textarea로 수정 시 <br>이 그대로 노출되는 것을 방지
	 var str1 = $('#objetintro').val();
	 str1 = str1.split('<br/>').join("\r\n");
	 $('#objetintro').val(str1);
	 
	 //colorpicker
	 $('.demo').each( function() {
       $(this).minicolors({
         control: $(this).attr('data-control') || 'hue',
         defaultValue: $(this).attr('data-defaultValue') || '',
         format: $(this).attr('data-format') || 'hex',
         keywords: $(this).attr('data-keywords') || '',
         inline: $(this).attr('data-inline') === 'true',
         letterCase: $(this).attr('data-letterCase') || 'lowercase',
         opacity: $(this).attr('data-opacity'),
         position: $(this).attr('data-position') || 'bottom left',
         swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
         change: function(value, opacity) {
           if( !value ) return;
           if( opacity ) value += ', ' + opacity;
           if( typeof console === 'object' ) {
             console.log(value);
           }
         },
         theme: 'bootstrap'
       });
   	});
	 
}); // documentReady...


//포스터 이미지 미리보기
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
	
		<p style="font-size: 20pt; padding-top:50px; color:#373737; text-align:center;">오브제 수정</p>
		
		<!-- 등록 테이블 시작 -->
		<form action="updateMyObjet.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userid" value="${loginUser.userid }">
		<input type="hidden" name="objetno" value="${objet.objetno }">
		<div align="center">
			<table class="createObjetTable">
				<tr>
					<th>오브제명</th>
					<td><div class="ui input"><input type="text" name="objettitle" id="objettitle" value="${objet.objettitle }" style="width:300px; height:30px;"></div>
						<span style="color:#aaa; font-size:9pt;" id="counter1">( <span style="color:#4ecdc4;font-size:9pt;">${fn:length(objet.objettitle ) }</span> / 최대 30자 )</span>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">오브제 소개</th>
					<td><div class="ui form"><div class="field"><textarea name="objetintro" id="objetintro" style="font-size: 9pt;width:600px;">${objet.objetintro }</textarea></div></div>
						<span style="color:#aaa; font-size:9pt;" id="counter2">( <span style="color:#4ecdc4;font-size:9pt;">${fn:length(objet.objetintro ) }</span> / 최대 500자 )</span>
					</td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 10px;">오브제 포스터</th>
					<td><img class="objetposter" id="objetposter" src="resources/images/objet/${objet.renamemainposter }">
						<input type="file" name="upmainposter" id="upmainposter" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#objetposter'));" style="display:none;">
						<input type="hidden" name="originmainposter" id="originmainposter" value="${objet.originmainposter }">
						<input type="hidden" name="renamemainposter" id="renamemainposter" value="${objet.renamemainposter }">
						<div style="color:#00c73c; font-size:9pt;">권장 크기 : 1400 x 450px jpg,jpeg,png 형식의 정지 이미지만 등록됩니다.</div>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: top;padding-top: 30px;">오브제 메인칼라</th>
					<td><input type="text" name="objetcolor" id="hue-demo" class="form-control demo" data-control="hue" value="${objet.objetcolor }" style="width:150px;"></td>
				</tr>
				<tr>
					<th>오브제 기간</th>
					<td><div class="ui input"><input type="date" name="objetstartdate" id="datepicker1" value="${objet.objetstartdate }" ></div>&nbsp;&nbsp; ~ &nbsp;&nbsp;<div class="ui input"><input type="date" name="objetenddate" id="datepicker2" value="${objet.objetenddate }"></div></td>
				</tr>
				
				<tr>
					<th style="vertical-align: top;padding-top: 30px;">관련태그<br><span style="color:#aaa; font-size: 9pt; font-weight: normal;">(최대 3개 선택)</span></th>
					<td>
						<table class="objetTagTable">
							<tr>
								<td><input type="checkbox" name="objettag" value="건축" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '건축')}">checked</c:if>> 건축</td>
								<td><input type="checkbox" name="objettag" value="공예" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '공예')}">checked</c:if>> 공예</td>
								<td><input type="checkbox" name="objettag" value="디자인" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '디자인')}">checked</c:if>> 디자인</td>
								<td><input type="checkbox" name="objettag" value="사진" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '사진')}">checked</c:if>> 사진</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="objettag" value="서예" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '서예')}">checked</c:if>> 서예</td>
								<td><input type="checkbox" name="objettag" value="조각" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '조각')}">checked</c:if>> 조각</td>
								<td><input type="checkbox" name="objettag" value="회화" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '회화')}">checked</c:if>> 회화</td>
								<td><input type="checkbox" name="objettag" value="기타" onClick="count_ck(this);" <c:if test="${fn:contains(objet.objettag, '기타')}">checked</c:if>> 기타</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><hr><br>
			
			<!-- 작품등록 영역 시작 -->
				<table class="createObjetTable2">
					<tr>
						<th colspan="3" style="text-align: left;">오브제작품
							<div style="color:#00c73c; font-size:7pt;font-weight: normal;line-height: 10pt;"><br>작품은 8개를 모두 채워야 등록 가능합니다. jpg,jpeg,gif,png,bmp 형식의 이미지만 등록됩니다. <br>
							작품 크기는 최소 1024 * 512 로 올려주셔야 화질이 깨지지 않습니다. <br>
							등록 순서대로 작품 전시 순서가 결정되오니 확인 후 업로드 해주세요 :)</div>
						</th>
					</tr>
					 <tr style="height: 300px;">
			            <td style="width:5%;">
			            	1.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg1" src="resources/images/objet/${objet.objetrfile1}">
							<input type="file" name="objetofile1" id="objetofile1" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg1'));" style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle1" id="objettitle1" value="${objet.objettitle1}" style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro1" id="objetintro1" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro1}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	2.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg2" src="resources/images/objet/${objet.objetrfile2}">
							<input type="file" name="objetofile2" id="objetofile2" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg2'));"  style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle2" id="objettitle2" value="${objet.objettitle2}"  style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro2" id="objetintro2" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro2}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	3.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg3" src="resources/images/objet/${objet.objetrfile3}">
							<input type="file" name="objetofile3" id="objetofile3" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg3'));"  style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle3" id="objettitle3" value="${objet.objettitle3}"  style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro3" id="objetintro3" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro3}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	4.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg4" src="resources/images/objet/${objet.objetrfile4}">
							<input type="file" name="objetofile4" id="objetofile4" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg4'));"  style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle4" id="objettitle4" value="${objet.objettitle4}"  style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro4" id="objetintro4" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro4}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	5.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg5" src="resources/images/objet/${objet.objetrfile5}">
							<input type="file" name="objetofile5" id="objetofile5" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg5'));"  style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle5" id="objettitle5" value="${objet.objettitle5}"  style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro5" id="objetintro5" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro5}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	6.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg6" src="resources/images/objet/${objet.objetrfile6}">
							<input type="file" name="objetofile6" id="objetofile6" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg6'));"  style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle6" id="objettitle6" value="${objet.objettitle6}"  style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro6" id="objetintro6" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro6}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	7.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg7" src="resources/images/objet/${objet.objetrfile7}">
							<input type="file" name="objetofile7" id="objetofile7" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg7'));"  style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle7" id="objettitle7" value="${objet.objettitle7}"  style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro7" id="objetintro7" style="font-size: 9pt;width:500px; height:50px;" >${objet.objetintro7}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
			        
			        <tr style="height: 300px;">
			            <td style="width:5%;">
			            	8.
			            </td>
			            
			            <td style="width:20%;">
				            <img class="createobjetimg" id="createobjetimg8" src="resources/images/objet/${objet.objetrfile8}">
							<input type="file" name="objetofile8" id="objetofile8" accept=".jpg,.jpeg,.png" onChange="preview(this, $('#createobjetimg8'));" style="display:none;">
			            </td>
			            
			            <td style="width:75%;">
			            	<a class="ui teal circular label">작품명</a><br>
			            	<div class="ui input" style="margin-top:10px;"><input type="text" name="objettitle8" id="objettitle8" value="${objet.objettitle8}" style="width:300px; height:30px;"></div>
							<span style="color:#aaa; font-size:9pt;">(최대 30자)</span>
			            	<br><br>
			            	<a class="ui teal circular label">작품소개</a><br>
			            	<div class="ui form" style="margin-top:10px;"><div class="field">
			            	<textarea name="objetintro8" id="objetintro8" style="font-size: 9pt;width:500px; height:50px;">${objet.objetintro8}</textarea></div></div>
							<span style="color:#aaa; font-size:9pt;">( 최대 500자 )</span>
			            </td>
			        </tr>
				</table>
			<!-- 작품등록 영역 끝 -->
			
			<br><br>
			
			<!-- 신청버튼 -->
				<div align="center">
					<input type="submit" class="mainBtn" value="전시수정" id="btnsub">&nbsp;
					<input type="reset" class="mainBtn1" value="다시작성">
				</div>
				<br><br>
				<div style="color:#bb0004; font-size:9pt;line-height: 11pt;">
				<!-- * 공개 오브제인 경우, 관리자 검수 및 승인 후 전시등록이 가능합니다. <br>
				* 관리자 승인은 신청일로부터 최대 7일(영업일 기준) 소요되오니 이 점 유의바랍니다. -->
				</div>
		</div>
		</form>
		<!-- 등록 테이블 끝 -->
	</div>
<!-- 전시 등록 페이지 끝 -->


</body>
<br><br><br><br>
<c:import url="../footer.jsp" />
</html>