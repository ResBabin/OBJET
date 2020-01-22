<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- 시맨틱유아이 cdn -->
<script type="text/javascript" src="/objet/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/main.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/search.css">
<style type="text/css">
body {
  margin: 0;
  padding: 0;
}

/* 검색 */
.search-box-top{
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



</style>
<script type="text/javascript">
$(function() {
	$("#searchList-btn").on("click", function() {
		$("#searchList-text").show();
		$("#searchList-text").focus();
		$("#searchList-btn").css("color", "#959595");
		if($("#searchList-btn").css("color") == 'rgb(149, 149, 149)'){
			search();
		}
	});
	
	$("body").on('mousewheel',function(e){ 
        var wheel = e.originalEvent.wheelDelta; 
        if(wheel>0){ 
          //스크롤 올릴때 
          $(".search-box-top").fadeIn();
        } else { 
          //스크롤  내릴때 
           $(".search-box-top").fadeOut();
        } 
      });
	
	//폼 엔터키 전송
 	 $('#searchList-form').keydown(function(e) {
 	    if (e.keyCode == 13) {
 	    	search();
 	    }
 	 });
	
});

//폼 전송
if($("#searchList-text").val() != null){
	function search() {
		var form = document.forms["searchList-form"];
		var keyword = $("#searchList-text").val();
		form.action =  "search.do?keyword="+keyword;
	    form.submit();
	};
}

window.onload = function() {
	$("#searchList-text").hide();
	$("#searchList-btn").show();
}


</script>
</head>
<body>
<!-- 검색 아이콘  -->
<section class="headerSearch">
<div class="search-box-top"> 
<form id='searchList-form' target='_top' class="ui icon input">
  <input id='searchList-text' name="keyword" type="text" placeholder="검색어를 입력해주세요." autocomplete="off" value="" />
  <span id="searchList-btn" class="material-icons">&#xe8b6;</span>
</form>
</div>
</section>
</body>
</html>