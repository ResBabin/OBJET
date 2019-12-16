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
input[id="menuicon"]:checked + label span {background:#fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
div[class="sidebar"] {width:189px;height:100%;background:#222;position:fixed;top:0;left:-300px;z-index:2;transition:all .35s;}
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
  float: left;
  }
  .sitemain{
  float:left;
  margin-left: 60px;
  margin-top: -3px;
  }
 
  /* 사이드바 중 로그인 영역 */
  .sidebar1{
  margin-top: 60px;
  position:fixed;
  font-size: 17px;
border: 2px solid blue;
 width:189px;
  height: 18%;
  
  }
  /* 사이드바 중 메뉴영역2 */
  .accordion{
border: 2px solid blue;
margin-top:10px;
  
  }
  
  /* 사이드바 중 메뉴영역 박스 시작
    -홈, 전시, 작가, 고객센터 써있는 부분*/
  .sidebar2{
  position:fixed;
  list-style:none;
  height: 38%;
  width:185px;
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
  padding: 10px 60px;
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
border: 2px solid white;
margin-top: 190px;
font-size: 18px;

}
.fd{
border: 2px solid purple;
font-size: 18px;
}
.qna{
border: 2px solid green;
font-size: 18px;

}

/* detail 태그인 안에 세모 도형 색 바꿔서 안보이게 만들기 */
summary::-webkit-details-marker { 
    color:black; 
 
} 
 
summary {
  cursor: pointer;
  font-size: 18px;
}
p{
font-size: 18px;
}
.myinfo{
border: 2px solid white;
width: 189px;
height: 22%;
}
 /*로그아웃, 내정보수정  */
 .logout{
margin-top: 240px;
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

<!-- 검색 아이콘  -->
<i id="search-btn" class="material-icons">&#xe8b6;</i>
<!-- 검색창 시작 -->
<div id="search-overlay" class="block">
  <div class="centered">
    <div id='search-box'>
      <i id="close-btn" class="material-icons">&#xe5cd;</i>
      <form action='searchResult.do' id='search-form' method='get' target='_top' 
      class="ui wide fluid transparent icon input">
		  <input id='search-text' name="q" type="text" placeholder="검색어를 입력해주세요." />
		  <i class="material-icons" id="search-btn2" onClick="submit();">&#xe8b6;</i>
      </form>
      <!-- 오브제 추천 태그 -->
      <div class="search_suggest" align="center">
      	<p><span>오브제</span> 추천 태그</p>
      	<div class="search_tag">
      	<div class="ui circular basic blue button">사진</div> &nbsp;
      	<div class="ui circular basic blue button">디자인</div> &nbsp;
      	<div class="ui circular basic blue button">기타</div> <br>
      	</div>
      	<ul class="search_art_list">
      		<li class="search_art_list_1">
      		<a href="">
      		<img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게1.jpg"><br>
      		<strong>최강예은</strong>
      		<span>예술가입니다.</span>
      		</a>
      		</li>
      		<li class="search_art_list_1">
      		<a href="">
      		<img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg"><br>
      		<strong>안경민경</strong>
      		<span>예술가입니다.</span>
      		</a>
      		</li>
      		<li class="search_art_list_1">
      		<a href="">
      		<img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게5.jpg"><br>
      		<strong>유노유진</strong>
      		<span>예술가입니다.</span>
      		</a>
      		</li>
      		<li class="search_art_list_1">
      		<a href="">
      		<img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의 오랜 연인에게4.jpeg"><br>
      		<strong>시아은솔</strong>
      		<span>예술가입니다.</span>
      		</a>
      		</li>
      		<li class="search_art_list_1">
      		<a href="">
      		<img id="search_art_list_img" class="ui small circular image" src="resources/images/objet/나의오랜연인에게커버.jpg"><br>
      		<strong>믹키근수</strong>
      		<span>예술가입니다.</span>
      		</a>
      		</li>
      	</ul>
     </div>
     <!-- 오브제 검색 키워드 -->
     <div class="search_keyword">
     	<div class="objet_keyword"><!-- 오브제 전시 키워드 -->
     		<h3 class="keyword_title"><a>전시 검색
     		<i id="arrow" class="material-icons">&#xe5cc;</i></a></h3>
     		<div class="wrap_objet_list">
	     		<ul class="objet_list">
	     			<li class="objet_list_item"><span>오브제</span>를 말하다.</li>
	     			<li class="objet_list_item"><span>오브제</span>를 말하다.</li>
	     			<li class="objet_list_item"><span>오브제</span>를 말하다.</li>
	     			<li class="objet_list_item"><span>오브제</span>를 말하다.</li>
	     			<li class="objet_list_item"><span>오브제</span>를 말하다.</li>
	     		</ul>
	     		
     		</div>
     	</div>
     	<div class="artist_keyword"><!-- 오브제 작가 키워드 -->
     		<h3 class="keyword_title"><a>작가 검색
     		<i id="arrow" class="material-icons">&#xe5cc;</i></a></h3>
     		<div class="wrap_artist_list">
	     		<div class="artist_list">
	     			<div class="artist_list_item"><a href="">
	     			<img id="artist_list_img" class="ui mini circular image" src="resources/images/objet/나의 오랜 연인에게1.jpg">
	     			<span>오브제</span></a></div>
	     			<div class="artist_list_item"><a href="">
	     			<img id="artist_list_img" class="ui mini circular image" src="resources/images/objet/나의 오랜 연인에게2.jpg">
	     			<span>오브제</span></a></div>
	     			<div class="artist_list_item"><a href="">
	     			<img id="artist_list_img" class="ui mini circular image" src="resources/images/objet/나의오랜연인에게커버.jpg">
	     			<span>오브제</span></a></div>
	     		</div>
     		</div>
     	</div>
     </div>
    </div>
  </div>
</div>
<!-- 검색창 끝 -->

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
<div class="logout">
<div class="tiny ui buttons">
  <button class="ui inverted grey button" onclick="location.href='moveMyPageEdit.do'">내정보수정</button>
  <div class="or"></div>
  <button onclick="alert('로그아웃 되었습니다.');"class="ui inverted grey button">로그아웃</button>
 
</div>
</div>
</div>

 

<!-- <div class="sidebar">
<div class="sidebar1">
<div class="photo">
<i class="big user circle icon"></i>
</div>
<div class="nickname">닉네임</div>
<div class="follower">팔로워수</div>
<div class="following">팔로잉수</div>
</div>
<div class="artistHome"><a href="artistHomeMain.do">작가홈</a></div>
<div class="accordion">
<input type="checkbox" name="accordion" id="answer01">
	<label for="answer01"><a href="#">오브제관리</a><em></em></label>
	<div class="homelist">전시관리</div>
	<div class="homelist"><a href="#">전시등록</a></div>
	<div class="homelist"><a href="#">관심 오브제</a></div>
	<div class="homelist"><a href="#">다녀온 오브제</a></div></div>
</div>
<div class="fd">피드알림</div>
<div class="que">문의내역</div>
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

<div class="logout">
<div class="tiny ui buttons">
  <button class="ui inverted grey button" onclick="location.href='moveMyPageEdit.do'">내정보수정</button>
  <div class="or"></div>
  <button onclick="alert('로그아웃 되었습니다.');"class="ui inverted grey button">로그아웃</button>
 
</div>
</div>

메뉴 아이콘 열리는 사이드바 끝 -->
</header>
</body>
</html>