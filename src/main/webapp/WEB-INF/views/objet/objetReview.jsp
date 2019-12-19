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
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style type="text/css">
.objet_infomation{
	width:100%;
	height:100%;
}
#banner_img {
	z-index:0;
	width:100%;
	height:420px;
	vertical-align: top;
	margin-top:-22px;
	overflow: scroll;
}
.header_icons {
	float:right;
}

#heart {
	position:relative;
    top:5%;
}
.like_cnt {
	position:relative;
    top:15%;
    color:#fff;
    font-size:16px;
}
#chat {
	position:relative;
    top:15%;
}
#share {
	position:relative;
    top:15%;
}
#more {
	position:relative;
    top:15%;
}
#objet_info_menu {
	margin-top:0px;
	border-radius: 0;
}
#item {
	font-weight: bold;
	color:#fff;
}
</style>
<script type="text/javascript">
$(function(){
	//tab menu
	$("#objet_info_menu #item").on("click", function(){
		  var tab = $(this).attr("data-tab");
		  $("#objet_info_menu #item").removeClass("active");
		  $(this).addClass("active");
		  $(".tab").removeClass("active");
		  $("#" + tab).addClass("active");
	});
	
	$(".search-option .option").on("click", function(){
  		$(".search-option .option").removeClass("on");
  		$(this).addClass("on");
  		$(".search-option .i .off").removeClass("off");
  		$(".search-option .i").addClass("off");
  	});
	
	
});

</script>
</head>
<body>
<div class="objet_infomation">
<div class="banner_exhibition">
<div class="header_icons">
<i class="ui heart outline icon" style="color:#fff;font-size:24px;" id="heart"></i>
<span class="like_cnt">153</span>
<i class="ui chat outline icon" style="color:#fff;font-size:24px;" id="chat"></i>
<i class="material-icons" style="color:#fff;font-size:24px;" id="share">&#xe80d;</i>
<i class="material-icons" style="color:#fff;font-size:24px;" id="more">&#xe5d4;</i>
</div>
<img src="resources/images/objet/objetmainposter.jpg" id="banner_img">
</div>
<div class="ui fluid four item inverted menu" id="objet_info_menu">
  <a class="active item" id="item">
    전시소개
  </a>
  <a class="item" id="item">
    작가소개
  </a>
  <a class="item" id="item">
    전시일정
  </a>
  <a class="item" id="item">
    한줄평
  </a>
</div>
<div class="objet_review_cont">
<div class="ui bottom attached tab active" id="objet_review">
   <span class="tit_rev">Review</span>
   <div class="search-option-cate">
   <span class="search-option">
       <a href="#" class="option on" data-type="accu">&nbsp;정확도</a>&nbsp;&nbsp;
       <a href="#" class="option" data-type="recency">&nbsp;최신순</a>&nbsp;&nbsp;
</span>&nbsp;&nbsp;
</div>
<br>
	<div class="ui basic gray animated button" style="vertical-align:middle;" align="center" tabindex="0"  onclick="javascript:moreContent('more_list', 10);">
 <div class="visible content">더보기</div>
 <div class="hidden content">
   <i class="ui chevron down icon" style="font-size:16px;vertical-align:middle;text-align:center"></i>
  </div>
</div><br><br><br><br>
</div>
</div>
</div>
<c:import url="../footer.jsp" />
</body>
</html>