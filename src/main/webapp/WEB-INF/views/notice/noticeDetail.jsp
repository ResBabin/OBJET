<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 자세히 보기</title>
<c:import url="../header.jsp" />
</head>
<style>
/* Notice View */
.noitcedetail{
 
}
.article_bottom{
background:#ff8149;
height:40px;
}
.notice-header {margin-bottom:10px; background:#fff5f0; border:1px solid #ddd ;width:100%;}
.notice-header:after {display:block; clear:both; content:''}
.notice-header .title-wrap {padding:20px 20px 10px 20px}
.notice-header .title-wrap .category-info a {color:#ff8149}
.notice-header .title-wrap .notice-title {margin-top:5px; font-size:2em; color:#111; line-height:1em}
.notice-header .info-wrap {margin-top:10px; padding:10px 20px; background:#ff8149}
.notice-header .info-wrap:after {display:block; clear:both; content:''}
.notice-header .info-wrap .notice-info {float:left; list-style:none}
.notice-header .info-wrap .notice-info:after {display:block; clear:both; content:''}
.notice-header .info-wrap .notice-info li {margin-right:15px; float:left; font-size:0.875em; color:#fff5f0}
.notice-header .info-wrap .notice-info li i {margin-right:4px; color:#fff}

</style>
<body>

        <!-- notice header -->
        <div class="noitcedetail">
        <div class="notice-header">
            <div class="title-wrap">
                <p class="category-info"><a href="/notice">분류[일반]</a></p>
                <h2 class="notice-title">당신만의 전시회를 열어보세요</h2>
            </div>
            <div class="info-wrap">
                <ul class="notice-info">
                
                    <li class="author"><i class="fa fa-user-circle"></i> admin01</li>
                    <li class="date"><i class="fa fa-clock-o"></i>2019-09-12</li>
                     
                </ul>
            </div>
        </div>
 
        <div class="article">
          <p>나만 소장할 수 있고 모두에게 전시할 수 있는<br>

단 하나의 전시회를 만든 다면 어떤 전시를 하고 싶을까요?<br>

평생 간직하고픈 추억의 글, 전하지 못한 사랑의 글, <br>

첫 작품을 시작할 무렵의 서투르고 투박하지만 <br>

그래서 소중한 내 작품. <br>

그런 작품들을 엮어 나에게 건네고 싶어 집니다. <br>

오직 나만을 위한 전시회일 테니까요</p>
<div class="article_bottom"></div>
        </div>
        </div>
        <!-- //notice view -->


<c:import url="../footer.jsp" />
</body>
</html>