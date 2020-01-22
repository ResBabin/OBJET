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
<c:import url="header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/search.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
 <link rel="stylesheet" href="resources/css/swiper.min.css">
 <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
 <script type="text/javascript">
 
 // 내정보수정 완료 시 완료 메시지 표출용 코드 여기서부터 ---
 var message = '${message}';
 if(message != null && message != ""){
	 alert(message);
 }// 여기까지 ----
 
 
 // 메인페이지 접속시마다 탈퇴 30일 경과한 회원 삭제하기
 $.ajax({
	url: "delQuitUsers.do",
	type:"post",
	success: function(result){
		if(result == "ok"){
            console.log("삭제데이터 존재")
          }
          else{
        	  console.log("삭제데이터 없음")
          }
	},
	error: function(request, status, errorData){
		console.log("error code : " + request.status + "\nMessage : " + request.responseText + "\nError : " + errorData);
	}
	 
 });
 
 /* 검색 아이콘  */
 $(function() {
     var placeholder = $("#search-text");
     
     $('#close-btn').click(function() {
         $('#search-overlay').fadeOut();
         $('#search-btn').show();
         $("#search-btn2").css("color", "#d6d6d6");
         $(".main").css("display", "table");
         $(".objet_main").css("display", "block");
         $(".search_keyword").css("display", "none");
         $(".search_keyword").hide();
         if(placeholder.val() != ""){
           placeholder.val("");
           $("#search-btn2").css("color", "#d6d6d6");
        }
       });
     
     $('#search-btn').click(function() {
       $(this).hide();
       $('#search-overlay').fadeIn();
       $("#search-text").focus();
       $(".search_suggest").show();
       $(".main").css("display", "none");
       $(".objet_main").css("display", "none");
     });
     
     $("#search-text").on("keyup", function(){
        if(placeholder.val() != "" || placeholder.val() != null){  //not null
         $(".search_suggest").hide();
         $(".search_keyword").fadeIn();
         $(".search_keyword").css("display", "flex");
        }if(placeholder.val() == "" || placeholder.val() == null){ //null
         $("#search-btn2").show();
         $(".search_suggest").fadeIn();
         $(".search_keyword").css("display", "none");
         $(".search_keyword").hide();
        }
     });
     
     $("#search-text").focus(function(){
        $("#search-btn2").css("color", "black");
     });
     $("#search-text").focusout(function(){
        if(placeholder.val() == ""){
           $("#search-btn2").css("color", "#d6d6d6");
        }
     });
     
   //폼 엔터키 전송
     $('#search-form').keydown(function(e) {
 	    if (e.keyCode == 13) {
 	    	search();
 	    }
 	});
     
     
   });

	//폼 전송
    function search() {
    	var form = document.forms["search-form"];
    	var keyword = $("#search-text").val();
    	form.action =  "search.do?keyword="+keyword;
        form.submit();
   };
   
   function keyword(){
	   var keyword = $("#search-text").val();
	   location.href = "search.do?keyword="+keyword;
   }
 </script>
 <style>
.objet_main {
   margin-top: 0px;
}

.swiper1 {
   height: calc(100vh - 410px);
   margin: 50px 50px 60px 50px;
   vertical-align: middle;
   align: center;
   width: 93vw;
}

.slide1 {
   overflow: hidden;
}

.inner1 {
   position: absolute;
   width: 100%;
   height: 100%;
   left: 0;
   top: 0;
   background-size: cover;
   background-position: center;
   vertical-align: middle;
   align: center;
}

.swiper-button-prev1 {
   background-image: url("resources/images/objet/prev_before.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-button-prev1:hover {
   background-image: url("resources/images/objet/prev_after.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-button-next1 {
   background-image: url("resources/images/objet/next_before.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-button-next1:hover {
   background-image: url("resources/images/objet/next_after.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-pagination1 .swiper-pagination-bullet {
   width: 10px;
   height: 10px;
   opacity: 0.8;
   background: #fff;
}

.swiper-pagination1 .swiper-pagination-bullet-active {
   background: #707070;
}

.info {
   display: inline-block;
   vertical-align: middle;
}

.text {
   font-family: 'Nanum Myeongjo'; 
   font-weight : 400;
   font-size: 28pt;
   color: #fff;
   text-align: left;
   position: absolute;
   top: 26.5%;
   left: 21%;
   transform: translate(-50%, -50%);
   line-height: 46px;
}

.date {
   font-family: 'Nanum Myeongjo'; nth-of-type (1) font-weight : 300;
   font-size: 18pt;
   color: #fff;
   text-align: left;
   line-height: 36px;
}

.objet_title {
   font-family: 'Nanum Myeongjo'; nth-of-type (1) font-weight : 400;
   font-size: 32px;
   text-align: center;
   letter-spacing: 1px;
}

.objet_subtitle {
   font-family: 'Nanum Gothic'; nth-of-type (1) font-weight : 400;
   font-size: 14px;
   text-align: center;
   color: gray;
   margin-top: -10px;
}

.objet_info_top {
   margin-left: 14.5%;
}

.objet_info {
   font-family: 'Nanum Myeongjo'; nth-of-type (2) font-weight : 400;
   font-size: 30pt;
   color: black;
   line-height: 52px;
}

.objet_info_part {
   font-family: 'Nanum Myeongjo'; nth-of-type (1) font-weight : 300;
   font-size: 24pt;
   color: #cacaca;
   line-height: 44px;
}

.more_btn {
   float: right;
   color: #959595;
   font-size: 16px;
   margin: -25px 50px 0px 0px;
}

/* objet 전시 pic */
.objet_pic {
   margin: 40px 0 0 0;
   width: 100%;
   overflow: hidden;
   height: 400px;
}

.objet_pic_main {
   width: 100%;
   height: 100%;
}

.swiper2 {
   width: 100%;
   height: 100%;
   align: center;
}

.slide2 {
   overflow: hidden;
   align-items: center;
   opacity: .85;
   cursor: pointer;
}

.slide2:hover {
   overflow: hidden;
   align-items: center;
   opacity: 1;
   cursor: pointer;
}

.inner2 {
   width: 100%;
   height: 100%;
   left: 0;
   top: 0;
   background-size: cover;
   background-position: center;
   align: center;
   transform: scale(1);
   -webkit-transform: scale(1);
   -moz-transform: scale(1);
   -ms-transform: scale(1);
   -o-transform: scale(1);
   transition: all 0.3s ease-in-out;
}

.inner2:hover {
   transform: scale(1.1);
   -webkit-transform: scale(1.1);
   -moz-transform: scale(1.1);
   -ms-transform: scale(1.1);
   -o-transform: scale(1.1);
}

.swiper-button-prev2 {
   background-image: url("resources/images/objet/prev_before.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-button-prev2:hover {
   background-image: url("resources/images/objet/prev_after.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-button-next2 {
   background-image: url("resources/images/objet/next_before.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-button-next2:hover {
   background-image: url("resources/images/objet/next_after.png")
      !important;
   background-size: contain;
   background-repeat: no-repeat;
   background-position: center center;
   right: 0 !important;
   align: center;
   width: 70px !important;
   height: 70px !important;
}

.swiper-pagination2 .swiper-pagination-bullet {
   width: 10px;
   height: 10px;
   opacity: 0.8;
   background: #fff;
}

.swiper-pagination2 .swiper-pagination-bullet-active {
   background: #707070;
}

.info2 {
   display: inline-block;
   vertical-align: middle;
}

.text2 {
   font-weight:400;
   font-size: 24px;
   color: #fff;
   text-align: center;
   position: absolute;
    top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   align: center;
   padding-top: 12px;
   line-height: 36px;
   font-family: 'Nanum Myeongjo', sans-serif;
   letter-spacing: -.025em;
}

.artist2 {nth-of-type (1) font-weight:300;
   font-size: 14px;
   color: #fff;
   text-align: center;
   line-height: 36px;
   padding-top: 30px;
   font-family: 'Noto Sans Light', sans-serif;
   opacity: .8;
}
/* artist pic */
.objet_artist {
   background: #fff;
}

.artist_pic {
   margin: 40px 0 0 0;
   width: 100%;
   overflow: hidden;
   height: auto;
}

.artist_pic_main {
   width: 100%;
   height: 100%;
   margin-left: 5%;
}

.artist_card {
   position: relative;
   overflow: hidden;
   margin: 10px;
   min-width: 230px;
   max-width: 315px;
   width: 100%;
   text-align: center;
   background-color: #ffffff;
   float: left;
   /* border: 1px solid #ccc; */
   margin-right: 40px;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.artist_card * {
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
   -webkit-transition: all 0.25s ease;
   transition: all 0.25s ease;
}

.img_blur {
   -webkit-filter: blur(1px);
   filter: blur(1px);
}

.img_blur:hover {
   -webkit-filter: blur(0px);
   filter: blur(0px);
}

.profile_back {
   max-width: 100%;
   opacity: 0.6;
   -webkit-filter: grayscale(100%);
   filter: gray;
   transform: scale(1);
   -webkit-transform: scale(1);
   -moz-transform: scale(1);
   -ms-transform: scale(1);
   -o-transform: scale(1);
   transition: all 0.4s ease-in-out;
}

.profile_back:hover {
   opacity: 1;
   -webkit-filter: grayscale(0%);
   filter: none;
   transform: scale(1.1);
   -webkit-transform: scale(1.1);
   -moz-transform: scale(1.1);
   -ms-transform: scale(1.1);
   -o-transform: scale(1.1);
}

.artist_card figcaption {
   width: 100%;
   background-color: #ffffff;
   padding: 25px;
   position: relative;
}

.artist_card .profile_pic {
   border-radius: 50%;
   position: absolute;
   bottom: 90%;
   left: 105px;
   max-width: 100px;
   opacity: 1;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
   align: center;
}

.artist_card a {
   align: center;
}

.artist_card h2 {
   margin: 30px 0 0 0px;
   font-weight: 400;
   color: #333333;
   font-size: 20px;
   text-align: center;
   font-weight: bolder;
   letter-spacing: 1px;
}

.artist_card h2 span {
   margin: 10px 0 0 0px;
   display: block;
   font-size: 12px;
   color: #666666;
   text-align: center;
   font-weight: bolder;
   letter-spacing: 1.5px;
}

.artist_card p {
   margin: 10px 0 15px 0px;
   font-size: 12px;
   letter-spacing: 1.5px;
   opacity: 0.9;
   color: #959595;
   text-align: center;
   line-height: 20px;
   font-weight: normal;
}

.artist_card #tag {
   margin: 20px 5px 15px 0px;
}

/* 카드 */
.container1 {
   float: left;
   margin-bottom: 50px;
   margin-left: 50px;
   margin-right: 0px;
   position: relative;
   left:1%;
   top:2%;
}

.container {
   margin-top: 50px;
   float: left;
   position: relative;
   width: 250px;
   height: 350px;
}

.container:hover>.thecard {
   transform: rotateY(180deg);
   cursor: pointer;
}

.thecard {
   position: absolute;
   width: 100%;
   height: 100%;
   transform-style: preserve-3d;
   transition: all 0.5s ease;
}

#cardimg {
   margin-bottom: 10px;
   border-radius: 50%;
}

.thefront {
   position: absolute;
   width: 100%;
   height: 100%;
   backface-visibility: hidden;
   background: white;
   text-align: center;
   border-radius: 10px;
   border : 1px solid #eee;
}

.cardsection {
/* 	box-shadow: 0px 0px 20px 3px lightgray;  */
   background: rgba(0, 0, 0, 0.03);
   height: 460px;
   width: 100%;
}

.writername {
   margin-top: 14px;
   font-weight: bolder;
  color: #333333;
  font-size:20px;
  text-align:center;
  font-weight: bolder;
  letter-spacing: 1px;
  font-family:'Nanum Gothic';
}

.writercoment {
  font-size: 12px;
  color: #666666;
  text-align:center;
  font-weight: normal;
  letter-spacing: 1.5px; 
  font-family:'Nanum Gothic';
}

.theback {
   position: absolute;
   width: 100%;
   height: 100%;
   backface-visibility: hidden;
   background:white;
   color: #555;
   text-align: center;
   font-family: 'Nanum Gothic', sans-serif;
   border-radius: 10px;
   text-align: left;
   transform: rotateY(180deg);
   border : 1px solid #eee;
}

.cardContent p {
  margin-top: 25px;
  color: #333333;
  font-size:14px;
  text-align:center;
  font-weight: bolder;
  letter-spacing: 1px;
  font-family:'Nanum Gothic';
}

.cardContent span {
  font-size: 12px;
  color: #666666;
  text-align:center;
  font-weight: lighter;
  letter-spacing: 1.5px; 
  font-family:'Nanum Gothic';
}

.tagboxes {
   align: middle;
}

.tagbox1 {
   color: rgba(0, 0, 0, 0.8);
   padding: 3px;
   margin-top: 70px;
   margin-left: 15px;
   height: 30px;
   width: 25%;
   border: 1px solid lightgray;
   border-radius: 30px;
   vertical-align:middle;
   align:center;
   font-size: 12px;
   float: left;
}

.tagbox2 {
   color: rgba(0, 0, 0, 0.6);
   margin-left: 17px;
   padding: 3px;
   margin-top: 70px;
   height: 30px;
   width: 25%;
   border: 1.8px solid rgba(0, 0, 0, 0.1);
   border-radius: 30px;
   float: left;
   font-size: 13px;
}

.tagbox3 {
   color: rgba(0, 0, 0, 0.6);
   margin-left: 17px;
   padding: 3px;
   margin-top: 70px;
   height: 30px;
   width: 25%;
   border: 1.8px solid rgba(0, 0, 0, 0.1);
   border-radius: 30px;
   float: left;
   font-size: 13px;
}
</style>
</head>
<body>
<section class="search">
 <!-- 검색 아이콘  -->
<i id="search-btn" class="material-icons">&#xe8b6;</i>
<!-- 검색창 시작 -->
<div id="search-overlay" class="block">
  <div class="centered">
    <div id='search-box'>
      <i id="close-btn" class="material-icons">&#xe5cd;</i>
      <form id='search-form' target='_top' class="ui wide fluid transparent icon input">
        <input id='search-text' name="keyword" type="text" placeholder="검색어를 입력해주세요." />
        <i class="material-icons" id="search-btn2" onclick="search();">&#xe8b6;</i>
      </form>
      <br><br>
      <!-- 오브제 추천 태그 -->
      <div class="search_suggest" align="center">
         <p><span>오브제</span> 추천 태그</p>
         <div class="search_tag">
         <c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 7) %></c:set>
         <c:set var="objetTag" value="${fn:split('건축,공예,서예,디자인,사진,회화,조각,기타', ',')}" />
         <c:set var="doneLoop" value="false" />
         <c:forEach var="item" items="${objetTag }" begin="0" end="${ran }" varStatus="status">
         <c:if test="${not doneLoop }">
         <div class="ui circular basic blue button">${item}</div> &nbsp;
         <c:if test="${status.index == 2 }">
         <c:set var="doneLoop" value="true" />
         </c:if>
         </c:if>
         </c:forEach>
         <br><br>
         </div>
         <ul class="search_art_list">
         <c:forEach var="Artist" items="${searchMainList }" begin="0" end="4">
         <c:set var="noimg" value="resources/images/basicprofilepic.png" />
            <li class="search_art_list_1">
            <a href="artistHomeMain.do?userid=${Artist.userid }&loginUser=${loginUser.userid}">
            <img id="search_art_list_img" class="ui small circular image" src="resources/users_upfiles/${Artist.userrpic }" onerror="this.src='${noimg }'"><br>
            <strong>${Artist.nickname }</strong>
            <p>${Artist.userintros }</p>
            </a>
            </li>
         </c:forEach>
         </ul>
     </div>
     <!-- 오브제 검색 키워드 -->
     <div class="search_keyword">
        <div class="objet_keyword"><!-- 오브제 전시 키워드 -->
           <h3 class="keyword_title"><a href="#" onclick="keyword();return false;">전시 검색
           <i id="arrow" class="material-icons">&#xe5cc;</i></a></h3>
           <div class="wrap_objet_list">
              <ul class="objet_list">
              <c:forEach var="suggest" items="${objetList }">
                 <c:if test="${empty loginUser}">
					<a href="objetOne.do?objetno=${suggest.objetno }">
				</c:if>
				<c:if test="${!empty loginUser}">
					<a href="objetOne.do?objetno=${suggest.objetno }&userid=${loginUser.userid}">
				</c:if>
					<li class="objet_list_item">${suggest.objettitle }</li></a>
              </c:forEach>
              <span class='txt_nodata_objet'>검색 결과가 없습니다.</span>
              </ul>
           </div>
        </div>
        <div class="artist_keyword"><!-- 오브제 작가 키워드 -->
           <h3 class="keyword_title"><a href="#" onclick="keyword();return false;">작가 검색
           <i id="arrow" class="material-icons">&#xe5cc;</i></a></h3>
           <div class="wrap_artist_list">
              <ul class="artist_list">
              	 <c:forEach var="Artist" items="${objetMainList }">
              	 <input type="hidden" class="nickname" name="nickname" value=${Artist.nickname }>
                 <li class="artist_list_item">
                 <a href="artistHomeMain.do?userid=${Artist.userid }&loginUser=${loginUser.userid}" target="_blank">
                 <img id="artist_list_img" class="ui mini circular image" src="resources/users_upfiles/${Artist.userrpic }"></a>
                 <a href="artistHomeMain.do?userid=${Artist.userid }&loginUser=${loginUser.userid}" class="artist_txt">${Artist.nickname }</a>
                 </li>
                 </c:forEach>
                 <span class='txt_nodata_artist'>검색 결과가 없습니다.</span>
              </ul>
           </div>
        </div>
     </div>
    </div>
  </div>
</div>
</section>
<script type="text/javascript">
$(function(){
	$("#search-text").on("keyup", function(){
		 var keyword = $(this).val();
		 $(".objet_list_item").hide();
		 $(".objet_list_item:contains('"+keyword+"')").slice(0, 5).fadeIn();
		 $(".objet_list_item:contains('"+keyword+"')").each(function () {
	        var regex = new RegExp(keyword,'gi');
	        $(this).html($(this).text().replace(regex, "<b>"+keyword+"</b>") );
			 });
		 $(".artist_list_item").hide();
		 $(".artist_list_item:contains('"+keyword+"')").slice(0, 4).fadeIn();
		 $(".artist_txt:contains('"+keyword+"')").each(function () {
	       	var regex = new RegExp(keyword,'gi');
	        $(this).html($(this).html().replace(regex, "<b>"+keyword+"</b>") );
			 }); 
		 if($(".objet_list_item:contains('"+keyword+"')").length == 0 && $(".artist_list_item:contains('"+keyword+"')").length == 0){
			 $(".txt_nodata_objet ").show();
			 $(".txt_nodata_artist ").show();
		 }
		 if($(".artist_list_item:contains('"+keyword+"')").length == 0 && $(".objet_list_item:contains('"+keyword+"')").length != 0){
			 $(".txt_nodata_artist ").show();
			 $(".txt_nodata_objet ").hide();
		 }
		 if($(".artist_list_item:contains('"+keyword+"')").length != 0 && $(".objet_list_item:contains('"+keyword+"')").length == 0){
			 $(".txt_nodata_artist ").hide();
			 $(".txt_nodata_objet ").show();
		 }
	});
});
</script>
<!-- 검색창 끝 -->
<br>
<section class="objet_main">
<section class="objet_info_top">
<span class="objet_info">모든 것이 작품이 되는 공간, 오브제</span><br>
<span class="objet_info_part">오브제에 여러분의 전시를 열어주세요.</span><br>
<span class="objet_info_part">오브제는 모든 창작자들을 응원합니다.</span><br>
<span class="objet_info_part" style="color:#dedede;nth-of-type(1) font-weight:300;">지금 바로, 전시를 열고, 감상하세요!</span>
</section>
<div class="objet_banner">
<div class="swiper-container swiper1">
  <div class="swiper-wrapper wrapper1">
  <c:forEach var="objet" items="${ objetAllList}">
    <div class="swiper-slide slide1">
		<a href="objetOne.do?objetno=${objet.objetno }&userid=${loginUser.userid}">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/${objet.renamemainposter })"></div>
      <%-- <div class="info"><span class="text">
      	<c:choose>
           <c:when test="${fn:length(objet.objettitle) > 12}">
            <c:out value="${fn:substring(objet.objettitle,0,11)}"/><br>
            <c:out value="${fn:substring(objet.objettitle,11,23)}"/><br>
            <c:out value="${fn:substring(objet.objettitle,23,length)}"/>
           </c:when>
           <c:otherwise>
            <c:out value="${objet.objettitle}"/><br>
           </c:otherwise> 
			</c:choose>
      <span class="date"><fmt:formatDate value="${objet.objetstartdate }" />&nbsp;-&nbsp;<fmt:formatDate value="${objet.objetenddate }" /><span></span><br></span></div> --%></a>
    </div>
   </c:forEach>
  </div>
  <div class="swiper-pagination swiper-pagination1"></div>
  <div class="swiper-button-next swiper-button-next1"></div>
  <div class="swiper-button-prev swiper-button-prev1"></div>
</div>
     <!-- Swiper JS -->
   <script type="text/javascript" src="resources/js/swiper.min.js"></script>
     <script type="text/javascript">

       var interleaveOffset = 0.5;

       var swiperOptions = {
         loop: true,
         speed: 1000,
         grabCursor: true,
         watchSlidesProgress: true,
         navigation: {
           nextEl: ".swiper-button-next1",
           prevEl: ".swiper-button-prev1"
         },
         pagination: {
           el: '.swiper-pagination1',
           clickable: true,
        },
        autoplay: {
              delay: 3000,
          },
         on: {
           progress: function() {
             var swiper = this;
             for (var i = 0; i < swiper.slides.length; i++) {
               var slideProgress = swiper.slides[i].progress;
               var innerOffset = swiper.width * interleaveOffset;
               var innerTranslate = slideProgress * innerOffset;
               swiper.slides[i].querySelector(".slide-inner").style.transform =
                 "translate3d(" + innerTranslate + "px, 0, 0)";
             }      
           },
           touchStart: function() {
             var swiper = this;
             for (var i = 0; i < swiper.slides.length; i++) {
               swiper.slides[i].style.transition = "";
             }
           },
           setTransition: function(speed) {
             var swiper = this;
             for (var i = 0; i < swiper.slides.length; i++) {
               swiper.slides[i].style.transition = speed + "ms";
               swiper.slides[i].querySelector(".slide-inner").style.transition =
                 speed + "ms";
             }
           }
         }
       };

       var swiper = new Swiper(".swiper1", swiperOptions);
     </script>
</div><br><br>
<!-- 전시 추천(더보기 리스트)  -->
<div class="objet_exhibition">
<h3 class="objet_title">OBJET EXHIBITION</h3>
<p class="objet_subtitle">오브제만의 특별한 전시</p>
<a href="objetAllList.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a>
<div class="objet_pic">
   <div class="objet_pic_main">
   <div class="swiper-container swiper2">
     <div class="swiper-wrapper wrapper2">
     <c:forEach var="objet2" items="${objetMainList }">
     	<c:if test="${objet2.objetstatus eq 'OPEN' }">
	    <div class="swiper-slide slide2">
	      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/${objet2.objetrfile1 })"></div>
	      <div class="info2"><span class="text2">${objet2.objettitle}<br>
	      <span class="artist2">by ${objet2.nickname }</span><br></span></div>
	    </div>
	    </c:if>
	 </c:forEach>
  </div>
 <!--  <div class="swiper-pagination swiper-pagination2"></div>
  <div class="swiper-button-next swiper-button-next2"></div>
  <div class="swiper-button-prev swiper-button-prev2"></div> -->
</div>
   <script type="text/javascript" src="resources/js/swiper.min.js"></script>
     <script type="text/javascript">
     var swiper = new Swiper('.swiper2', {
           slidesPerView: 4,
            spaceBetween: 0,
            slidesPerGroup: 1,
            loopFillGroupWithBlank: true,
         loop: true,
         /* navigation: {
           nextEl: ".swiper-button-next2",
           prevEl: ".swiper-button-prev2"
         },
         pagination: {
           el: '.swiper-pagination2',
           clickable: true,
        }, */
       /*  autoplay: {
            delay: 2000,
          }, */
       });

       /* var swiper = new Swiper(".swiper2", swiperOptions); */
     </script>
   </div>
</div>
</div><br><br><br>
<h3 class="objet_title">OBJET ARTIST</h3>
<p class="objet_subtitle">오브제의 창작가들</p><br>
<a href="artistAllList.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a><br>
<section class="cardsection">
  <!-- 작가 카드 -->
 <c:forEach var="artistcard" items="${ objetMainList}" end="4" varStatus="status"> 
 <c:set var="objetTag" value="${fn:split('건축,공예,서예,디자인,사진,회화,조각,기타', ',')}" />
 <c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 7) %></c:set>
  <div class="container1">
     <div class="container">
      <div class="thecard">
         <div class="thefront"><br><br><br>
         <a href="artistHomeMain.do?userid=${artistcard.userid }&loginUser=${loginUser.userid}"><img id="cardimg" src="resources/users_upfiles/${artistcard.userrpic }" width=35% height=25%></a>
            <div class ="writername">${artistcard.nickname }</div><br>
            <div class ="writercoment">${artistcard.userintros }</div>
			   <div class="tagboxes">
			   <c:set var="doneLoop" value="false" />
			   <c:forEach var="item" items="${ objetTag}" end="${ran }" varStatus="status"> 
			   <c:if test="${not doneLoop }">
			   	<div class="tagbox1">${item }</div>
			   	<c:if test="${status.index == 2 }">
			   	<c:set var="doneLoop" value="true" />
		         </c:if>
		         </c:if>
			   	 </c:forEach>
			   </div>
         </div>
         
          <div class="theback" style="align:center;">
            <div class="cardContent">
           	 <center>
           	 	<c:if test="${artistcard.objettitle ne null && artistcard.objettitle2 ne null}">
               <p>${artistcard.objettitle }</p>
               <span>${artistcard.objettitle2 }</span>
               </c:if>
               <c:if test="${artistcard.objettitle eq null && artistcard.objettitle2 eq null }">
               <p>현재 공개중인 전시가 없습니다.</p>
               </c:if>
               </center>
               <br>
               <c:set var="noimages" value="resources/images/noimg2.jpg" />
               <center> 
            	<img src="resources/images/objet/${artistcard.objetrfile2 }" 
            	onerror="this.src='${noimages }'" width="70%" height="65%">
            </center>  
            </div>
         </div> 
         
      </div>
      </div>      
   </div>
   </c:forEach>
</section>
</section>
<c:import url="footer.jsp" />
</body>
</html>
