<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<meta charset="UTF-8">
<title>Objet</title>
<c:import url="../header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style type="text/css">
.objet_allList {
	margin-top:0px;
} 
.objet_title{
	font-family: 'Nanum Myeongjo';
	nth-of-type(1) font-weight: 400; 
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    /* margin-right:-20px; */
    padding:0;
}
.objet_title a{
	font-family: 'Nanum Myeongjo';
	font-weight: bold;
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    text-decoration:none;
    padding:0;
    color:rgba(0,0,0.87);
}
.objet_title a:hover{
	font-family: 'Nanum Myeongjo';
	font-weight: bold;
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    text-decoration:none;
    padding:0;
    color:#959595;
}
.objet_more_section {
	margin:40px 120px 10px 120px;
	height:auto;
}
.search-option-cate {
	align:right;
	margin:5px 0px 25px 0;
	float:right;
}
#dateoption {
	width:120px;
	font-size: 14px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
  	color:black;
  	border-radius:5px;
}
#dateoption .text {
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
  	color:black;
}
.search-option .option{
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #959595;
}
.search-option .on{
	font-size: 14px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
	color: #666666;
}
.search-option .option::before{
 	font-size:40px!important;
    content:'·';
    color:lightgray;
    left:-10px;
    vertical-align:middle;
    top:3px;
}
.search-option .on::before {
	font-size:40px!important;
    content:'·';
    color: #2185d0;
    left:-10px;
    top:3px;
}
.objet_all_list {
	clear:both;
	width:100%;
	height: 100%;
	border-bottom: 1px solid #151515;
	border-top: 2px solid #151515;
	
}
.objet_list {
	width:100%;
	height:320px;
	overflow: hidden;
	display: none;
}
.objet_list ul {
	 position: relative; 
	 list-style: none;
	 display: block; 
	 margin:0;
	padding: 0;
}

.objet_list .objet_li {
	list-style: none;
	border-top: 1px solid #e9e9e9;
	margin:0;
	padding: 0;
}
.objet_list .info {
	float: left;
    padding: 55px 0px 0 40px;
}
.objet_list .info a {
	color: #222;
    font-size: 16px;
    line-height: 24px;
    font-family: 'Nanum Gothic';
}
.objet_list .info em {
	font-style: normal;
	display: block;
    word-wrap: break-word;
}
.objet_list .info .tit01 {
	font-size: 32px;
    line-height: 42px;
    font-weight: bolder;
}
.objet_list .info .tit02 {
	margin-top: 12px;
	font-weight: bolder;
	margin-top: 20px;
}
.objet_list .info .date {
	display: block;
    margin-top: 20px;
    color: #909090;
    font-size: 14px;
}
.objet_list img {	
	width: 70%;
	height:320px;
	float:right;
    vertical-align: top;
}

</style>
<script type="text/javascript">
$(function() {
  	//dropdown
   $('#dateoption').dropdown(); 
  
  	$(".search-option .option").on("click", function(){
  		$(".search-option .option").removeClass("on");
  		$(this).addClass("on");
  		$(".search-option .i .off").removeClass("off");
  		$(".search-option .i").addClass("off");
  	});

	//더보기 버튼
	$(".objet_list").slice(0, 4).show(); // 최초 4개 선택
	$("#more_load").click(function(e) { // Load More를 위한 클릭 이벤트e
	    e.preventDefault();
	    $(".objet_list:hidden").slice(0, 4).show(); // 숨김 설정된 다음 4개를 선택하여 표시
	    if ($(".objet_list:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
	        $('#more_load').css('display', 'none');// 더 이상 로드할 항목이 없는 경우
	    }
	});


});

</script>
</head>
<body>
<c:import url="../headerSearch.jsp" />
<section class="objet_allList">
<h3 class="objet_title"><a href="objetAllList.do">OBJET ALL EXHIBITION</a></h3>
<section class="objet_more_section">
<div class="search-option-cate">
<!-- <span class="search-option">
    <a href="#" class="option on" data-type="accu">&nbsp;정확도</a>&nbsp;&nbsp;
    <a href="#" class="option" data-type="recency">&nbsp;최신순</a>&nbsp;&nbsp;
</span>&nbsp;&nbsp;-->
<!-- <div class="ui compact selection dropdown" name="dateoption" id="dateoption">
  <div class="text">전체 기간</div>
  <i class="dropdown icon"></i>
  <div class="menu">
    <div class="item" data-value="2019">2019</div>
    <div class="item" data-value="2018" >2018</div>
	<div class="item" data-value="2017" >2017</div>
	<div class="item" data-value="2016" >2016</div>
  </div>
</div>  -->
</div>
<div class="objet_all_list">
<c:forEach var="Objet" items="${objetList }">
 <c:set var="length" value="${fn:length(Objet.objettitle)}"/>
<div class="objet_list">
<ul class="objet_ul">
<li class="objet_li">
	<div class="info">
		<c:if test="${empty loginUser && loginUser.userid == null}">
			<a href="objetOne.do?objetno=${Objet.objetno }">
		</c:if>
		<c:if test="${!empty loginUser && loginUser.userid != null}">
			<a href="objetOne.do?objetno=${Objet.objetno }&userid=${loginUser.userid}">
		</c:if>
		  <c:choose>
           <c:when test="${fn:length(Objet.objettitle) > 12}">
            <em class="tit01"><c:out value="${fn:substring(Objet.objettitle,0,11)}"/><br>
            <c:out value="${fn:substring(Objet.objettitle,11,23)}"/><br>
            <c:out value="${fn:substring(Objet.objettitle,23,length)}"/></em>
           </c:when>
           <c:otherwise>
            <em class="tit01"><c:out value="${Objet.objettitle}"/></em>
           </c:otherwise> 
			</c:choose>
			<em class="tit02"><c:out value="${fn:substring(Objet.objettitle,0,11)}"/><br>
			<c:out value="${fn:substring(Objet.objettitle,11,23)}"/></em> 
			<span class="date"><fmt:formatDate value="${Objet.objetstartdate }" />&nbsp;-&nbsp;<fmt:formatDate value="${Objet.objetenddate }" /></span>
		</a>
	</div>
	<span class="thumbnail">
		<c:if test="${empty loginUser && loginUser.userid == null}">
			<a href="objetOne.do?objetno=${Objet.objetno }">
		</c:if>
		<c:if test="${!empty loginUser && loginUser.userid != null}">
			<a href="objetOne.do?objetno=${Objet.objetno }&userid=${loginUser.userid}">
		</c:if>
			<img src="resources/images/objet/${Objet.renamemainposter }" alt="${Objet.objettitle }">
		</a>
	</span>
</li>
</ul>
</div>
</c:forEach>
</div>
<br><br>
<center>
<div class="ui basic large gray animated button" id="more_load" style="vertical-align:middle;" align="center">
 <div class="visible content">더보기</div>
 <div class="hidden content">
   <i class="ui chevron down icon" style="font-size:16px;vertical-align:middle;text-align:center"></i>
  </div>
</div>
</center>
</section>
<br><br>
</section>
<c:import url="../footer.jsp" />
</body>
</html>






