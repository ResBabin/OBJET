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
<script type="text/javascript" src="/objet/resources/js/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>
html, body { height: 100%; margin: 0; padding: 0; } 
.all {
min-height:100%;
}
#search-box-top{
  position: fixed;
  top: 1.6em;
  right: 2em;
  transition: top 0.2s ease-in-out;
}

#searchList-text[type="text"] {
	font-size: 16px;
	font-weight: normal;
	font-family:'Nanum Gothic';
  	color:black;
  	line-height: normal;
}

#searchList-text::placeholder {
	font-size: 16px;
	font-weight: normal;
	font-family:'Nanum Gothic';
}
#searchList-btn{
  position: fixed;
  top: 1.09em;
  right: 1.3em;
  opacity: 0.8;
  font-size:30px;
  color:black;
}
#searchList-btn:hover{
  cursor: pointer;
}

#searchList-text {
	opacity: 0.8;
	margin-top:4px;
}

#search-box-main {
	margin:5px 200px 25px 200px;
	align:left;
}

#search-form-main {
	border-width: 0;
	align:left;
	width: 1000px;
}

#search-text-main[type="text"] {
	font-size: 32px;
	font-weight: normal;
	font-family:'Nanum Gothic';
  	color:black;
  	background: transparent;
  	height: auto;
  	line-height: normal;
    border: 0;
    outline: 0;
    font-align:left;
    margin:0;
    padding:0;
    width: 900px;
}

#search-text-main::placeholder {
	font-size: 30px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	text-align: left;
}

#search-menu{
	margin-top:10px;
	margin-bottom:0;
	width: 100%;
	align: left;
	text-align: left;
	border-width:1.2px;
}
#search-menu #item{
	font-size: 16px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
	color:#959595;
}

.search-cont {
	vertical-align:middle;
	width:100%;
	height:100%;
	margin-left:200px;
	margin-right:200px;
}
.object-result {
	width:55%;
}
.object-keyword {
	width:17%;
	top:28%;
	left:75%;
	position: absolute;
}
.wrap-keywords {
    /* box-shadow: 0 1px 0 0 #eee; */
    margin: 5px;
    padding: 5px;
}
.object-keyword strong {
	font-size: 14px;
	font-weight: bold;
	font-family:'Nanum Gothic';
	color: #777777;
}
.tab-keywords #a{
	width:60px;
	height:auto;
	padding:10px;
	margin:5px;
	font-size: 14px;
	font-family:'Nanum Gothic';
	color: gray;
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
.result-title {
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #959595;
	vertical-align:middle;
	text-align:center;
    line-height:38px;
}
.title-cnt {
	font-size: 14px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #959595;
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
.objet-result-list {
	margin-top: 5px;
    padding: 0;
}

.objet-result-list-detail {
	display: none;
}
.objet-result-list-detail:after {
	content: "";
	display: block;
	border-bottom: 1px solid #eee;
	margin-top: 30px;
	margin-bottom: 30px;
}

.objet-result-list ul, li{
	list-style: none;
	margin: 0;
    padding: 0;
}
.objet-content {
	font-size: 14px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
	color: #666666;
}
.objet-title {
	font-size: 20px;
	font-weight: bold;
	font-family:'Nanum Gothic';
	color: #333333;
	vertical-align: -2px;
}
.objet-title b{
	font-size: 20px;
	font-weight: bold;
	font-family:'Nanum Gothic';
	color: #2185d0;
}
#objet-status{
	font-size:12px;
	width:55px;
	height:auto;
	padding: 5px;
	margin-top:-1px;
	text-align:center;
	font-family: 'Nanum Gothic';
}
.objet-date {
	font-size: 10pt;
	font-weight: normal;
	font-family: 'Nanum Gothic';
	color: #AAAAAA;
	margin-top:7px;
	margin-bottom:7px;
}
#objet-img {
	width: 100%;
	height:250px;
	margin-bottom:6px;
	margin-top:12px;
}
.objet-info {
	font-size: 10.5pt;
	font-weight: lighter;
	font-family:'Nanum Gothic';
	color: #AAAAAA;
	line-height: 21px;
	padding-top:15px;
	margin-top:20px;
	margin-bottom:5px;
}
.objet-info b{
	font-size: 10.5pt;
	font-weight: bolder;
	font-family:'Nanum Gothic';
	color: #2185d0;
}
#objet-tag{
	font-size: 9.5pt;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #AAAAAA;
	margin-top:10px;
	width:74px;
	height: 33px;
}
.reply {
	font-size: 9pt;
	font-weight: lighter;
	font-family:'Nanum Gothic';
	color: #AAAAAA;
	margin-top:6px;
}

.artist-result {
	width:70%;
	height: 100%;
}

.artist-result-list {
	padding: 0;
	height: 100%;
}

.artist-result-list-detail{
	font-family:'Nanum Gothic';
	float: left;
    position: relative;
    width: 495px;
    height: 190px;
    margin:20px 30px 20px 0px;
    padding: 25px 20px;
    background-color: #fff;
    box-sizing: border-box;
    box-shadow: 0 1px 0 0 #eee;
    border: 1px solid #eee;
    display: none;
}
.artist-thumb {
	overflow: hidden;
    position: absolute;
    top: 25px;
    right: 30px;
}
.artist-thumb img {
	width: 90px;
    height: 90px;
}
.artist-sub {
	font-size: 20px;
    line-height: 23px;
    display: block;
    padding-top: 1px;
    font-weight: normal;
    text-overflow: ellipsis;
    overflow: hidden;
    max-width: 320px;
    white-space: nowrap;
    color:#333;
    font-family:'Nanum Gothic';
}
.artist-sub b {
	font-size: 20px;
    font-weight: bold;
   color: #2185d0;
    font-family:'Nanum Gothic';
}
.artist-info {
	font-family:'Nanum Gothic';
	display: block;
    overflow: hidden;
    padding: 12px 0 0;
    color: #AAAAAA;
    text-overflow: ellipsis;
    max-height: 42px;
    font-size: 10pt;
    line-height: 1.5;
    font-weight: lighter;
}
.artist-info b{
	color: #2185d0;
	font-family:'Nanum Gothic';
	font-size: 10pt;
	font-weight: bold;
}
.follow-info {
	padding: 10px 0 0;
	color: #AAAAAA;
	font-size: 9pt;
	font-family:'Nanum Gothic';
	line-height: 1.5;
    font-weight: normal;
}
.follow-info span{
	padding: 10px 0 0;
    font-size: 9.5pt;
    color: #AAAAAA;
    font-family:'Nanum Gothic';
    line-height: 1.5;
    font-weight: normal;
}
.artist-keywords {
	font-size: 14px;
    line-height: 1.5;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #959595;
	margin:0px;
	padding: 30px 0 0;
}
.artist-status {
	background-color:#e74c3c;
	font-size:12px;
	width:55px;
	height:auto;
	padding: 10px;
	margin:0;
	text-align:center;
}
.empty_result {
    color: #666;
    font-size: 18px;
    font-family: "Nanum Gothic", sans-serif;
    margin-top: 110px;
    width: 410px;
} 
.empty_result .txt_keyword {
    color: #2185d0;
    font-weight: bolder;
}
.empty_result .empty_desc {
    color: #AAAAAA;
    font-size: 13px;
    margin-top: 10px;
    list-style: none;
}
</style>
<script type="text/javascript">
$(function() {
	$("body").on('mousewheel',function(e){ 
        var wheel = e.originalEvent.wheelDelta; 
        if(wheel>0){ 
          //스크롤 올릴때 
          $("#search-box-top").fadeIn();
        } else { 
          //스크롤  내릴때 
           $("#search-box-top").fadeOut();
        } 
      });
	
  //tab menu
  $("#search-menu #item").on("click", function(){
	  $(".objet-result-list-detail").slice(0, 4).transition('fly up', '1100ms');
	  $(".artist-result-list-detail").slice(0, 4).transition('fly up', '1100ms');
	  var tab = $(this).attr("data-tab");
	  $("#search-menu #item").removeClass("active");
	  $(".tab").removeClass("active");
	  $(this).addClass("active");
	  $("#" + tab).addClass("active");
  });
  	//dropdown
   $('#dateoption').dropdown(); 
  
  	$(".search-option .option").on("click", function(){
  		$(".search-option .option").removeClass("on");
  		$(this).addClass("on");
  		$(".search-option .i .off").removeClass("off");
  		$(".search-option .i").addClass("off");
  	});
  	
  	//폼 엔터키 전송
  	 $('#searchList-form').keydown(function(e) {
  	    if (e.keyCode == 13) {
  	    	search();
  	    }
  	 });
  	$('#search-form-main').keydown(function(e) {
  	    if (e.keyCode == 13) {
  	    	search2();
  	    }
  	 });
  	
	//오브제 더보기 버튼
	$(".objet-result-list-detail").slice(0, 4).fadeIn(); // 최초 4개 선택
	if($(".objet-result-list-detail:hidden").length != 0){
		$("#more_load").show();
		$("#more_load").click(function(e) { // Load More를 위한 클릭 이벤트e
		    e.preventDefault();
		    $(".objet-result-list-detail:hidden").slice(0, 4).transition('fade up', '1300ms'); // 숨김 설정된 다음 4개를 선택하여 표시
		    if ($(".objet-result-list-detail:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
		        $('#more_load').fadeOut();// 더 이상 로드할 항목이 없는 경우
		    }
		});
	}if($(".objet-result-list-detail").length <= 2){
		$("#more_load").hide();
	}
	
	//아티스트 더보기 버튼
	$(".artist-result-list-detail").slice(0, 4).fadeIn();
	if($(".artist-result-list-detail:hidden").length != 0){
		$("#more_load2").show();
		$("#more_load2").click(function(e) { 
		    e.preventDefault();
		    $(".artist-result-list-detail:hidden").slice(0, 4).transition('fade up', '1300ms');
		    $("#more_load2").css("margin-bottom", "10px");
		    if ($(".artist-result-list-detail:hidden").length == 0) { 
		        $('#more_load2').fadeOut();
		        $(".artist-result").css("margin-bottom", "500px");
		    }
		});
	}if($(".artist-result-list-detail").length <= 4){
		$("#more_load2").hide();
	}
	
	
	//무한스크롤
	/* var page = 1;
	if ($("body").height() < $(window).height()) {
        alert("출력할 데이터가 없습니다.");
    }
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log(++page);
	      $("#enters").append("<h1>Page " + page + );
	      
	    }
	}); */
	
	
	//검색어 키워드 하이라이트
	 var keyword = $("#searchList-text").val();
	if($(".objet-title").val() != null || $(".objet-info").val() != null){
		 var objettitle = $(".objet-title").val();
		 var objetintro = $(".objet-info").val();
		 var otValue = objettitle.indexOf(keyword);
		 var oiValue = objetintro.indexOf(keyword);
		 if(otValue === -1 && oiValue === -1) {
			 $(".objet-title:contains('"+keyword+"')").each(function () {
		        	var regex = new RegExp(keyword,'gi');
		        $(this).html($(this).text().replace(regex, "<b>"+keyword+"</b>") );
		   	});
			 $(".objet-info:contains('"+keyword+"')").each(function () {
		        	var regex = new RegExp(keyword,'gi');
		        $(this).html($(this).text().replace(regex, "<b>"+keyword+"</b>") );
		   	});
		 }
	}
	if($(".artist-sub").val() != null || $(".artist-info").val() != null){
		var nickname = $(".artist-sub").val();
		 var artistinfo = $(".artist-info").val();
		 var nValue = nickname.indexOf(keyword);
		 var iValue = artistinfo.indexOf(keyword);
		 if(nValue === -1 && iValue === -1){
			 $(".artist-sub:contains('"+keyword+"')").each(function () {
		        	var regex = new RegExp(keyword,'gi');
		        $(this).html($(this).text().replace(regex, "<b>"+keyword+"</b>") );
		   	});
			 $(".artist-info:contains('"+keyword+"')").each(function () {
		        	var regex = new RegExp(keyword,'gi');
		        $(this).html($(this).text().replace(regex, "<b>"+keyword+"</b>") );
		   	});
		 }
	}
	 
  	
});

$.fn.setCursorPosition = function( pos ){
    this.each( function( index, elem ) {
        if( elem.setSelectionRange ) {
            elem.setSelectionRange(pos, pos);
        } else if( elem.createTextRange ) {
            var range = elem.createTextRange();
            range.collapse(true);
            range.moveEnd('character', pos);
            range.moveStart('character', pos);
            range.select();
        }
    });
    return this;
};

//폼 전송
function search() {
  $("#searchList-text").show();
  $("#searchList-text").focus();
  $("#searchList-btn").css("color", "#959595");
  var color = $("#searchList-btn").css("color");
	var form = document.forms["searchList-form"];
	var keyword = $("#searchList-text").val();
	if(color == 'rgb(149, 149, 149)'){
	form.action =  "search.do?keyword="+keyword;
    form.submit();
	}
};
function search2() {
	var form = document.forms["search-form-main"];
	var keyword = $("#search-text-main").val();
	form.action =  "search.do?keyword="+keyword;
    form.submit();
};

window.onload = function(){
	$("#searchList-text").hide();
	$("#searchList-btn").show();
	$("#search-btn").hide();
	$("#search-text-main").focus().setCursorPosition($("#search-text-main").val().length);
	$("#searchList-text").focus().setCursorPosition($("#searchList-text").val().length);
}
</script>
</head>
<body>
<section class="all">
<div id="search-box-top"> 
<form id='searchList-form' target='_top' class="ui icon input">
	  <input id='searchList-text' name="keyword" type="text" placeholder="검색어를 입력해주세요." 
	  autocomplete="off" value="${keyword }"/>
	  <span id="searchList-btn" class="material-icons" onClick="search();">&#xe8b6;</span>
</form>
</div>
<!-- 검색 키워드 -->
<div id="search-box-main"> 
<form id='search-form-main' accept-charset="utf-8" class="ui massive icon input">
	  <input class="ui wide fluid transparent icon input" id='search-text-main' name="keyword" type="text" placeholder="검색어를 입력해주세요." 
	  maxlength="20" onfocus="this.value = this.value;" autocomplete="off" value="${keyword }" />
</form>
</div>
<!-- 검색결과 리스트 -->
<div class="ui secondary blue pointing menu" id="search-menu">
  <a class="active item" id="item" data-tab="search-objet" style="margin-left:200px;">전시</a>
  <a class="item" id="item" data-tab="search-artist">작가</a>
</div>
<div class="search-cont">
 	<div class="ui bottom attached tab active" id="search-objet" >
 		<c:if test="${!empty searchobjetList}">
 		<div class="object-result">
 			<div class="result-option" style="display:flex;margin-top: 15px;justify-content:space-between;">
            <span class="result-title">전시 검색 결과 <span class="title-cnt">${fn:length(searchobjetList)}건 </span></span>
            <div class="search-option-cate">
            <span class="search-option">
                <a href="" class="option on" data-type="accu">&nbsp;정확도</a>&nbsp;&nbsp;
                <a href="" class="option" data-type="recency">&nbsp;최신순</a>&nbsp;&nbsp;
			</span>&nbsp;&nbsp;
			<div class="ui compact selection dropdown" id="dateoption">
			  <div class="text">전체 기간</div>
			  <i class="dropdown icon"></i>
			  <div class="menu">
			    <div class="item" data-value="2019">2019</div>
			    <div class="item" data-value="2018" >2018</div>
				<div class="item" data-value="2017" >2017</div>
				<div class="item" data-value="2016" >2016</div>
			  </div>
			</div>
			</div>
			</div><br>
			<div class="objet-result-list">
			<ul class="objet-result-list-common">
			<c:forEach var="objetSearch" items="${searchobjetList }" varStatus="status">
				<li class="objet-result-list-detail">
					<a href="objetOne.do?objetno=${objetSearch.objetno}&userid=${loginUser.userid}" target="_blank">
						<div class="objet-content">
							<strong class="objet-title">${objetSearch.objettitle }</strong>&nbsp;
							<c:if test="${objetSearch.objetstatus eq 'OPEN' }">
							<div class="ui circular button" id="objet-status" style="background:#df0000;color:#fff;">전시중</div>
							<div class="ui tiny blue button" onclick="" style="float:right;">전시관람</div><br>
							</c:if>
							<c:if test="${objetSearch.objetstatus eq 'STANDBY' }">
							<div class="ui circular button" id="objet-status" style="background:lightpink;color:#fff;width:65px;">전시예정</div>
							<div class="ui tiny blue button" style="float:right;" disabled>전시예정</div><br>
							</c:if>
							<c:if test="${objetSearch.objetstatus eq 'CLOSE' }">
							<div class="ui circular button" id="objet-status" style="background:#AAA;color:#fff;width:65px;">전시종료</div>
							<div class="ui tiny grey button" style="float:right;" disabled>전시종료</div><br>
							</c:if>
							<p class="objet-date">
							<fmt:formatDate value="${objetSearch.objetstartdate }" />&nbsp;-&nbsp;<fmt:formatDate value="${objetSearch.objetenddate }" />
							</p>
							<c:set var="noimages" value="resources/images/noimg2.jpg" />
							<img id="objet-img" class="ui fluid image" src="resources/images/objet/${objetSearch.renamemainposter }" 
							alt="${objetSearch.objettitle }" onerror="this.src='${noimages }'"> 
								<span class="objet-info">
									<c:set var="length" value="${fn:length(objetSearch.objetintro)}"/>
									<c:if test="${length > 150 }">
									${fn:substring(objetSearch.objetintro,0,150)}...
									</c:if>
									<c:if test="${length < 150 }">
									${fn:substring(objetSearch.objetintro,0,150)}
									</c:if>
								</span>
						</div>
						<div class="reply"> 
							<span class="reply">관심</span> <b class="num_txt">${likeobjetcntList[status.index] }</b> <span>·</span> 
							<span class="reply">댓글</span> <b class="num_txt">${reviewcntList[status.index] }</b> <span>·</span> 
							<%-- <span class="reply">
							<fmt:formatDate value="${objetSearch.objetstartdate }" />&nbsp;-&nbsp;<fmt:formatDate value="${objetSearch.objetenddate }" />
							</span> <span>·</span>  --%>
							<span class="reply">작가</span> <span class="reply">${objetSearch.nickname }</span>
						</div>
						<div class="objet-tag">
							<c:forTokens var="tags" items="${objetSearch.objettag }" delims=",">
							<a id="objet-tag" class="ui mini circular basic gray button" href="search.do?keyword=${tags }" target="_blank">${tags }</a>&nbsp;
							</c:forTokens>
						</div>
					</a>
					</li>
					</c:forEach>
					</ul>
				</div><br>
				<center>
				<div class="ui basic gray animated button" id="more_load" style="vertical-align:middle; display:none;" align="center" tabindex="0">
				  <div class="visible content">더보기</div>
				  <div class="hidden content">
				    <i class="ui chevron down icon" style="font-size:16px;vertical-align:middle;text-align:center"></i>
				  </div>
				</div>
				</center>
			</div><br><br><br>
			<div class="object-keyword">
        	<div class="wrap-keywords">
            <strong>추천 태그</strong>
            <div class="keyword-list" style="width: auto;margin: 0;padding: 10px 0 0;">
            <c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 6) %></c:set>
         	<c:set var="objetTag" value="${fn:split('건축,공예,서예,디자인,사진,회화,조각,기타', ',')}" />
                <div class="tab-keywords" style="position: relative;float: none; width: auto;display: inline-block;">
                <c:forEach var="item" items="${objetTag }" begin="${ran }" end="6">
                    <a id="a" class="ui circular small basic gray button" href="search.do?keyword=${item }" target="_blank">${item }</a>
                </c:forEach>
                </div>
            </div>
        </div>
    </div>
    </c:if>
    <c:if test="${empty searchobjetList}">
    <div class="empty_result">
        <span class="txt_keyword">${keyword }</span>에 대한 검색 결과가 없습니다.
        <ul class="empty_desc">
            <li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
            <li>두 단어 이상을 검색하신 경우, 정확하게 띄어쓰기를 한 후 검색해 보세요.</li>
            <li>키워드에 있는 특수문자를 뺀 후에 검색해 보세요.</li>
        </ul>
	</div>
    </c:if>
    </div>
    <div class="ui bottom attached tab" id="search-artist">
    <c:if test="${!empty searchartistList}">
		<div class="artist-result">
			<div class="result-option" style="margin-top: 15px;">
				<span class="result-title">작가 검색 결과 <span class="title-cnt">${fn:length(searchartistList)}건</span></span>
			</div>
			<div class="artist-result-list">
				<ul class="artist-result-list-common"><li>
				<c:forEach var="artistSearch" items="${searchartistList }" varStatus="status">
					<div class="artist-result-list-detail">
						<div class="artist-result-info">
							<a href="artistHomeMain.do?userid=${artistSearch.userid }&loginUser=${loginUser.userid}" class="artist-thumb" target="_blank"> 
							<img class="ui circular image" style="border: 1px solid #eee;" src="resources/users_upfiles/${artistSearch.userrpic }">
							<c:if test="${objetstatus[status.index].objetstatus eq 'OPEN' }">
							<div class="ui circular button" id="objet-status" style="margin:10px 0px 0px 21px;background:#df0000;color:#fff;">전시중</div>
							</c:if>
							<c:if test="${objetstatus[status.index].objetstatus eq 'STANDBY' }">
							<div class="ui circular button" id="objet-status" style="margin:10px 0px 0px 14px;background:lightpink;color:#fff;width:65px;">전시예정</div>
							</c:if>
							<c:if test="${objetstatus[status.index].objetstatus eq 'CLOSE' }">
							<div class="ui circular button" id="objet-status" style="margin:10px 0px 0px 14px;background:#AAA;color:#fff;width:65px;">전시종료</div>
							</c:if>
							</a> 
							<a href="artistHomeMain.do?userid=${artistSearch.userid }&loginUser=${loginUser.userid}" class="artist-follow" target="_blank">
							<span class="artist-sub">${artistSearch.nickname }</span>
							<span class="artist-info">
							<c:set var="length" value="${fn:length(artistSearch.userintrol)}"/>
							<c:if test="${length > 30 }">
							${fn:substring(artistSearch.userintrol,0,28)}...
							</c:if>
							<c:if test="${length < 30 }">
							${fn:substring(artistSearch.userintrol,0,28)}
							</c:if>
							</span>
							</a>
							<div class="follow-info">
								<span>전시 수 </span>${objetcntList[status.index] } <span>·</span><span> 구독자 수 </span>${followercntList[status.index]}
							</div>
						</div>
						<div class="artist-keywords">
		                    <c:forTokens var="tags" items="${artistSearch.usertag }" delims=",">
							<a id="a" style="cursor: pointer;" class="ui mini circular basic gray button" href="search.do?keyword=${tags }" target="_blank">${tags }</a>&nbsp;
							</c:forTokens>
						</div>
					</div>
					</c:forEach>
				</li></ul>
			</div><br>
			<center>
			<div class="ui basic gray animated button" id="more_load2" style="display:none;" >
			  <div class="visible content">더보기</div>
			  <div class="hidden content">
			    <i class="ui chevron down icon" style="font-size:16px;text-align:center"></i>
			  </div>
			</div>
			</center>
		</div><br><br><br>
		</c:if>
		<c:if test="${empty searchartistList}">
    	<div class="empty_result">
        <span class="txt_keyword">${keyword }</span>에 대한 검색 결과가 없습니다.
        <ul class="empty_desc">
            <li>검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.</li>
            <li>두 단어 이상을 검색하신 경우, 정확하게 띄어쓰기를 한 후 검색해 보세요.</li>
            <li>키워드에 있는 특수문자를 뺀 후에 검색해 보세요.</li>
        </ul>
	</div>
    </c:if>
    </div>
 	</div> 
 	</section>
 	<c:import url="../footer.jsp" />
</body>
</html>