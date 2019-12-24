<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:import url="../header.jsp" />
</head>
<style>



/* 공지사항 */

/* 공지사항 타이틀 */
.noticestart{
margin-top:5px;
margin-left: 25px;
}
.noticehead{
font-size: 40px;
}
/* Notice list */
.noticelist{
margin-top: 70px;
margin-left: 90px;
}
.notice-list:hover{
background-color:;
}
.notice-list {width: 2000px;margin:10px 0;  padding:24px 20px 26px;   background:rgba(0, 0, 0, 0.00);  }
.notice-list:after { content:''; clear:both; display:block }
.notice-list .notice-item {text-decoration:none}
/* .notice-list:hover{ background:black;} */
.notice-list .notice-item:hover .title {color:white} 
.notice-list .notice-item .thumb {float:left; width:150px; height:150px; margin:6px 30px 5px 0}
.notice-list .notice-item .title {font-weight:bold;font-size:1.375em; color:black;}
.notice-list .notice-item .writer {margin-top:4px; color:black; vertical-align:top; font:normal 0.875em 'NanumBarunGothic','Noto Sans', sans-serif; line-height:1.5em;}
.notice-list .info {margin-top:6px; font-size:0.875em; color:black;}

.notice-list .info .pipe {display:inline-block; margin:0 10px; color:black}
.notice-list .info .date {color:black}

        
* {padding: 0; margin: 0;}
/* body {background: #1a237e;} */
.box-wrap {
/* margin-bottom: 20px; */
margin-top: 30px;
margin-left: 30px;
   box-shadow: 8px 8px 13px 5px rgba(0,0,0,0.3);
  width: 95%;
    height: 150px;
    /* display: flex; */
    justify-content: center;
    align-items: center
}
.box {
    position: relative;

    /* overflow: hidden; */
}

 .box:hover {
 width: 100%;
    background:black;
} 
.box:before, .box:after {

    content:'';
    background: #fff;
    position: absolute;
    left: 50%; top: 50%;
    opacity: 0;
    z-index: 1;
    transform: translate(-50%, -50%);
    transition: all 0.4s ease;
}
.box:before {
    width: 60px; height: 1px; left: 100%;
}
.box:after {
    width: 1px; height: 60px; top: 0%;
}
.box:hover:before, 
.box:hover:after {

    opacity: 1;
    left: 50%; top: 50%;
}
       
        
</style>
<body>
<c:import url="../search.jsp" />

<div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">공지사항 제목</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> 분류[일반]
                <span class="pipe">|</span>
                <span class="date">12월14일</span>
            </p>
        </div>
            <a href="#"></a>
        </div>
    </div>

<div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">공지사항 제목</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> 분류[일반]
                <span class="pipe">|</span>
                <span class="date">12월14일</span>
            </p>
        </div>
            <a href="#"></a>
        </div>
    </div>

<div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">공지사항 제목</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> 분류[일반]
                <span class="pipe">|</span>
                <span class="date">12월14일</span>
            </p>
        </div>
            <a href="#"></a>
        </div>
    </div>

       <div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">공지사항 제목</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> 분류[일반]
                <span class="pipe">|</span>
                <span class="date">12월14일</span>
            </p>
        </div>
            <a href="#"></a>
        </div>
    </div>
        
       <div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">공지사항 제목</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> 분류[일반]
                <span class="pipe">|</span>
                <span class="date">12월14일</span>
            </p>
        </div>
            <a href="#"></a>
        </div>
    </div>
       
       
      <div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="#" class="notice-item">
                <h1 class="title">공지사항 제목</h1>
                <p class="writer">admin01 </p>
            </a>
            <p class="info"> 분류[일반]
                <span class="pipe">|</span>
                <span class="date">12월14일</span>
            </p>
        </div>
            <a href="#"></a>
        </div>
    </div>
<c:import url="../footer.jsp" />
</body>
</html>