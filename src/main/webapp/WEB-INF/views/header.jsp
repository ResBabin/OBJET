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
div[class="sidebar"] {width:220px;height:100%;background:#fff;position:fixed;top:0;left:-300px;z-index:2;transition:all .35s; border: 1px solid lightgray;}
input[id="menuicon"]:checked + label + div {left:0;}
/*헤더 */
header {
  weight: 100%;
  height: 10%;
  background-color: transparent;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: black;
  transition: top 0.2s ease-in-out;
  z-index: 10;

} 

/* 사이트 짧은 소개글 */
.intro{
 margin-bottom: 50px;
 text-align: center;
}
  /* 사이트 로고 */
  .meueicon1{
  float: left;
  }
 
.sitemain{
  float:left;
  margin-left: 60px;
  margin-top: -7px;
  }
 
 /* 사이드바 중 로그인 영역 */
  .sidebar1{
  
   background:rgba(0, 0, 0, 0.03);
letter-spacing: 2px;
  position:fixed;
  font-size: 17px;
 width:220px;
 height: 25%;
  color: black;
 
  }
 
 /* 사이드바 중 메뉴영역 박스 시작
    -홈, 전시, 작가, 고객센터 써있는 부분*/
  .sidebar2{
  
  margin-top: -35px;
 letter-spacing: 4px;
  position:fixed;
  list-style:none;
  height: 35%;
  width:220px;
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
 
  padding: 0;
  list-style: none;
}


/*  #main-menu > li:hover{
color:#666666;
}  */ 

#main-menu > li > a {
/*홈 전시 작가  */
margin-top: -60px;
  margin-left: 10px;
  font-size: 17px;
  color: black;
  text-align: center;
  text-decoration: none;
  display: block;
  padding: 40px 19px; 
 
}

/* 고객센터 하위메뉴 */
#sub-menu {
 margin-top: -23px;
 letter-spacing: 4px;
  width: 220px;
  font-size: 15px;
  position: absolute;
  opacity: 0;
  visibility: hidden;
  transition: all 0.15s ease-in;
}

#sub-menu > li {
 margin-top: -20px;
padding: 19px 15px; 
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
text-align: center;
width: 220px;
margin-top: 50px;
/* border: 2px solid navy; */
height:50%;
}

.profilePic{
   vertical-align: middle;
   width: 60px;
   height: 60px;
   margin-left:39%;
   margin-top:-20px;
   background-color: #fff;
   border-radius: 50%;
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
}

.nickname{
margin-top: -50px;
text-align: center;
width: 220px;
/* border: 2px solid red; */
height:13%;
font-weight: 600;
}

.userid{
margin-top: -5px;
font-size: 10pt; 
color:#aaa;"
}

.follower{
width: 220px;
text-align: center;
/* border: 2px solid green; */
height:13%;
font-weight: 400; 
font-size: 11pt;
padding-left:8px;
margin-top: 10px;
}
.following{

width: 220px;
/* border: 2px solid yellow; */
height:13%;
text-align: left;
font-weight: 400; 
font-size: 11pt;
padding-left:30%;
margin-top: -5px;
}
.artistHome{
letter-spacing: 3px;
font-size: 17px;
width: 220px;
/* border: 2px solid yellow; */
margin-top: 200px;
}

.fd{
margin-bottom: 7px;
margin-top: 6px;
width: 220px;
/* border: 2px solid yellow; */
letter-spacing: 3px;
font-size: 17px;
}
.qna{
width: 220px;
/* border: 2px solid black; */
letter-spacing: 3px;
font-size: 17px;
}

#accordian1 {
    margin-bottom: 5px;
    margin-top:-35px;
   background: #fff;
   width: 220px;
   color: black;
}

/* 메뉴 스타일 */
.accordian1 {
    letter-spacing: 3px;
    font-size: 17px;
   cursor: pointer;
   background: #fff;
}

#accordian1 li {
   list-style-type: none;
}

/* 서브메뉴 스타일 */
#accordian1 ul ul li a {
   color: black;
   text-decoration: none;
   letter-spacing: 3px;
    font-size: 17px;
   display: block;
   padding: 8px;
   transition: all 0.15s;
}
/* active 클래스 외에 것은 보이지 않게 하기 */
#accordian1 ul ul {
   display: none;
}
#accordian1 li.active ul {
   display: block;
}
.sidebar3{
  height: 30%;
 background:rgba(0, 0, 0, 0.03);

}
.bloginwrite{/* 비로그인시 박스안에 들어갈 글 */
margin-top: 10px;
font-size: 14px;
font-family: Courier New;
font-style: oblique;
}
#blogo{/* 비로그인시 안에 들어가는 아이콘 */
margin-top: 50px;
border-radius:50%;
}

.sidebar4{
margin-top: 40px;
letter-spacing: 4px;
font-size: 17px;
}
a{
color: black;
}
/* 사이드바 안에 계정 찾기 */
.forget{

width: 190px;
 border-bottom: 1.1px solid black;
  letter-spacing: 3px;
  font-size: 13px;
  margin-left: 15px;
  margin-top: 230px;
  } 
  /* 사이드 바 안에 로그아웃 내 정보 수정 */
  .logout{
  
  font-size: 16px;
  margin-left: 10px;
  margin-top: 50px;
  } 
  /* 더보기 */
  .more{
  margin-top: 70px;
   /* border: 2px solid red; */
  text-align: right;
  margin-right: 30px;
  margin-bottom:10px;
  }
  #startbutton{
  margin-top: 27px;
  }
  
 </style>
  
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script type="text/javascript">
   
   $(function(){
      $(".accordian1").click(function(){
         $("#accordian1 ul ul").slideUp();
         if(!$(this).next().is(":visible"))
         {
            $(this).next().slideDown();
         }
      })
   })
   </script>
</head>
<body>
<header>
<div class="sitemain"><a href="main.do">
<img src="resources/images/objet_logo_black.png" width="70px" height="50px"></a></div> 
<!--메뉴 아이콘-->
<input type="checkbox" id="menuicon">
<label for="menuicon">
   <span></span>
   <span></span>
   <span></span>
</label>
<!--메뉴 아이콘 끝-->
<!-- 비로그인시 메뉴 아이콘 열리는 사이드바 -->

 <c:if test="${sessionScope.loginUser==null}">
<div class="sidebar">
<div class="sidebar3">
<img id="blogo" src="resources/images/basicprofilepic.png" width="60px" height="60px">
<div class="bloginwrite">The moment everything becomes an inspiration</div>
<button class="tiny ui black basic circular button" id= "startbutton" onclick="location.href='moveLogin.do'">오브제 시작하기</button>
</div>
<div class="sidebar4">
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
<div class="forget" onclick="location.href='moveLogin.do'">
계정을 잃어버리셨습니까?
</div>
</div> 
</c:if>

 <c:if test="${sessionScope.loginUser!=null}">
<!--로그인시 메뉴 아이콘 열리는 사이드바-->
<div class="sidebar">
<div class="sidebar1">
<div class="photo">
<c:if test="${loginUser.userrpic==null }">
<div class="profilePic" style="background-image:url('resources/images/basicprofilepic.png') "></div>
</c:if>
<c:if test="${loginUser.userrpic!=null }">
<div class="profilePic" style="background-image:url('resources/users_upfiles/${loginUser.userrpic}') "></div>
</c:if>
</div>
<br>
<div class="nickname">${sessionScope.loginUser.nickname }</div>
<div class="userid">@${sessionScope.loginUser.userid }</div>
<div class="follower">팔로워&emsp;<span style="font-weight: 800;">123</span></div>
<div class="following">팔로잉&emsp;<span style="font-weight: 800;">45</span></div>
</div>
<div class="artistHome"><p onclick="location.href='artistHomeMain.do'">작가홈</p></div>
<div id="accordian1">
   <ul>
      <li>
         <span class="accordian1">오브제관리</span>
         <ul>
            <li><a href="moveMyObjetList.do">내 오브제</a></li>
            <li><a href="moveCreateObjet.do">오브제 등록</a></li>
            <li><a href="moveMyLikeObjetList.do">관심오브제</a></li>
            <li><a href="moveMyVisitedObjetList.do">다녀온오브제</a></li>
         </ul>
      </li>
      
      <li><div class="fd"><p onclick="location.href='moveFeedList.do'">피드알림</p></div></li>
      <li><div class="qna"><p onclick="location.href='moveMyQnaList.do'">문의내역</p></div></li>
   </ul>
</div>

<div class="sidebar2">
<nav role="navigation">
 <ul id="main-menu">
 
    <li><a href="main.do">홈</a></li>
     
    <li><a href="objetMain.do">전시</a></li>
    
    <li><a href="#">작가</a></li>
    
    <li><a href="moveCs.do">고객센터</a>
      <ul id="sub-menu">
        <li><a href="moveFaqMain.do" aria-label="subemnu">FAQ</a></li>
        <li><a href="moveNotice.do" aria-label="subemnu">공지사항</a></li>
        </ul>
        </li>
        </ul>
        </nav>
        <div class= "logout">
        <div class="small ui buttons">
  <button class="ui black basic button" onclick="location.href='moveMyPageEdit.do">내 정보 수정</button>
  <button class="ui black basic button" onclick="location.href='logout.do'">로그아웃</button>
</div>
</div>
</div>
</div>
</c:if>
</header>
</body>
</html>