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
#search-objet {
	
}
.object-result {
	width:55%;
}
.object-keyword {
	float: right;
	width:17%;
	margin-top:-1100px;
	margin-right:370px;
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
	background-color:#e74c3c;
	font-size:12px;
	width:55px;
	height:auto;
	padding: 6px;
	margin:0;
	text-align:center;
}
.objet-date {
	font-size: 14px;
	font-weight: normal;
	font-family: 'Nanum Gothic';
	color: #333333;
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
	font-size: 16px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #666666;
	line-height: 21px;
	padding-top:15px;
	margin-top:20px;
	margin-bottom:5px;
}
.objet-info b{
	font-size: 16px;
	font-weight: bolder;
	font-family:'Nanum Gothic';
	color: #2185d0;
}
#objet-tag{
	font-size: 13px;
	font-weight: normal;
	font-family:'Nanum Gothic';
	color: #666666;
	margin-top:10px;
}
.reply {
	font-size: 15px;
	font-weight: lighter;
	font-family:"Cormorant SemiBold", 'Nanum Gothic';
	color: #959595;
	margin-top:6px;
}

.artist-result {
	width:65%;
}
.artist-result-list-detail{
	font-family:"Cormorant SemiBold", 'Nanum Gothic';
	float: left;
    position: relative;
    width: 500px;
    height: 200px;
    margin: 20px 0 20px 0;
    padding: 25px 20px;
    background-color: #fff;
    box-sizing: border-box;
    box-shadow: 0 1px 0 0 #eee;
    border: 1px solid #eee;
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
    line-height: 22px;
    display: block;
    padding-top: 1px;
    font-weight: lighter;
    text-overflow: ellipsis;
    overflow: hidden;
    max-width: 320px;
    white-space: nowrap;
    color:#333;
    font-family:'Nanum Gothic';
}
.artist-info {
	font-family:'Nanum Gothic';
	display: block;
    overflow: hidden;
    padding: 12px 0 0;
    color: #909090;
    text-overflow: ellipsis;
    max-height: 42px;
    font-size: 15px;
    line-height: 1.5;
    font-weight: bolder;
}
.artist-info b{
	color: #2185d0;
	font-weight: bold;
}
.follow-info {
	padding: 10px 0 0;
	color: #959595;
	font-size: 12px;
	font-family:'Nanum Gothic';
	line-height: 1.5;
    font-weight: bolder;
}
.follow-info span{
	padding: 10px 0 0;
    font-size: 12px;
    color: #959595;
    font-family:'Nanum Gothic';
    line-height: 1.5;
    font-weight: bolder;
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
</style>
<script type="text/javascript">
$(function() {
  $("#searchList-btn").on("click", function(){
	  $("#searchList-text").show();
	  $("#searchList-text").focus();
	  $("#searchList-btn").css("color", "#959595");
  });
  
  //tab menu
  $("#search-menu #item").on("click", function(){
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

function submit() {
	  document.getElementById("searchList-btn").onclick = function() {
	      document.getElementById('searchList-form').submit();
	      return false;
		};
};


//더보기 버튼 함수
/* function moreContent(id, cnt){
	
	var list_length = $("#"+id+" tr").length-1; //tr갯수 구하기 , 1을 빼는 이유는 제목,작성자 tr이 하나 존재하기 때문.
	var aname = id+"_btn";
	var callLength = list_length;
	
	$('#startCount').val(callLength);
	$('#viewCount').val(cnt);
	
	    $.ajax({
	        type    :   "post",
	        url     :   "/getMoreContents_ajax.do",
	        data    :   $('#searchTxtForm').serialize(),
	        dataType:   "json",
	        success :   function(result) {
	                       if(result.resultCnt > 0){
	                    	   var list = result.resultList;
	                    		   if(resultVO.title != '') {
	                    			 $('#'+aname).attr('href',"javascript:moreContent('"+id+"', "+cnt+");");
	                    			   getMoreList(list);
	                    		   }else{
	                    			$("#"+id+"_div").remove();
	                    		   }
	                    	   }
	                       }else{
	                       }
	                    },
	        error   :   function(request,status,error){
	                    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	                    }
	    });
	    
	    function getMoreList(list){
	    	
	    	var content = "";
	    	var length = list.length;
	    	for(i=0; i<list.length; i++){
	    		var resultVO = list[i];
	    		if(resultVO.title != ''){
   	    		content += "<tr>";
   	   	    	content += "<td>"+resultVO.title+"</td>";
   	   	    	content += "<td>"+resultVO.reg_date+"</td>";
   	 	    	content += "</tr>";
	    		}
	    	}
	    	 $("#more_list tr:last").after(content); 
         // id가 more_list 인 tr의 마지막에 content 값을 추가함
	    } */

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
<form action='objetSearchList.do' id='searchList-form' method='get' target='_top' class="ui icon input">
	  <input id='searchList-text' name="q" type="text" placeholder="검색어를 입력해주세요." 
	  autocomplete="off" value="오브제" />
	  <!-- <input name="userid" type="hidden" value=""> -->
	  <span id="searchList-btn" class="material-icons" onClick="submit();">&#xe8b6;</span>
</form>
</div>
<!-- 검색 키워드 -->
<div id="search-box-main"> 
<form action='objetSearchList.do' id='search-form-main' method='get' accept-charset="utf-8"
 class="ui massive icon input">
	  <input id='search-text-main' name="q" type="text" placeholder="검색어를 입력해주세요." 
	  maxlength="20" onfocus="this.value = this.value;" autocomplete="off" value="오브제" />
	  <!-- <input type="hidden" value="article" name="type" id="hdn_search_type"> -->
</form>
</div>
<!-- 검색결과 리스트 -->
<div class="ui secondary blue pointing menu" id="search-menu">
  <a class="active item" id="item" data-tab="search-objet" style="margin-left:200px;">전시</a>
  <a class="item" id="item" data-tab="search-artist">작가</a>
</div>
<div class="search-cont">
 	<div class="ui bottom attached tab active" id="search-objet" >
 		<div class="object-result">
 			<div class="result-option" style="display:flex;margin-top: 15px;justify-content:space-between;">
            <span class="result-title">전시 검색 결과 <span class="title-cnt">130건 </span></span>
            <div class="search-option-cate">
            <span class="search-option">
                <a href="#" class="option on" data-type="accu">&nbsp;정확도</a>&nbsp;&nbsp;
                <a href="#" class="option" data-type="recency">&nbsp;최신순</a>&nbsp;&nbsp;
			</span>&nbsp;&nbsp;
			<div class="ui compact selection dropdown" id="dateoption">
			  <div class="text">전체 기간</div>
			  <i class="dropdown icon"></i>
			  <div class="menu">
			    <div class="item" data-value="2019">2019</div>
			    <div class="item" data-value="2018" >2018</div>
				<div class="item" data-value="2017" >2017</div>
				<div class="item" data-value="2016" >2016</div>
				<div class="item" data-value="2015" >2015</div>
				<div class="item" data-value="2014" >2014</div>
				<div class="item" data-value="2013" >2013</div>
			  </div>
			</div>
			</div>
			</div><br>
			<div class="objet-result-list">
			<ul class="objet-result-list-common">
				<li class="objet-result-list-detail">
					<a href="" target="_blank">
						<div class="objet-content">
							<strong class="objet-title">너는, 나의, <b>오브제</b></strong>&nbsp;
							<div class="ui circular teal button" id="objet-status">전시중</div><br>
							<!-- <p class="objet-date">2019.12.03(화)~2019.12.15(토)</p> -->
							<img id="objet-img" class="ui fluid image" src="resources/images/objet/나의오랜연인에게커버.jpg" alt="이미지정보"> 
								<span class="objet-info">
									<b>오브제</b> '처음 같은 설레임보다 서로를 따뜻하게 바라봐주는 지금 이대로의 모습이 소중해'
									한 해를 마무리하는 12월, 따뜻한 연말의 감성을 자극할 미디엄 발라드 곡으로 돌아온 다비치!
									'나의 오랜 연인에게'는 오랜 시간 옆 자리를 지켜준 누군가를 향한 감사의 메세지를 따뜻한 가삿말로...
								</span>
						</div>
						<div class="objet-tag">
							<a id="objet-tag" class="ui mini circular basic gray button" href="" target="_blank">디자인</a>&nbsp;
							<a id="objet-tag" class="ui mini circular basic gray button" href="" target="_blank">사진</a>&nbsp;
							<a id="objet-tag" class="ui mini circular basic gray button" href="" target="_blank">기타</a>
						</div>
						<div class="reply"> 
							<span class="reply">관심</span> <b class="num_txt">21</b> <span>·</span> 
							<span class="reply">댓글</span> <b class="num_txt">18</b> <span>·</span> 
							<span class="reply">Dec 03.2019 - Dec 15.2019</span> <span>·</span> 
							<span class="reply">작가</span> <span class="reply">이지은</span>
						</div>
					</a>
					</li><br><hr style="border: 1px solid #eee;"><br>
					<li class="objet-result-list-detail">
					<a href="" target="_blank">
						<div class="objet-content">
							<strong class="objet-title">너는, 나의, <b>오브제</b></strong>&nbsp;
							<div class="ui circular teal button" id="objet-status">전시중</div><br>
							<!-- <p class="objet-date">2019.12.03(화)~2019.12.15(토)</p> -->
							<img id="objet-img" class="ui fluid image" src="resources/images/objet/나의오랜연인에게커버.jpg" alt="이미지정보"> 
								<span class="objet-info">
									<b>오브제</b> '처음 같은 설레임보다 서로를 따뜻하게 바라봐주는 지금 이대로의 모습이 소중해'
									한 해를 마무리하는 12월, 따뜻한 연말의 감성을 자극할 미디엄 발라드 곡으로 돌아온 다비치!
									'나의 오랜 연인에게'는 오랜 시간 옆 자리를 지켜준 누군가를 향한 감사의 메세지를 따뜻한 가삿말로...
								</span>
						</div>
						<div class="objet-tag">
							<a id="objet-tag" class="ui mini circular basic gray button" href="" target="_blank">디자인</a>&nbsp;
							<a id="objet-tag" class="ui mini circular basic gray button" href="" target="_blank">사진</a>&nbsp;
							<a id="objet-tag" class="ui mini circular basic gray button" href="" target="_blank">기타</a>
						</div>
						<div class="reply"> 
							<span class="reply">관심</span> <b class="num_txt">21</b> <span>·</span> 
							<span class="reply">댓글</span> <b class="num_txt">18</b> <span>·</span> 
							<span class="reply">Dec 03.2019 - Dec 15.2019</span> <span>·</span> 
							<span class="reply">작가</span> <span class="reply">이지은</span>
						</div>
					</a>
					</li><br><hr style="border: 1px solid #eee;"><br>
					</ul>
				</div><br>
				<center>
				<div class="ui basic gray animated button" style="vertical-align:middle;" align="center" tabindex="0"  onclick="javascript:moreContent('more_list', 10);">
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
                <div class="tab-keywords" style="position: relative;float: none; width: auto;display: inline-block;">
                    <a id="a" class="ui circular small basic gray button" href="/keyword/건축" target="_blank">건축</a>
                    <a id="a" class="ui circular small basic gray button" href="/keyword/공예" target="_blank">공예</a>
                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
                    <a id="a" class="ui circular small basic gray button" href="/keyword/서예" target="_blank">서예</a>
                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="ui bottom attached tab" id="search-artist">
		<div class="artist-result">
			<div class="result-option" style="margin-top: 15px;">
				<span class="result-title">작가 검색 결과 <span class="title-cnt">8건</span></span>
			</div>
			<div class="artist-result-list">
				<ul class="artist-result-list-common"><li>
					<div class="artist-result-list-detail">
						<div class="artist-result-info">
							<a href="" class="artist-thumb"> 
							<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg">
							<div class="ui circular teal button" id="objet-status" style="margin:10px 0px 0px 23px;">전시중</div></a> 
							<a href="" class="artist-follow">
							<strong class="artist-sub">이지은</strong>
							<span class="artist-info"><b>오브제</b>를 창조하는 사람입니다.</span>
							</a>
							<div class="follow-info">
								<span>글 수 </span>28 <span>·</span><span> 구독자 수 </span>203
							</div>
						</div>
						<div class="artist-keywords">
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
						</div>
					</div>
					<div class="artist-result-list-detail" style="margin:20px 0 20px 25px;">
						<div class="artist-result-info">
							<a href="" class="artist-thumb"> 
							<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게3.jpg">
							<div class="ui circular teal button" id="objet-status" style="margin:10px 0px 0px 23px;">전시중</div></a> 
							<a href="" class="artist-follow"> 
							<strong class="artist-sub">이지은</strong>
							<span class="artist-info"><b>오브제</b>를 창조하는 사람입니다.</span>
							</a>
							<div class="follow-info">
								<span>글 수 </span>28 <span>·</span><span> 구독자 수 </span>203
							</div>
						</div>
						<div class="artist-keywords">
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
						</div>
					</div>
					<div class="artist-result-list-detail" style="clear:left;">
						<div class="artist-result-info">
							<a href="" class="artist-thumb"> 
							<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg">
							<div class="ui circular teal button" id="objet-status" style="margin:10px 0px 0px 23px;">전시중</div></a> 
							<a href="" class="artist-follow">
							<strong class="artist-sub">이지은</strong>
							<span class="artist-info"><b>오브제</b>를 창조하는 사람입니다.</span>
							</a>
							<div class="follow-info">
								<span>글 수 </span>28 <span>·</span><span> 구독자 수 </span>203
							</div>
						</div>
						<div class="artist-keywords">
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
						</div>
					</div>
					<div class="artist-result-list-detail" style="margin:20px 0 20px 25px;">
						<div class="artist-result-info">
							<a href="" class="artist-thumb"> 
							<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게3.jpg">
							<div class="ui circular teal button" id="objet-status" 
							style="margin:10px 0px 0px 19px;background-color:#2185d0;width:60px;">전시예정</div></a> 
							<a href="" class="artist-follow"> 
							<strong class="artist-sub">이지은</strong>
							<span class="artist-info"><b>오브제</b>를 창조하는 사람입니다.</span>
							</a>
							<div class="follow-info">
								<span>글 수 </span>28 <span>·</span><span> 구독자 수 </span>203
							</div>
						</div>
						<div class="artist-keywords">
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
						</div>
					</div>
					<div class="artist-result-list-detail" style="clear:left;">
						<div class="artist-result-info">
							<a href="" class="artist-thumb"> 
							<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg">
							<div class="ui circular teal button" id="objet-status" 
							style="margin:10px 0px 0px 19px;background-color:#2185d0;width:60px;">전시예정</div></a> 
							<a href="" class="artist-follow">
							<strong class="artist-sub">이지은</strong>
							<span class="artist-info"><b>오브제</b>를 창조하는 사람입니다.</span>
							</a>
							<div class="follow-info">
								<span>글 수 </span>28 <span>·</span><span> 구독자 수 </span>203
							</div>
						</div>
						<div class="artist-keywords">
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
						</div>
					</div>
					<div class="artist-result-list-detail" style="margin:20px 0 20px 25px;">
						<div class="artist-result-info">
							<a href="" class="artist-thumb"> 
							<img class="ui circular image" src="resources/images/objet/나의 오랜 연인에게3.jpg">
							<div class="ui circular teal button" id="objet-status" 
							style="margin:10px 0px 0px 19px;background-color:gray;width:60px;">전시종료</div></a> 
							<a href="" class="artist-follow"> 
							<strong class="artist-sub">이지은</strong>
							<span class="artist-info"><b>오브제</b>를 창조하는 사람입니다.</span>
							</a>
							<div class="follow-info">
								<span>글 수 </span>28 <span>·</span><span> 구독자 수 </span>203
							</div>
						</div>
						<div class="artist-keywords">
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/디자인" target="_blank">디자인</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/사진" target="_blank">사진</a>
		                    <a id="a" class="ui circular small basic gray button" href="/keyword/회화" target="_blank">회화</a>
						</div>
					</div>
				</li></ul>
			</div><br>
			<center>
			<div class="ui basic gray animated button" style="vertical-align:middle;" align="center" tabindex="0"  onclick="javascript:moreContent('more_list', 10);">
			  <div class="visible content">더보기</div>
			  <div class="hidden content">
			    <i class="ui chevron down icon" style="font-size:16px;vertical-align:middle;text-align:center"></i>
			  </div>
			</div></center><br><br><br>
		</div>
    </div>
 	</div> 
 	</section>
 	<c:import url="../footer.jsp" />
</body>
</html>