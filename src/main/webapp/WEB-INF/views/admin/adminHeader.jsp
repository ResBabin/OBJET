<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 시맨틱유아이 cdn -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<style type="text/css">
#cont {
	background: #292929;
	padding: 0px;
}
/* #um {
	padding: 150px;
} */

#topmenu {
	border-radius: 0px;
	height: 60px;
	font-size: 12pt;
}

#item{
	width: 120px;
}
#headdi1, #headdi2, #headdi3, #headdi4 {
	width: 150px;
	text-align: center;
}
#sub{
 	width: 150px;
	background: #606163; 
	font-size: 11pt;
}
#heada1, #heada2, #heada3, #heada4, #heada5, #heada6, #heada7, #heada8, #heada9 {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {

		$('.ui.accordion').accordion();

		$('#homecon').show();
		$("#menucon").click(function() {
			$('.ui.sidebar').sidebar('toggle');
		});
		$('#headdi1, #headdi2, #headdi3, #headdi4').dropdown({});
		$('#heada1, #heada2, #heada3, #heada4, #heada5, #heada6, #heada7, #heada8, #heada9').attr('style', 'color: white !important');
	});
</script>
</head>
<body>
	<div class="ui inverted menu" id="topmenu" align="center">
		<div class="item" align="center" id="item"> 
			<img src="${ pageContext.request.contextPath }/resources/images/objet_logo_white.png" style="width: 75px; margin-top: 6px; ">
		</div>
		<div class="ui inverted dropdown item" id="headdi1" align="center" style="padding-left: 35px;">
			회원 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="item" href="userm.do" id="heada1">회원 조회</a> <a class="item" href="userbk.do" id="heada2">블랙리스트 조회</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi2" align="center" style="padding-left: 35px;">
			전시 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="ui grey item" href="objetm.do" id="heada3">전시 조회</a> <a class="item" href="objereq.do" id="heada4">신청작 조회</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi3" align="center" style="padding-left: 35px;">
			신고 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="item" href="reportu.do" id="heada5">회원 신고</a> <a class="item" href="reportb.do" id="heada6">게시글 신고</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi4" align="center" style="padding-left: 35px;">
			고객 센터 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="item" href="noticem.do" id="heada7">공지사항 관리</a> 
				<a class="item" href="faqm.do" id="heada8">FAQ 관리</a> 
				<a class="item" href="qnam.do" id="heada9">1:1문의 관리</a> 
			</div>
		</div>
		<div class="right menu">
			<div class="item">
				<div class="ui red button icons" style="font-size: 10pt;"><i class="home icon"></i>사용자</div>
			</div>
		</div>
	</div>

	<div class="ui inverted sidebar left vertical menu"
		style="width: 160px;">
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="user circle icon"></i> 회원 관리
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="userm.do"> 회원 조회 </a> <a class="item"
					href="userbk.do"> 블랙리스트 조회</a>
			</div>
		</div>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="picture icon"></i> 전시 관리
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="objetm.do"> 전시 조회 </a> <a class="item"
					href="objereq.do"> 신청작 조회</a>
			</div>
		</div>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="dont icon"></i> 신고 관리
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="reportu.do"> 회원 신고</a> <a class="item"
					href="reportb.do"> 게시글 신고</a>
			</div>
		</div>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="bullhorn icon"></i> 고객센터
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="noticem.do"> 공지사항 관리 </a> <a class="item"
					href="faqm.do"> FAQ 관리 </a> <a class="item" href="qnam.do">
					1:1문의 관리 </a>
			</div>
		</div>
	</div>
	<div class="ui fixed" style="top: 80px; left: 2px; position: fixed;">
		<button id="menucon" class="ui large red tag label button"
			style="padding-left: 20px; padding-right: 15px;">
			<i class="list icon"></i>Menu
		</button>
	</div>
</body>
</html>