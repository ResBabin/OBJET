<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Objet</title>
<!-- 시맨틱유아이 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<link rel = "stylesheet" type="text/css" href="/objet/resources/css/main.css">
<style type="text/css">
input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block;width:40px;height:30px;position:absolute;cursor:pointer;}
input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background:#000;transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:0;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} 
input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
input[id="menuicon"]:checked + label {z-index:3;}
input[id="menuicon"]:checked + label span {background:#fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
div[class="sidebar"] {width:189px;height:100%;background:#222;position:fixed;top:0;left:-300px;z-index:2;transition:all .35s;}
input[id="menuicon"]:checked + label + div {left:0;}

* {margin:0; padding:0;}
.accordion {position:absolute;top:30%;left:50%;transform:translateX(-50%);width:100px;}
input[id*="answer"] {display:none;}
input[id*="answer"] + label {display:block;border-bottom:0;color:#fff;font-weight:90;cursor:pointer;position:relative;font-size:18px;}
input[id*="answer"] + label em {position:absolute;top:50%;right:10px;width:30px;height:30px;margin-top:-15px;display:inline-block;}
input[id*="answer"] + label + div {max-height:0;transition: all .35s;overflow:hidden;/* background:#ebf8ff; */font-size:15px;}
input[id*="answer"] + label + div p {display:inline-block;padding:20px;}
input[id*="answer"]:checked + label + div {max-height:100px;}
input[id*="answer"]:checked + label em {background-position:0 -30px;}
* {
  box-sizing: border-box;
}

body {
 /*  font-family: ""; */
  /*  font-family: ""; */
   /*  font-family: ""; */
}

/*헤더 */
header {
 
  weight: 100%;
  height: 10%;
  background-color: #666;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

sidebar{
}

/* 섹션 */
section:after {
  content: "";
  display: table;
  clear: both;
}

/* 푸터*/
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
  heigt: 500px;
}

* {box-sizing: border-box}/* 이거 없으면 이미지 안에 사진들 아래로 쭉 펼쳐짐 */
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {
     display: none;
     text-align:center;
     border:2px solid red;
}
img {vertical-align: middle;}
/* 이미지 슬라이더 안에 숫자카운트 */
.numbertext {
  margin-top: 260px;
  margin-left : 260px;
  color: Lightblue;
  font-size: 20px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
} 


/* 사이트 짧은 소개글 */
.intro{
 text-align: center;
}
/* 이미지 슬라이더 밑에 동그라미 도형도형들 들어가는 공간 */
.dotbox{
 border: 2px solid blue;

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


/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
  }
  
  /* 사이트 로고 */
  .meueicon1{
  
  float: left;}
  .sitemain{
  float:left;
  margin-left: 60px;
  margin-top: 7px;
  }
 
  /* 사이드바 중 로그인 영역 */
  .sidebar1{
  margin-top: 60px;
  position:fixed;
  font-size: 17px;
  border: 2px solid blue;
 width:180px;
  height: 25%;
  
  }
  /* 사이드바 중 메뉴영역2 */
  .accordion{
   margin-top: 25px;
  border: 2px solid blue;
  
  }
  
  /* 사이드바 중 메뉴영역 박스 시작
    -홈, 전시, 작가, 고객센터 써있는 부분
  */
  .sidebar2{
   margin-top: 380px;
  position:fixed;
  list-style:none;
  border: 2px solid yellow;
  height: 38%;
  width:175px;
  
  
  }
nav {
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;

}

ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
}

#main-menu > li {
  position: relative;
}
#main-menu > li:hover{
background-color:#666666;
}

#main-menu > li > a {
  font-size: 18px;
  color: rgba(255,255,255,0.85);
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 10px 36px; 
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

#main-menu > li:nth-child(1) > a {
  border-left: 1px solid rgba(0,0,0,0.15);
}
/* 고객센터 하위메뉴 */
#sub-menu {
font-size: 16px;
  position: absolute;
 /*  background: #182952; */
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
}

#sub-menu > li {
  padding: 11px 39px;
  border-bottom: 1px solid rgba(0,0,0,0.15);
}

#sub-menu > li >  a {
  color: rgba(255,255,255,0.6);
  text-decoration: none;
}

#main-menu > li:hover #sub-menu {
  opacity: 1;
  visibility: visible;
}

#sub-menu > li >  a:hover {
 color: #666666;
}
.photo{
border: 2px solid white;
width: 170px;
height:60%;
}
.nickname{
border: 2px solid white;
height:13%;
}
.follower{
border: 2px solid white;
height:13%;
}
.following{
border: 2px solid white;
height:13%;
}
 /*로그아웃, 내정보수정  */
 .logout{
 
   border: 2px solid white;
   margin-top: 680px;
 }
 #ui inverted grey button{
 
 }
  /* 사이드바 안에 계정 찾기 */
.forget{
  font-size: 15px;
   border: 2px solid white;
   margin-top: 680px;
  } 
  /* 더보기 */
  .more{
  margin-top: 70px;
   border: 2px solid red;
 
  text-align: right;
  margin-right: 30px;
  margin-bottom:10px;
  }
 
  /* 상단바 아코디언 메뉴들 */
  .homelist{
  
  margin-top: 10px;
  }
  

 
  /* 작가 카드*/
  .container1{
   border: 2px solid red;
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
	/* 
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
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
	} */
	
	
	
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
 <!--헤더시작-->
<header>
<div class="sitemain"> 오브제</div> 
<!--메뉴 아이콘-->
<input type="checkbox" id="menuicon">

<label for="menuicon">
	<span></span>
	<span></span>
	<span></span>
	
</label>
<!--메뉴 아이콘-->
<!-- 비로그인시 메뉴 아이콘 열리는 사이드바 -->
<div class="sidebar">
<div class="sidebar1">
<button class="ui circular button" onclick="location.href='moveLogin.do'">오브제 시작하기</button>
</div>
<div class="sidebar2">
<nav role="navigation">
 <ul id="main-menu">
 
    <li><a href="#">홈</a></li>
     
    <li><a href="#">전시</a></li>
    
    <li><a href="#">작가</a></li>
    
    <li><a href="#">고객센터</a>
      <ul id="sub-menu">
        <li><a href="#" aria-label="subemnu">FAQ</a></li>
        <li><a href="#" aria-label="subemnu">공지사항</a></li>
        </ul>
        </li>
        </ul>
        </nav>
</div>
<div class="forget">
계정을 잃어버리셨습니까?
</div>
</div>
</div>
<!--로그인시 메뉴 아이콘 열리는 사이드바-->
<!-- <div class="sidebar">
<div class="sidebar1">
<div class="photo">
<i class="big user circle icon"></i>
</div>
<div class="nickname">닉네임</div>
<div class="follower">팔로워수</div>
<div class="following">팔로잉수</div>
</div>
<div class="accordion">
<input type="checkbox" name="accordion" id="answer01">
	<label for="answer01">오브제<em></em></label>
	<div class="homelist"><a href="#">작가홈</a>
	<div class="homelist"><a href="#">오브제관리</a></div>
	<div class="homelist"><a href="#">피드알림</a></div>
	<div class="homelist"><a href="#">문의내역</a></div></div>
</div>
<div class="sidebar2">
<nav role="navigation">
 <ul id="main-menu">
 
    <li><a href="#">홈</a></li>
     
    <li><a href="#">전시</a></li>
    
    <li><a href="#">작가</a></li>
    
    <li><a href="#">고객센터</a>
      <ul id="sub-menu">
        <li><a href="#" aria-label="subemnu">FAQ</a></li>
        <li><a href="#" aria-label="subemnu">공지사항</a></li>
        </ul>
        </li>
        </ul>
        </nav>
</div>
<div class="logout">
<div class="tiny ui buttons">
  <button class="ui inverted grey button">내정보수정</button>
  <div class="or"></div>
  <button onclick="alert('로그아웃 되었습니다.');"class="ui inverted grey button">로그아웃</button>
 
</div>
</div>
</div>--> 
<!--메뉴 아이콘 열리는 사이드바 끝-->

</header>

<section>
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
  <img src="resources/images/main1.jpg" style="width:990px; height:320px;">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
  <img src="resources/images/main2.jpg" style="width:990px; height:320px;">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="resources/images/main6.jpg" style="width:990px; height:320px;">
  </div>
  <div class="mySlides fade">
<div class="numbertext">4 / 5</div>
  <img src="resources/images/sample2.jpg" style="width:990px; height:320px;">
  </div>
  <div class="mySlides fade">
 <div class="numbertext">5 / 5</div>
  <img src="resources/images/sample4.jpg" style="width:990px; height:320px;">
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
			<img src="resources/images/YU.jpg" width=50%>
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
					<img src="resources/images/sample6.jpg" width=80%>
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
			<img src="resources/images/KS.jpg" width=50%>
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
					<img src="resources/images/sample6.jpg" width=80%>
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
			<img src="resources/images/YY.jpg" width=50%>
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
					<img src="resources/images/sample6.jpg" width=80%>
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
			<img src="resources/images/MY.jpg" width=50%>
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
					<img src="resources/images/sample6.jpg" width=80%></center>
					</div>
				
			</div>	
		</div>
		</div>		

	</div>
	<div class="container1">
	
  	<div class="container">

		<div class="thecard">
			<div class="thefront"><br>
			<img src="resources/images/ES.jpg" width=50%>
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
					<img src="resources/images/sample6.jpg" width=80%></center>
			</div>	
		</div>
		</div>		
</div>

	</section>
	 <footer>
  <p>사이트 소개</p>
  <p>고객센터</p>
  </footer>
</body>


</html>