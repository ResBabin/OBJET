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
<c:import url="header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//fonts.googleapis.com/earlyaccess/kopubbatang.css'>
<link rel="stylesheet" type="text/css" href="resources/assets/css/KoPubDotum.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
 <link rel="stylesheet" href="resources/css/swiper.min.css">
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
   font-family: 'Nanum Myeongjo'; nth-of-type (2) font-weight : 700;
   font-size: 26pt;
   color: #fff;
   text-align: left;
   position: absolute;
   top: 25%;
   left: 24.5%;
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
   margin-left: 13%;
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
   margin-bottom: 80px;
   margin-left: 40px;
   margin-right: 0px;
   position: relative;
   left:1%;
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
   /* box-shadow: 0px 0px 7px 3px gray;  */
   position: absolute;
   width: 100%;
   height: 100%;
   backface-visibility: hidden;
   background: white;
   text-align: center;
   border-radius: 10px;
}

.cardsection {
box-shadow: 0px 0px 13px 5px gray; 
   background: rgba(0, 0, 0, 0.05);
   height: 470px;
   width: 100%;
}

.writername {
   margin-top: 20px;
   color: black;
   font-size: 15px;
}

.writercoment {
   color: black;
   font-size: 14x;
}

.theback {
  /*  box-shadow: 0px 0px 9px 3px gray;  */
   position: absolute;
   width: 100%;
   height: 100%;
   backface-visibility: hidden;
   background: #fafafa;
   color: #555;
   text-align: center;
   font-family: 'zilla slab', sans-serif;
   border-radius: 10px;
   text-align: left;
   transform: rotateY(180deg);
}


.cardContent {
   font-size: 12px;
   padding: 8px;
}

.tagboxes {
   align: middle;
}

.tagbox1 {
   color: rgba(0, 0, 0, 0.8);
   margin-left: 17px;
   padding: 3px;
   margin-top: 70px;
   height: 30px;
   width: 25%;
   border: 1.8px solid rgba(0, 0, 0, 0.1);
   border-radius: 30px;
   float: left;
   font-size: 12px;
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
<c:import url="search.jsp" /><br>
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
      <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/exhibi7.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide1">
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/display2.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide1">
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/exhibi4.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide1" >
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/exhibi3.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide1">
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner1" style="background-image:url(resources/images/objet/exhibi13.jpg)"></div>
      <div class="info"><span class="text">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="date">2019.08.02 - 2019.12.12<span></span><br></span></div></a>
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
    <div class="swiper-slide slide2">
      <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/exhibi1.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide2">
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/exhibi5.jpg)"></div>
      <div class="info2"><span class="text2">To. 나의 오랜연인<br>
      <span class="artist2">by 이지은<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide2">
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/display2.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> 
      <span class="artist2">by 코코 카피탄<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide2" >
    <a href="${pageContext.servletContext.contextPath }/objetOne.do?objetno=${objet.objetno}">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/exhibi12.jpg)"></div>
      <br>
      <div class="info2"><span class="text2">To. 나의 오랜연인<br></span>
      <span class="artist2">by 이지은<span></span><br></span></div></a>
    </div>
    <div class="swiper-slide slide2">
      <div class="slide-inner inner2" style="background-image:url(resources/images/objet/objetmainposter.jpg)"></div>
      <div class="info2"><span class="text2">나는 코코 카피탄, <br> 오늘을 살아가는 너에게<br> </span>
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
</div><br><br><br>
<h3 class="objet_title">OBJET ARTIST</h3>
<p class="objet_subtitle">오브제의 창작가들</p><br>
<a href="artistAllList.do"><span class="more_btn">more 
<i class="material-icons" style="font-size:16px;vertical-align: middle;top:5px;">&#xe315;</i></span></a><br>
<section class="cardsection">
  <!-- 작가 카드 -->
  <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         
         <img id="cardimg" src="resources/images/main/artist1.jpg" width=35% height=25%>
            <div class ="writername">김쓰앵</div><br>
            <div class ="writercoment">전적으로 믿으셔야 합니다.</div>
   <div class="tagboxes">
   <div class="tagbox1">사진</div>
   <div class="tagbox2">조각</div>
   <div class="tagbox3">●●●</div> 
   </div>
         </div>
          <div class="theback">
            <div class="cardContent">
            
               <div>전시제목</div>
               <div>작가 전시에 대한 제목 or 설명글 짧게</div>
            <center>   <img src="resources/images/objet/display5.jpg" width=80%></center>
           
            </div>
            
         </div>   
      </div>
      </div>      

   </div>

   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         
         <img id="cardimg" src="resources/images/main/artist2.jpg" width=35% height=25%>
            <div class ="writername">닉네임</div><br>
            <div class ="writercoment">작가소개가 들어갑니다.</div>
   <div class="tagboxes">
   <div class="tagbox1">디자인</div>
   <div class="tagbox2">회화</div>
   <div class="tagbox3">조소</div> 
   </div>
         </div>
          <div class="theback">
            <div class="cardContent">
            
               <div>전시제목</div>
               <div>작가 전시에 대한 제목 or 설명글 짧게</div>
             <center> <img src="resources/images/objet/display5.jpg" width=80%></center>
             
            </div>
            
         </div>   
      </div>
      </div>      

   </div>

   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         
         <img id="cardimg" src="resources/images/main/artist4.jpg" width=35% height=25%>
            <div class ="writername">닉네임</div><br>
            <div class ="writercoment">작가소개가 들어갑니다.</div>
   <div class="tagboxes">
   <div class="tagbox1">디자인</div>
   <div class="tagbox2">회화</div>
   <div class="tagbox3">조소</div> 
   </div>
         </div>
         <div class="theback">
            <div class="cardContent">
            
               <div>전시제목</div>
               <div>작가 전시에 대한 제목 or 설명글 짧게</div>
             <center>  <img src="resources/images/objet/display1.jpg" width=80%></center>
              
            </div>
            
         </div>   
      </div>
      </div>      

   </div>

   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         
         <img id="cardimg" src="resources/images/main/artist5.jpg" width=35% height=25%>
            <div class ="writername">닉네임</div><br>
            <div class ="writercoment">작가소개가 들어갑니다.</div>
   <div class="tagboxes">
   <div class="tagbox1">디자인</div>
   <div class="tagbox2">회화</div>
   <div class="tagbox3">조소</div> 
   </div>
         </div>
         <div class="theback">
            <div class="cardContent">
            
               <div>전시제목</div>
               <div>작가 전시에 대한 제목 or 설명글 짧게</div>
             <center> <img src="resources/images/objet/display5.jpg" width=80%></center>
             
            </div>
            
         </div>   
      </div>
      </div>      

   </div>

   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         
         <img id="cardimg" src="resources/images/objet/artist3.jpg" width=35% height=25%>
            <div class ="writername">닉네임</div><br>
            <div class ="writercoment">작가소개가 들어갑니다.</div>
   <div class="tagboxes">
   <div class="tagbox1">디자인</div>
   <div class="tagbox2">회화</div>
   <div class="tagbox3">조소</div> 
   </div>
         </div>
         <div class="theback">
            <div class="cardContent">
            
               <div>전시제목</div>
               <div>작가 전시에 대한 제목 or 설명글 짧게</div>
               <center><img src="resources/images/objet/display5.jpg" width=80%></center>
              
            </div>
            
         </div>   
      </div>
      </div>      

   </div>

</section>
</section>

<c:import url="footer.jsp" />
</body>
</html>
