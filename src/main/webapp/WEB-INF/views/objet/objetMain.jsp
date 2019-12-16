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
<!-- Link Swiper's CSS -->
 <link rel="stylesheet" href="resources/css/swiper.min.css">
 <style>
.swiper-container {
  height: calc(100vh - 410px);
  margin: 50px 50px 60px 50px; 
  vertical-align: middle;
  align:center;
  width: 93vw; 
}
.swiper-slide {
  overflow: hidden;
}
.slide-inner {
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  background-size:cover;
  background-position: center;
  vertical-align: middle;
  align:center;
}
.swiper-button-prev {
  background-image: url("resources/images/objet/prev_before.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}

.swiper-button-prev:hover {
	background-image: url("resources/images/objet/prev_after.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}
.swiper-button-next {
  background-image: url("resources/images/objet/next_before.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right: 0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
} 
.swiper-button-next:hover {
	background-image: url("resources/images/objet/next_after.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}
.swiper-pagination-bullet {
   width: 10px;
   height: 10px;
   opacity: 0.8;
   background: #fff;
}
.swiper-pagination-bullet-active {
  background: #707070;
} 

.info {
	display: inline-block;
	vertical-align: middle;
}

.text{
	font-family:'Nanum Myeongjo';
	nth-of-type(2) font-weight: 700; 
    font-size: 26pt;
	color: #fff;
	text-align: left;
	position: absolute;
	top: 25%;
	left: 24.5%;
	transform: translate( -50%, -50% );
	line-height:46px;
}
.date {
	font-family:'Nanum Myeongjo';
	nth-of-type(1) font-weight: 300; 
    font-size: 18pt;
	color: #fff;
	text-align: left;
	line-height:36px;
}
.objet_title{
	font-family: 'Nanum Myeongjo';
	nth-of-type(1) font-weight: 300; 
    font-size: 30pt;
    text-align: center;
}
.objet_subtitle{
	font-family:'Nanum Myeongjo';
	nth-of-type(1) font-weight: 300; 
    font-size: 12pt;
    text-align: center;
    color: gray;
}

.objet_info_top{
	margin-left:10%;
}

.objet_info{
	font-family:'Nanum Myeongjo';
	nth-of-type(2) font-weight: 400; 
    font-size: 30pt;
    color: black;
    line-height:52px;
}
.objet_info_part {
	font-family:'Nanum Myeongjo';
	nth-of-type(1) font-weight: 300; 
    font-size: 24pt;
    color: #cacaca;
    line-height:44px;
}
.more_btn {	
	float:right;
	color: #959595;
	font-size:16px;
	margin: -25px 50px 0px 0px;
}

.objet_exhibition {

}
</style>
</head>
<body><br>
<section class="objet_main">
<section class="objet_info_top">
<span class="objet_info">모든 것이 작품이 되는 공간, 오브제</span><br>
<span class="objet_info_part">오브제에 여러분의 전시를 열어주세요.</span><br>
<span class="objet_info_part">오브제는 모든 창작자들을 응원합니다.</span><br>
<span class="objet_info_part" style="color:#dedede;nth-of-type(1) font-weight:300;">지금 바로, 전시를 열고, 감상하세요!</span>
</section>
<div class="objet_banner">
<div class="swiper-container">
  <div class="swiper-wrapper">
    <div class="swiper-slide">
      <a href="${pageContext.servletContext.contextPath }/objetTest.do">
      <div class="slide-inner" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide">
      <div class="slide-inner" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
    <div class="swiper-slide">
      <div class="slide-inner" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
    <div class="swiper-slide">
      <div class="slide-inner" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
    <div class="swiper-slide">
      <div class="slide-inner" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
  </div>
  <div class="swiper-pagination swiper-pagination"></div>
  <div class="swiper-button-next swiper-button-white"></div>
  <div class="swiper-button-prev swiper-button-white"></div>
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
	        nextEl: ".swiper-button-next",
	        prevEl: ".swiper-button-prev"
	      },
	      pagination: {
	        el: '.swiper-pagination',
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

	    var swiper = new Swiper(".swiper-container", swiperOptions);
	  </script>
</div>
<!-- 전시 추천(더보기 리스트)  -->
<div class="objet_exhibition">
<h3 class="objet_title">OBJET EXHIBITION</h3>
<p class="objet_subtitle">오브제만의 특별한 전시</p>
<a href="objetMore.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a>
<br>
<div class='objet_pic'>
	
</div>
<!-- 작가 추천 (더보기 리스트) -->
<div class="objet_artist">
<h3 class="objet_title">OBJET ARTIST</h3>
<p class="objet_subtitle">오브제의 창작가들</p>
<a href="artistMore.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a>
<br>







</div>
<br><br><br><br><br><br>
</section>
<c:import url="../footer.jsp" />
</body>
</html>