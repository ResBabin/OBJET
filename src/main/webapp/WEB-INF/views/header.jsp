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
/* 메뉴아이콘 */
input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block;width:40px;height:30px;position:absolute;cursor:pointer;}
input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background:#000;transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:0;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} 
input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
input[id="menuicon"]:checked + label {z-index:3;}
input[id="menuicon"]:checked + label span {background:black;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
div[class="sidebar"] {width:189px;height:100%;background:#fff;position:fixed;top:0;left:-300px;z-index:2;transition:all .35s; border: 1px solid lightgray;}
input[id="menuicon"]:checked + label + div {left:0;}
/*헤더 */
header {
  weight: 100%;
  height: 10%;
  background-color: #fff;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: black;
} 

/* 사이트 짧은 소개글 */
.intro{
 text-align: center;
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
	
 	width:180px;
  height: 18%;
  color: black;
  background-color:#fff;
  }
 
  
  /* 사이드바 중 메뉴영역 박스 시작
    -홈, 전시, 작가, 고객센터 써있는 부분*/
  .sidebar2{
  position:fixed;
  list-style:none;
  height: 38%;
  width:185px;
  background-color:#fff;
  color: black;
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
  color: black;
}

#main-menu > li {
  position: relative;
  color:black;
  background-color:#fff;
}
#main-menu > li:hover{
background-color:#666666;
color:white;
}

#main-menu > li > a {
  font-size: 18px;
  color: black;
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 10px 36px; 
  text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
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
  padding: 10px 60px;
}

#sub-menu > li >  a {
  color: black;
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
/* border: 2px solid white; */
width: 170px;
height:60%;
}
.nickname{
/* border: 2px solid white; */
height:13%;
}
.follower{
/* border: 2px solid white; */
height:13%;
}
.following{
/* border: 2px solid white; */
height:13%;
}
.artistHome{
margin-top: 190px;
font-size: 18px;

}
.fd{
font-size: 18px;
}
.qna{
font-size: 18px;

}

/* detail 태그인 안에 세모 도형 색 바꿔서 안보이게 만들기 */
summary::-webkit-details-marker {
    color: #fff; 
} 
 .myinfo{
 	margin-top:10px;
 }
summary {
  cursor: pointer;
  font-size: 18px;
  color: black;
}
p{
font-size: 18px;
color: black;
}
.myinfo{

width: 189px;
height: 22%;
}


  /* 사이드바 안에 계정 찾기 */
.forget{
  font-size: 15px;
   /* border: 2px solid white; */
   margin-top: 680px;
  } 
  /* 더보기 */
  .more{
  margin-top: 70px;
   /* border: 2px solid red; */
  text-align: right;
  margin-right: 30px;
  margin-bottom:10px;
  }

  </style>
  
</head>
<body>
<header>
<div class="sitemain"><a href="main.do">
<img src="resources/images/objet_logo_black.png" width="65px" height="45px"></a></div> 
<!--메뉴 아이콘-->
<input type="checkbox" id="menuicon">

<label for="menuicon">
   <span></span>
   <span></span>
   <span></span>
   
</label>

<!--메뉴 아이콘-->
<!-- 비로그인시 메뉴 아이콘 열리는 사이드바 -->
<!-- <div class="sidebar">
<div class="sidebar1">
<button class="ui circular button">오브제 시작하기</button>
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
</div> -->
<!--로그인시 메뉴 아이콘 열리는 사이드바-->
<div class="sidebar">
<div class="sidebar1">
<div class="photo">
<i class="big user circle icon"></i>
</div>
<div class="nickname">닉네임</div>
<div class="follower">팔로워수</div>
<div class="following">팔로잉수</div>
</div>

<div class="artistHome"><a href="artistHomeMain.do">작가홈</a></div>
<div class= "myinfo">
<details>
  <summary>
    오브제 관리
  </summary>
  <p>전시관리</p>
  <p>전시등록</p>
  <p>관심오브제</p>
   <p>다녀온오브제</p>
</details> 
   </div>
   <div class="fd"><a href="#">피드알림</a></div>
   <div class="qna"><a href="#">문의내역</a></div>

<div class="sidebar2">
<nav role="navigation">
 <ul id="main-menu">
 
    <li><a href="#">홈</a></li>
     
    <li><a href="#">전시</a></li>
    
    <li><a href="#">작가</a></li>
    
    <li><a href="Movecs.do">고객센터</a>
      <ul id="sub-menu">
        <li><a href="#" aria-label="subemnu">FAQ</a></li>
        <li><a href="#" aria-label="subemnu">공지사항</a></li>
        </ul>
        </li>
        </ul>
        </nav>
</div>
</div>
</header>
</body>
</html>