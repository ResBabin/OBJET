<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
margin-left: 25px;
}
.notice-list:hover{
background-color:;
}
.notice-list { margin:10px 0;  padding:24px 20px 26px; background:#fff; border:1px solid #ff8149}
.notice-list:after { content:''; clear:both; display:block }
.notice-list .notice-item {text-decoration:none}
.notice-list .notice-item:hover .title {color:#ff8149}
.notice-list .notice-item .thumb {float:left; width:150px; height:150px; margin:6px 30px 5px 0}
.notice-list .notice-item .title {font-weight:normal;font-size:1.375em}
.notice-list .notice-item .writer {margin-top:4px; color:#7e7e7e; vertical-align:top; font:normal 0.875em 'NanumBarunGothic','Noto Sans', sans-serif; line-height:1.5em;}
.notice-list .info {margin-top:6px; font-size:0.875em; color:#ff8149;}
/* .notice-list .info a {color:#ff8149;} */
.notice-list .info .pipe {display:inline-block; margin:0 10px; color:#dfdfdf}
.notice-list .info .date {color:#999}
</style>
<body>

<!-- 공지사항 -->
<div class="noticestart">
<h1 class="noticehead">공지사항</h1>
</div>
     <div class="noticelist">
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
        </div>
       <section>
       
       </section>

<c:import url="../footer.jsp" />
</body>
</html>