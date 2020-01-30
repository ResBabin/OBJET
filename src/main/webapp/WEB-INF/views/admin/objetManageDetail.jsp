<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8"> 
<title>오브제 #${ objet.objetno }</title>
<c:import url="adminHeader.jsp"/>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
#um {
	padding-top: 65px;
	margin-top: -79px;
	padding-bottom: 20px;
	font-family: 'Nanum Gothic';
}

#objetimg {
	height: 350px;
	width: auto;
}

body ::-webkit-scrollbar {
	-webkit-appearance: none;
	height: 18px;
}

#titlediv {
	font-family: 'Nanum Gothic';
	margin-left: 140px;
}

#div1 {
	background: #000;
	padding: 30px;
	color: #fff;
}

.ui.large.image.label {
	right: 180px;
	background: #529;
	color: white;
	position: absolute;
}

#detailintro{
padding: 20px;
 color: #444; 
 display: none;
 	font-family: 'Nanum Gothic';
}
#returndiv {
	position: absolute;
	background: #f7f7f7;
	border: 1px solid #ccc;
	width: 500px;
	height: 415px;
	left: 35%;
	top: 35%; 
	border-radius: 5px;
	padding: 30px;
	box-shadow: 1px 1px 2px #999;
	display: none;
	z-index: 2;
}
#stopdiv {
	position: absolute;
	background: #f7f7f7;
	border: 1px solid #ccc;
	width: 500px;
	height: 415px;
	left: 35%;
	top: 35%; 
	border-radius: 5px;
	padding: 30px;
	box-shadow: 1px 1px 2px #999;
	display: none;
	z-index: 2;
}
</style>

<script type="text/javascript">
$(function() {
	$('.info').popup({
	//    on: 'click',
	  });
	
	$("#objetintro").click(function() {
		$("#detailintro").slideToggle(500);
	});
	
	$("#approve").click(function() {
		$("input[name=publicyn]").val("Y");
		var ddd = confirm("해당 작품 전시를 승인하시겠습니까?");
		if(ddd){
		$("#req").submit();
		}
	});

	$("#return").click(function() {
		$("#returndiv").fadeIn();
	});

	$("#returnclose").click(function() {
		$("#returndiv").hide();
	});
	
	$("#stop").click(function() {
		$("#stopdiv").fadeIn();
	});
	
	$("#stopclose").click(function() {
		$("#stopdiv").hide();
	});
	
	var adminid = $("input[name=adminid]").val();
	var objetno = $("input[name=objetno]").val();
	var userid = $("input[name=userid]").val();
	$("#returnok").click(function() {
		var con = confirm("해당 전시를 반려하시겠습니까?");
		if (con) {
			var returnreason = $("input[name=returnreason]:checked").val();
			if(returnreason == 'etc'){
				returnreason = $("#returnetcreason").val();
			}
			var data = { objetno : objetno, returnreason : returnreason, adminid : adminid, publicyn : "N", userid : userid};
			$.ajax({
				url : "updateReqStatus.do",
				data : data,
				type : "post",
				success : function(result) {
					console.log(result);
					  location.href = "objetm.do?page=1&order=nod";
				},
				traditional : true,
				error : function(request, status, errorData) {
					console.log("error code : "
							+ request.status + "\nMessage : "
							+ request.responseText
							+ "\nError : " + errorData);
				}

			});
		}
	});
	
	$("#stopok").click(function() {
		var con = confirm("해당 전시를 강제 종료하시겠습니까?");
		if (con) {
			var stopreason = $("input[name=stopreason]:checked").val();
			if(stopreason == 'etc'){
				stopreason = $("#stopetcreason").val();
			}
			var data = { objetno : objetno, stopreason : stopreason, adminid : adminid, userid : userid};
			$.ajax({
				url : "updateObjetStop.do",
				data : data,
				type : "post",
				success : function(result) {
					console.log(result);
					  location.href = "objetm.do?page=1&order=nod";
				},
				traditional : true,
				error : function(request, status, errorData) {
					console.log("error code : "
							+ request.status + "\nMessage : "
							+ request.responseText
							+ "\nError : " + errorData);
				}

			});
		}
	});
	
	
	
	
	
	
});

function UserInfoPopup() {
	var width = '400';
	var height = '420';
	var left = Math.ceil((window.screen.width - width) / 1.3);
	var top = Math.ceil((window.screen.width - height) / 2);
	window.open('userInfo.do?userid=${ objet.userid }' , '회원 정보', 'width=' + width + ', height=' + height + ', left=' + left + ', top' + top);
} 

</script>
</head>
<body>
<div id="um" >

<div id="returndiv">
		<label id="qlabel">강제 탈퇴 사유를 선택해 주세요.</label>
		<br><br><hr><br>
		<input type="radio" value="욕설 및 비방" name="returnreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 욕설 및 비방<br><br>
		<input type="radio" value="부적절한 컨텐츠" name="returneason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 부적절한 컨텐츠<br><br>
		<input type="radio" value="광고 및 스팸" name="returnreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 광고 및 스팸<br><br>
		<input type="radio" value="etc" name="returnreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 기타<br>
		<textarea id="returnetcreason" rows="4" cols="53" placeholder="기타 사유를 작성해주세요." style="margin-top: 15px; margin-left: 30px; padding: 10px; margin-bottom: 13px; resize: none;"></textarea>
		<br>
		<div align="center">
		<button class="ui grey button" id="returnok">등록</button> &nbsp;&nbsp;&nbsp;
		<button class="ui button" id="returnclose">취소</button>
		</div>
		
	</div>
<div id="stopdiv">
		<label id="qlabel">강제 중지 사유를 선택해 주세요.</label>
		<br><br><hr><br>
		<input type="radio" value="욕설 및 비방" name="stopreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 욕설 및 비방<br><br>
		<input type="radio" value="부적절한 컨텐츠" name="stopreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 부적절한 컨텐츠<br><br>
		<input type="radio" value="광고 및 스팸" name="stopreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 광고 및 스팸<br><br>
		<input type="radio" value="etc" name="stopreason">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 기타<br>
		<textarea id="stopetcreason" rows="4" cols="53" placeholder="기타 사유를 작성해주세요." style="margin-top: 15px; margin-left: 30px; padding: 10px; margin-bottom: 13px; resize: none;"></textarea>
		<br>
		<div align="center">
		<button class="ui grey button" id="stopok">등록</button> &nbsp;&nbsp;&nbsp;
		<button class="ui button" id="stopclose">취소</button>
		</div>
		
	</div>
<div id="div1">
<h2 align="left" id="titlediv"><i class="ui hashtag icon"></i>${ objet.objetno } - ${ objet.objettitle } 
&nbsp;&nbsp;&nbsp;&nbsp;
<button class="ui inverted basic button" id="objetintro">전시소개</button>
<a href="objetOne.do?objetno=${ objet.objetno }&userid=${ objet.userid }" target="_blank"><button class="ui inverted basic button">전시홈</button></a>
<a class="ui large image label" style="padding: 12px; padding-right: 17px;" onclick="UserInfoPopup()"> 
&nbsp;&nbsp;<i class="ui user icon"></i>${ objet.userid }
  <div class="detail">${ objet.nickname }</div> 
</a></h2>
</div>
<div style="padding-right: 170px; padding-left: 170px;"><br>
<div id="detailintro" style="box-shadow: 5px 5px 0px #eee; border: 1px solid #999; border-radius: 5px;">
<h4>등록 : ${ objet.objetregidate } <br><br>상태 : <c:if test="${ objet.objetstatus eq 'STANDBY'}">예정</c:if>
<c:if test="${ objet.objetstatus eq 'WAIT'}">요청</c:if>
<c:if test="${ objet.objetstatus eq 'OPEN'}">전시</c:if><c:if test="${ objet.objetstatus eq 'CLOSE'}">종료</c:if> <br></h4>
<h4>소개</h4><font style="font-size: 12pt; letter-spacing: 1px; line-height: 25pt;">${ objet.objetintro }</font>
</div>
<h3 align="center" style="margin-left: 120px;"><font style="font-style: italic; text-decoration: underline;">${ objet.objetstartdate } &nbsp;&nbsp;~&nbsp;&nbsp; ${ objet.objetenddate }</font>&nbsp;&nbsp; &nbsp;&nbsp; 
<c:forTokens items="${ objet.objettag }" delims="," var="tag">
<label class="ui large left pointing basic violet label"> <i class="ui hashtag icon"></i>${ tag } </label> 
</c:forTokens>
</h3><br>
<c:set var="imgurl" value="${ pageContext.request.contextPath }/resources/images/objet/" />
<div style="display: flex; overflow: auto; height: 368px;" id="objetimages">
	<c:if test="${!empty objet.renamemainposter }">
  <div class="ui fluid image info" data-title="메인 포스터"><a class="ui left big inverted black corner label"><i class="info icon"></i></a></div>
  <img src="${ imgurl }${objet.renamemainposter }" id="objetimg" draggable="false">
	</c:if>
	<c:if test="${!empty objet.objetrfile1 }">
  <div class="ui fluid image info" data-title="${ objet.objettitle1}" data-content="${ objet.objetintro1 }"><a class="ui left big black corner label"><i class="info icon"></i></a></div>
  <img src="${ imgurl }${objet.objetrfile1 }" id="objetimg" draggable="false">
  </c:if>
  <c:if test="${!empty objet.objetrfile2 }">
  <div class="ui fluid image info" data-title="${ objet.objettitle2}" data-content="${ objet.objetintro2 }"><a class="ui left big black corner label"><i class="info  icon" ></i></a></div>
<img src="${ imgurl }${ objet.objetrfile2 }" id="objetimg" draggable="false">
</c:if>
<c:if test="${!empty objet.objetrfile3 }">
<div class="ui fluid image info" data-title="${ objet.objettitle3}" data-content="${ objet.objetintro3 }"><a class="ui left big black corner label"><i class="info  icon"></i></a></div>
<img src="${ imgurl }${ objet.objetrfile3 }" id="objetimg" draggable="false">
</c:if>
<c:if test="${!empty objet.objetrfile4 }">
<div class="ui fluid image info" data-title="${ objet.objettitle4}" data-content="${ objet.objetintro4 }"><a class="ui left big black corner label"><i class="info  icon"></i></a></div>
<img src="${ imgurl }${ objet.objetrfile4 }" id="objetimg" draggable="false">
</c:if>
<c:if test="${!empty objet.objetrfile5 }">
<div class="ui fluid image info" data-title="${ objet.objettitle5}" data-content="${ objet.objetintro5 }"><a class="ui left big black corner label"><i class="info  icon"></i></a></div>
<img src="${ imgurl }${ objet.objetrfile5 }" id="objetimg" draggable="false">
</c:if>
<c:if test="${!empty objet.objetrfile6 }">
<div class="ui fluid image info" data-title="${ objet.objettitle6}" data-content="${ objet.objetintro6 }"><a class="ui left big black corner label"><i class="info  icon"></i></a></div>
<img src="${ imgurl }${ objet.objetrfile6 }" id="objetimg" draggable="false">
</c:if>
<c:if test="${!empty objet.objetrfile7 }">
<div class="ui fluid image info" data-title="${ objet.objettitle7}" data-content=" ${ objet.objetintro7 }"><a class="ui left big black corner label"><i class="info  icon"></i></a></div>
<img src="${ imgurl }${ objet.objetrfile7 }" id="objetimg" draggable="false">
</c:if>
<c:if test="${!empty objet.objetrfile8 }">
<div class="ui fluid image info" data-title="${ objet.objettitle8}"  data-content="${ objet.objetintro8 }"><a class="ui left big black corner label"><i class="info  icon"></i></a></div>
<img src="${ imgurl }${ objet.objetrfile8 }" id="objetimg" draggable="false">
</c:if>
</div>
<br>
<div style="display: flex;">
<div align="left" style="width: 200px;">
<a href="objetm.do"><button class="ui basic black button"><i class="ui list icon"></i>목록</button></a>
</div>
<div  align="right" style="width: 100%;">
<c:if test="${ objet.publicyn eq 'W' }">
<button type="button" class="ui violet button" id="approve" onclick="return false">승 &nbsp; &nbsp;  인</button>&nbsp;&nbsp;&nbsp;
<button type="button" class="ui secondary button" id="return">반 &nbsp; &nbsp;  려</button>
</c:if>
<c:if test="${ objet.publicyn eq 'Y' and objet.objetstatus ne 'CLOSE'}">
<button type="button" class="ui black button" id="stop" onclick="" style="">강제 중지</button>
</c:if>
</div>
<form action="updateReqStatus.do" method="post" id="req">
<input type="hidden" name="objetno" value="${ objet.objetno }">
<input type="hidden" name="userid" value="${ objet.userid }">
<input type="hidden" name="adminid" value="${ sessionScope.loginUser.userid }">
<input type="hidden" name="startdate" value="${ objet.objetstartdate }"> 
<input type="hidden" name="publicyn" value=""> 
</form>
<form action="updateObjetStop.do" method="post" id="objetstop">
<input type="hidden" name="objetno" value="${ objet.objetno }">
</form>
</div>
</div> 
</div>
<br>
<c:import url="../footer.jsp"/>
</body>
</html>