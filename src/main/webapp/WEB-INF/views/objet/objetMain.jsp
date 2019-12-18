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
.swiper1 {
  height: calc(100vh - 410px);
  margin: 50px 50px 60px 50px; 
  vertical-align: middle;
  align:center;
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
  background-size:cover;
  background-position: center;
  vertical-align: middle;
  align:center;
}
.swiper-button-prev1 {
  background-image: url("resources/images/objet/prev_before.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}

.swiper-button-prev1:hover {
	background-image: url("resources/images/objet/prev_after.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}
.swiper-button-next1 {
  background-image: url("resources/images/objet/next_before.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right: 0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
} 
.swiper-button-next1:hover {
	background-image: url("resources/images/objet/next_after.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
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

/* objet 전시 pic */
.objet_pic {
  margin: 40px 0 0 0;
  width: 100%; 
  overflow:hidden;
  height:400px;
}
.objet_pic_main {
  width: 100%; 
  height: 100%;
}
.swiper2 {
  width: 100%; 
  height: 100%;
  align:center; 
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
  background-size: cover ;
  background-position: center;
  align:center;
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
  background-image: url("resources/images/objet/prev_before.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}
.swiper-button-prev2:hover {
  background-image: url("resources/images/objet/prev_after.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
}
.swiper-button-next2 {
  background-image: url("resources/images/objet/next_before.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right: 0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
} 
.swiper-button-next2:hover {
  background-image: url("resources/images/objet/next_after.png") !important;
  background-size:contain;
  background-repeat: no-repeat;
  background-position: center center;
  right:0 !important;
  align:center;
  width:70px !important;
  height:70px !important; 
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
.text2{
	nth-of-type(2) font-weight: 400; 
    font-size: 26px;
	color: #fff;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
	align:center;
    padding-top: 12px;
    line-height: 36px;
    font-family: 'Nanum Myeongjo', sans-serif;
    letter-spacing: -.025em;
}
.artist2 {
	nth-of-type(1) font-weight: 300; 
    font-size: 14px;
	color: #fff;
	text-align: center;
	line-height:36px;
	padding-top: 30px;
    font-family: 'Noto Sans Light', sans-serif;
    opacity: .8;
}
/* artist pic */
.artist_pic {
  margin: 40px 0 0 0;
  width: 100%; 
  overflow:hidden;
  height:450px;
}
.artist_pic_main {
  width: 100%; 
  height: 100%;
}
.swiper3{
	width: 80%;
	height: 100%;
}
.slide3 {
	border: 1px solid lightgray;
	text-align: center;
	font-size: 14px;
	background: #fff;
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
	align: center;
	font-family: 'Nanum Myeongjo', sans-serif;
	font-weight: 300; 
	color: #959595;
	line-height: 36px;
} 
</style>
</head>
<body>
<c:import url="../search.jsp" /><br>
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
    <div class="swiper-slide slide1">
      <a href="${pageContext.servletContext.contextPath }/objetTest.do">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide1">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide1">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide1" >
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide1">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div>
    </div>
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
</div>
<!-- 전시 추천(더보기 리스트)  -->
<div class="objet_exhibition">
<h3 class="objet_title">OBJET EXHIBITION</h3>
<p class="objet_subtitle">오브제만의 특별한 전시</p>
<a href="objetMore.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a>
<div class="objet_pic">
	<div class="objet_pic_main">
	<div class="swiper-container swiper2">
  	<div class="swiper-wrapper wrapper2">
    <div class="swiper-slide slide2">
      <a href="${pageContext.servletContext.contextPath }/objetTest.do">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info2"><span class="text2">나의 오랜 연인에게<br>
      <span class="artist2">by 이지은<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2" >
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info2"><span class="text2">나의 오랜 연인에게<br> 
      <span class="artist2">by 이지은<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2" >
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info2"><span class="text2">나의 오랜 연인에게<br> 
      <span class="artist2">by 이지은<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2" >
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/나의오랜연인에게커버.jpg)"></div>
      <div class="info2"><span class="text2">나의 오랜 연인에게<br> 
      <span class="artist2">by 이지은<span></span><br></span></div>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div>
    </div>
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
</div><br><br>
<!-- 작가 추천 (더보기 리스트) -->
<div class="objet_artist">
<h3 class="objet_title">OBJET ARTIST</h3>
<p class="objet_subtitle">오브제의 창작가들</p>
<a href="artistMore.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a>
<div class="artist_pic">
<div class="artist_pic_main">
<div class="swiper-container swiper3">
    <div class="swiper-wrapper wrapper3">
      <div class="swiper-slide slide3">Slide 1</div>
      <div class="swiper-slide slide3">Slide 2</div>
      <div class="swiper-slide slide3">Slide 3</div>
      <div class="swiper-slide slide3">Slide 4</div>
      <div class="swiper-slide slide3">Slide 5</div>
      <div class="swiper-slide slide3">Slide 6</div>
      <div class="swiper-slide slide3">Slide 7</div>
      <div class="swiper-slide slide3">Slide 8</div>
      <div class="swiper-slide slide3">Slide 9</div>
      <div class="swiper-slide slide3">Slide 10</div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>
  <script type="text/javascript" src="resources/js/swiper.min.js"></script>
  <script type="text/javascript">
    var swiper = new Swiper('.swiper3', {
      slidesPerView: 3,
      spaceBetween: 60,
      loopFillGroupWithBlank: true,
      loop: true,
      navigation: {
        nextEl: ".swiper-button-next3",
        prevEl: ".swiper-button-prev3"
      },
      pagination: {
        el: '.swiper-pagination3',
        clickable: true,
      },
    });
  </script>
</div>
</div>
</div>
<br><br><br><br>
</section>
<c:import url="../footer.jsp" />
</body>
</html>














