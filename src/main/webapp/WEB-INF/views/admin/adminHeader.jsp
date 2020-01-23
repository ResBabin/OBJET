<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>adminMenu</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
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
	height: 65px;
	font-size: 12pt;
	font-family: 'Nanum Gothic';
	font-weight: bold;
	background: black;
} 
#item{
	width: 120px;
}
#headdi1, #headdi2, #headdi3, #headdi4 {
	width: 150px;
	text-align: center;
	background: black;
}
#sub{
 	width: 150px;
 	padding-top: 5px;
 	padding-bottom: 10px;
 	background: black;
	font-size: 11pt;
}
#heada1, #heada2, #heada3, #heada4, #heada5, #heada6, #heada7, #heada8, #heada9, #heada10 {
	text-align: center;
}
#logout:hover, #login:hover{
	color: red;
}

</style>
<script type="text/javascript">
	$(function() {

		$('.ui.accordion').accordion();

		$('#homecon').show();
		$("#menucon").click(function() {
			$('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('setting', 'dimPage', false)
			  .sidebar('toggle');
		});
		$('#headdi1, #headdi2, #headdi3, #headdi4').dropdown({});
		$('#heada1, #heada2, #heada3, #heada4, #heada5, #heada6, #heada7, #heada8, #heada9, #heada10').attr('style', 'color: white !important');
	});
</script>
</head>	
<body>
	<div class="ui inverted menu" id="topmenu" align="center">
		<div class="item" align="center" id="item"> 
			<a href="adminmain.do">
			<img src="${ pageContext.request.contextPath }/resources/images/objet_logo_white.png" style="width: 75px; margin-top: 12px;">
			</a>
		</div>
		<div class="ui inverted dropdown item" id="headdi1" align="center" style="padding-left: 35px;">
			회원 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="item" href="userm.do?usertype=&order=idd&page=1" id="heada1">회원 조회</a> 
				<a class="item" href="userbk.do" id="heada2">블랙리스트 조회</a> 
				<a class="item" href="userstatistics.do" id="heada1">회원 통계</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi2" align="center" style="padding-left: 35px;">
			전시 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="ui grey item" href="objetm.do" id="heada3">전시 조회</a> <a class="item" href="objetreq.do" id="heada4">신청작 조회</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi2" align="center" style="padding-left: 35px;">
			후원 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="ui grey item" href="supportEnrollListm.do?currentPage=1" id="heada5">등록 현황</a>
				<a class="ui grey item" href="supportListm.do?currentPage=1" id="heada6">후원 현황</a>
				<a class="item" href="supportRequest.do?currentPage=1" id="heada7">정산 현황</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi3" align="center" style="padding-left: 35px;">
			신고 관리 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<!-- <a class="item" href="reportu.do" id="heada5">회원 신고</a>  --><a class="item" href="reportbm.do" id="heada6">게시글 신고</a> 
			</div>
		</div>
		<div class="ui dropdown item" id="headdi4" align="center" style="padding-left: 35px;">
			고객 센터 <i class="dropdown icon"></i>
			<div class="menu" id="sub">
				<a class="item" href="noticem.do" id="heada8">공지사항 관리</a> 
				<a class="item" href="faqm.do" id="heada9">FAQ 관리</a> 
				<a class="item" href="qnam.do" id="heada10">1:1문의 관리</a> 
			</div>
		</div>
		<div class="right menu">
			<div class="item">
				<c:if test="${ sessionScope.loginUser.usertype eq 'ADMIN' }">
				안녕하세요 	&nbsp;&nbsp;
				관리자
				</c:if>
				<c:if test="${ sessionScope.loginUser.usertype eq 'SADMIN' }">
				안녕하세요 	&nbsp;&nbsp;
				부관리자
				</c:if>
				<c:if test="${ !empty sessionScope.loginUser}">
				 ${ sessionScope.loginUser.username }님&nbsp;&nbsp;&nbsp;&nbsp;
				 <a href="logout.do" id="logout"> 로그아웃 </a>
				 </c:if>
				<c:if test="${ empty sessionScope.loginUser}">
				 <a href="moveLogin.do" id="login"> 로그인 </a>
				</c:if>
		
			</div>
			<!-- <div class="item">알림
			<i class="icon bell"></i>
			<div class="ui circular red label" style="margin-left: -5px;">10</div>
			</div> -->
			<div class="item">
				<a href="main.do" target="_blank"><button class="ui inverted basic button icons" style="font-size: 10pt;"><i class="home icon"></i>사용자</button></a>
			</div>
		</div>
	</div>

	<div class="ui inverted sidebar left vertical menu"
		style="background: black; letter-spacing: 2pt;">
				<br>
		<div  class="item" align="center" style="font-size: 12pt; height: 150px;">
		<a href="adminmain.do">
	<div style="background: #fff; border-radius: 75px; width: 150px; height: 150px;"><br>
			<img src="${ pageContext.request.contextPath }/resources/images/objet_logo_black.png" style="width: 100px; margin-top: 20px;">
	<br><br><br></div></a>
		</div><br><br><br>
	<%-- <font style="font-weight: bold;" color="white"><c:if test="${ sessionScope.loginUser.usertype eq 'ADMIN' }">
		관리자
		</c:if>
		<c:if test="${ sessionScope.loginUser.usertype eq 'SADMIN' }">
		부관리자
		</c:if>
				${ sessionScope.loginUser.username }</font> --%>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="user circle icon"></i> 회원 관리
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="userm.do?usertype=&order=idd&page=1"> 회원 조회 </a> <a class="item"
					href="userbk.do"> 블랙리스트 조회</a>
			</div>
		</div>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="picture icon"></i> 전시 관리
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="objetm.do"> 전시 조회 </a> <a class="item" href="objetreq.do"> 신청작 조회</a>
			</div> 
		</div>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="picture icon"></i> 후원 관리
				</a>
			</div>
			<div class="content" id="cont">
				<a class="item" href="supportEnrollListm.do?currentPage=1"> 등록 현황</a>
				<a class="item" href="supportListm.do?currentPage=1"> 후원 현황 </a>
				<a class="item" href="supportRequest.do?currentPage=1"> 정산 현황</a>
			</div> 
		</div>
		<div class="ui accordion">
			<div class="title">
				<a class="item"> <i class="dont icon"></i> 신고 관리
				</a>
			</div>
			<div class="content" id="cont">
				<!-- <a class="item" href="reportu.do"> 회원 신고</a>  --><a class="item" href="reportbm.do"> 게시글 신고</a>
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
		<button id="menucon" class="ui big red tag label button"
			style="padding-left: 20px; padding-right: 15px;">
			<i class="list icon"></i>Menu
		</button>
	</div>
</body>
</html>