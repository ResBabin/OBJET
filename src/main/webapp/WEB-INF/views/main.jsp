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
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/main.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/search.css">
<style type="text/css">
h1, h2, h3, h4, h5, p, span, strong, a, b{
	color: black;
	font-family: 'Nanum Gothic';
}
/* 섹션 */
section:after {
  content: "";
  display: table;
  clear: both;
 
}

* {box-sizing: border-box}/* 이거 없으면 이미지 안에 사진들 아래로 쭉 펼쳐짐 */
body {font-family: 'Nanum Myeongjo'; margin:0;padding:0;background-color: #fff;color:black;}
.mySlides {
     margin-top: 15px;
     display: none;
     text-align:center;
     /* border:2px solid red; */
}

.main{
margin-top: 100px;
}

img {vertical-align: middle;}
/* 이미지 슬라이더 안에 숫자카운트 */
/* .numbertext {
  margin-top: 200px;
  margin-left : 60px;
  color: Lightblue;
  font-size: 20px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}  */

/* 이미지 슬라이더 밑에 동그라미 도형도형들 들어가는 공간 */
.dotbox{
   margin-top:15px;
/*  border: 2px solid blue; */

}

/* 이미지 슬라이더 밑에 동그라미 하나의 도형 */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}



  /* 작가 카드*/
  .container1{
   /* border: 2px solid red; */
  float: left;
  margin-bottom:80px;
  margin-left: 28px;
  margin-right:20px;
  position: relative;
  }
 
  .container{
            float: left;
         position: relative;
         width: 250px;
         height: 350px;
         
      }
      .container:hover > .thecard {
         transform: rotateY(180deg);
         cursor: pointer;
      }
      .thecard{
         position: absolute;
         width: 100%;
         height: 100%;
         transform-style: preserve-3d;
         transition: all 0.5s ease;
      }
   
      .thefront{
         position: absolute;
         width: 100%;
         height: 100%;
         backface-visibility: hidden;
         background: black;
         color: white;
         text-align: center;
         /* font-family: 'zilla slab', sans-serif; */
         border-radius: 10px;
         font-size: 20px;
         font-weight: bold;
      }
      .thefront p {
         font-size: 65px;
         line-height: 65px;
      }
      
      .theback{
         position: absolute;
         width: 100%;
         height: 100%;
         backface-visibility: hidden;
         background: #fafafa;
         color: #555;
         text-align: center;
         /* font-family: 'zilla slab', sans-serif; */
         border-radius: 10px;
         text-align: left;
         transform: rotateY(180deg);
      }

      .cardContent{
         font-size: 12px;
         padding: 8px;
      }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script type="text/javascript">
    window.onload=function() {   
   

   var slideIndex = 0;
   showSlides();

   function showSlides() {
       var i;
       var slides = document.getElementsByClassName("mySlides");
       var dots = document.getElementsByClassName("dot");
       for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";  
       }
       slideIndex++;
       if (slideIndex > slides.length) {slideIndex = 1}    
       for (i = 0; i < dots.length; i++) {
           dots[i].className = dots[i].className.replace(" active", "");
       }
       slides[slideIndex-1].style.display = "block";  
       dots[slideIndex-1].className += " active";
       setTimeout(showSlides, 2500); 
   }
   }
      
   
</script>
</head>
<body>
<c:import url="search.jsp" />
<section class="main">
<div class="intro">
<h1>모든 사물들이 영감이 되는 순간, 오브제</h1>
<h2>전시회에 담을 아름다운 순간들을 기록해 보세요</h2>
<h2>그리고 꺼내보세요 </h2>
<h3>서랍 속 간직하고 있는 당신의 감성을</h3>

</div>
<div class="slideshow-container1">
  <div class="slideshow-container">
  
  <div class="mySlides fade">
  <div class="numbertext">1 / 5</div>
  <img src="resources/images/main/main1.jpg" style="width:1400px; height:450px;">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
  <img src="resources/images/main/main2.jpg" style="width:1400px; height:450px;">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="resources/images/main/main6.jpg" style="width:1400px; height:450px;">
  </div>
  <div class="mySlides fade">
<div class="numbertext">4 / 5</div>
  <img src="resources/images/main/sample2.jpg" style="width:1400px; height:450px;">
  </div>
  <div class="mySlides fade">
 <div class="numbertext">5 / 5</div>
  <img src="resources/images/main/sample4.jpg" style="width:1400px; height:450px;">
  </div>
</div>

<div class = "dotbox" style="text-align:center">

  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 

</div>
 </div>
  
<div class="more">더보기</div>

  <!-- 작가 카드 -->
  <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         <img src="resources/images/main/YU.jpg" width=50%>
            <p><i class="fas fa-user-circle"></i></p>
            <div class ="writer name">유노유진</div><br>
            <div class ="writer coment">작가 한줄 소개</div>
            
         </div>
         <div class="theback">
            <div class="cardContent">
               <h3>전시제목</h3>
               <center><p>
                  작가 전시에 대한 제목 or 설명글 짧게
               </p>
               <img src="resources/images/main/sample6.jpg" width=80%>
               </center>
            </div>
            
         </div>   
      </div>
      </div>      

   </div>

   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         <img src="resources/images/main/KS.jpg" width=50%>
            <p><i class="fas fa-user-circle"></i></p>
            <div class ="writer name">믹키근수</div><br>
            <div class ="writer coment">작가 한줄 소개</div>
            
         </div>
         <div class="theback">
            <div class="cardContent">
               <h3>전시제목</h3>
               <center><p>
                  작가 전시에 대한 제목 or 설명글 짧게
               </p>
               <img src="resources/images/main/sample1.jpg" width=80%>
               </center>
            </div>
            
         </div>   
      </div>
      </div>      

   </div>
   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         <img src="resources/images/main/YY.jpg" width=50%>
            <p><i class="fas fa-user-circle"></i></p>
            <div class ="writer name">최강예은</div><br>
            <div class ="writer coment">작가 한줄 소개</div>
            
         </div>
         <div class="theback">
            <div class="cardContent">
               <h3>전시제목</h3>
               <center><p>
                  작가 전시에 대한 제목 or 설명글 짧게
               </p>
               <img src="resources/images/main/sample2.jpg" width=80%>
               </center>
            </div>
            
         </div>   
      </div>
      </div>      

   </div>
   <div class="container1">
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         <img src="resources/images/main/MY.jpg" width=50%>
            <p><i class="fas fa-user-circle"></i></p>
            <div class ="writer name">안경민경</div><br>
            <div class ="writer coment">작가 한줄 소개</div>
            
         </div>
         <div class="theback">
            <div class="cardContent">
               <h3>전시제목</h3>
               <center><p>
                  작가 전시에 대한 제목 or 설명글 짧게
               </p>
               <img src="resources/images/main/sample4.jpg" width=80%></center>
               </div>
            
         </div>   
      </div>
      </div>      

   </div>
   <div class="container1">
   
     <div class="container">

      <div class="thecard">
         <div class="thefront"><br>
         <img src="resources/images/main/ES.jpg" width=50%>
            <p><i class="fas fa-user-circle"></i></p>
            <div class ="writer name">시야은솔</div><br>
            <div class ="writer coment">작가 한줄 소개</div>
         </div>
         
         <div class="theback">
            <div class="cardContent">
               <h3>전시제목</h3>
               <center><p>
                  작가 전시에 대한 제목 or 설명글 짧게
               </p>
               <img src="resources/images/main/sample5.jpg" width=80%></center>
         </div>   
      </div>
      </div>      
</div>

   </section>
<c:import url="footer.jsp" />
</body>


</html>