<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- favicon 위치 -->
<link rel="shortcut icon" href="resources/images/favicon-32x32.png">
<link rel="icon" href="resources/images/favicon-32x32.png">
<title>Objet</title>
<c:import url="../header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="resources/css/swiper.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/fomantic-ui@2.8.3/dist/semantic.min.js"></script>
<script src="https://kit.fontawesome.com/7759bae683.js" crossorigin="anonymous"></script>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
.all {
	min-height: 100%;
}
.objet_view_main {
	padding-bottom: 0px;
}
.vr_overlay {
	background: rgba(255,255,255,0.3);
	opacity:0.3;
}
#objet_vr {
	width : 100%;
	height: 700px;
}
.objet_vr_tag {
	position: relative;
	left:8%;
	margin-top:35px;
}
#tag {
	font-weight:bold;
	font-family: 'Nanum Gothic';
	font-size: 15px;
}
.objet_rev_btn {
	position: relative;
	right:8%;
	margin-top:35px;
}
#objet_rev {
	font-weight:bold;
	font-family: 'Nanum Gothic';
	font-size: 16px;
}
/* .chat {
	background:url(resources/images/objet/chat.png) no-repeat top left;
	display: inline-block;
	width: 50px;
	height:18px;
	 padding-left:25px;
	 display: inline;
	 white-space:nowrap;
} */
#objet_btn {
	width: 307px;
	height: auto;
}
#objet_guide {
	width: 307px;
	height: auto;
}
.objet_artist_info {
	background: #f5f5f5;
	min-width:100%;
	min-height: 100%;
}
.objet_title{
	font-family: 'Nanum Myeongjo';
	nth-of-type(1) font-weight: 400; 
    font-size: 32px;
    text-align: center;
    letter-spacing: 1px;
    padding:0;
}
.more_btn {
   float: right;
   color: #959595;
   font-size: 16px;
   margin: -25px 50px 0px 0px;
}
.profile_pic {
  border-radius: 50%;
  max-width: 110px;
  border: 1px solid lightgray;
}
.objet_profile {
  margin-left:85.5%;
  margin-top:-210px;
}
#follow_btn {
	margin-top:90px;
	margin-left:86%;
	cursor: pointer;
}
.artist_objet_more {
	margin-top:30px;
}
.objet_txt {
	position: relative;
	left:8%;
	top:55px;
}
.obj_name {
  color: #333333;
  font-size:32px;
  font-weight: bold;
  letter-spacing: 0.3px; 
  font-family: 'Nanum Gothic';
  line-height: 52px;
}
.obj_info1 {
	color: #5e5e5e;
  font-size:16px;
  font-weight: bolder;
  letter-spacing: 0.3px; 
  font-family: 'Nanum Gothic';
  line-height: 36px;
}
.obj_info2 {
	color: #9e9e9e;
  font-size:14px;
  font-weight: normal;
  letter-spacing: 0.3px; 
  font-family: 'Nanum Gothic';
  line-height: 34px;
}
.obj_txt {
	color: #5e5e5e;
  font-size:16px;
  font-weight: bolder;
  letter-spacing: 0.3px; 
  font-family: 'Nanum Gothic';
  line-height: 26px;
  text-align: left;
  margin-right:45px;
  
}
.obj_cnt {
	color: #9e9e9e;
  font-size:20px;
  font-weight: bolder;
  letter-spacing: 0px; 
  font-family: 'Nanum Gothic';
  line-height: 30px;
  text-align: left;
  margin-right:35px;
}
.item img{
	width:350px;
	height: auto;
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

.text2 {nth-of-type (2) font-weight:400;
   font-size: 25px;
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

.vp_top {
	float: right;
	position: relative;
	margin-left: 90%;
	margin-top:-70px;
}
</style>
<script type="text/javascript">
$(function(){
	//전시감상 안내 모달
	$(".vr_overlay").on("click", function() {
		$("#vr_guideline_modal").modal('show');
	});
});
	
</script>
</head>
<body>
<c:import url="../headerSearch.jsp" />
<section class="all">
<div class="objet_view_main">
<div class="vr_overlay" style="display:block;">
<img src="resources/images/objet/22.JPG" id="objet_vr">
</div>
<!-- 전시감상 모달 -->
<div class="ui mini modal" id="vr_guideline_modal">
<p style="font-size: 32px;padding-top:30px;color:black;text-align:center;font-weight: bold;font-family:'Nanum Gothic';">COCO CAPITAN</p>
<p style="font-size: 14px;text-align: center;font-family:'Nanum Gothic';font-weight: bolder;">2019. 08. 02 - 2020. 01. 20</p>	
<br><br>
<div class="actions" style="align:center;">
    <div id="objet_btn" class="ui fluid black button" onClick="location.href ='objetOne.do'" style="cursor: pointer;">
            전시감상하기
    </div><br>
    <div id="objet_guide" class="ui fluid gray button" onClick="location.href ='objetReport.do'" style="cursor: pointer;">
             전시감상 안내
    </div>
  </div>
</div>
<!-- //전시감상 모달 -->
<div class="btns" style="display:flex;justify-content:space-between;">
<div class="objet_vr_tag">
	<a href="" id="tag" class="ui basic gray circular button">#디자인</a>
    <a href="" id="tag" class="ui basic gray circular button">#사진</a>
    <a href="" id="tag" class="ui basic gray circular button">#기타</a>
</div>
<div class="objet_rev_btn">
	<a href="objetOne.do" id="objet_rev" class="ui basic large gray circular icon button">
	<i class="far fa-comment-dots "></i>&nbsp;감상평</a>
</div>
</div>
<br><br><br><br>
<div class="objet_artist_info">
<div class="objet_artist_info_top">
<div class="objet_txt">
	<span class="obj_name">코코 카피탄</span><br><span class="obj_info1">예술가</span><br>
	<span class="obj_info2">예술을 합니다.</span><br><br>
	<span class="obj_txt">구독자</span><span class="obj_txt">관심작가</span><br>
	<span class="obj_cnt">1,107</span><span class="obj_cnt">91</span>
</div>
<div class="objet_profile">
<img src="resources/images/objet/나의 오랜 연인에게2.jpg" class="profile_pic">
</div>
<a class="ui teal circular basic button" id="follow_btn" >구독하기</a>
</div><br><br>
<div class="artist_objet_more">
<h3 class="objet_title">MORE OBJET</h3>
<a href="objetAllList.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a>
<div class="objet_pic">
   <div class="objet_pic_main">
   <div class="swiper-container swiper2">
     <div class="swiper-wrapper wrapper2">
    <div class="swiper-slide slide2">
      <a href="${pageContext.servletContext.contextPath }/objetOne.do">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/exhibi1.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/exhibi5.jpg)"></div>
      <div class="info2"><span class="text2">To. 나의 오랜연인<br>
      <span class="artist2">by 이지은<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/display2.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div>
    </div>
  </div>
</div>
   <script type="text/javascript" src="resources/js/swiper.min.js"></script>
     <script type="text/javascript">
     var swiper = new Swiper('.swiper2', {
           slidesPerView: 4,
            spaceBetween: 0,
            slidesPerGroup: 1,
            loopFillGroupWithBlank: true,
         loop: true,
       });
     </script>
   </div>
</div>
</div>
</div>
<div class="vp_top">
<a href="#"><img src="resources/images/objet/top.png" style="width:60%; height:auto;"></a></div>
</section>
<c:import url="../footer.jsp" />
</body>
</html>










