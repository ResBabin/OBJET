<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../header.jsp" />
</head>
<style>

 a:visited { color:white; text-decoration: none;}


/* 공지사항 */

/* 공지사항 타이틀 */
 #search {color: #fff; text-decoration: none; outline: none}

 #search:hover, #search:active {text-decoration: none; color:#fff;}


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
.notice-list .notice-item .thumb {float:left; width:150px; height:150px; margin:6px 30px 5px 0}
.notice-list .notice-item .title {font-weight:bold;font-size:1.375em; color:black;}
.notice-list .notice-item .writer {margin-top:4px; color:black; vertical-align:top; font:normal 0.875em 'NanumBarunGothic','Noto Sans', sans-serif; line-height:1.5em;}
.notice-list .info {margin-top:6px; font-size:0.875em; color:black;}

.notice-list .info .pipe {display:inline-block; margin:0 10px; color:black}
.notice-list .info .date {color:black}

.paging{text-align: center;margin-top: 30px;}

.page{border: 1px solid black; background: black;
         color: white; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;}
.pre_page, .next_page{border: 1px solid rgb(244, 244, 244); background: rgb(244, 244, 244);
         color: #3e3e3e; padding: 3px 10px 3px 10px; border-radius: 6px;font-weight: bold;    display: inline-block;}
        
* {padding: 0; margin: 0;}
/* body {background: #1a237e;} */
.box-wrap {
/* margin-bottom: 20px; */
margin-top: 30px;
margin-left: 70px;
   box-shadow: 8px 8px 13px 5px rgba(0,0,0,0.3);
  width: 95%;
    height: 150px;
    /* display: flex; */
    justify-content: center;
    align-items: center
}

}
 .effect-wrap {
    width: 200vw; height: 50vh;
    display: flex;
    justify-content: center;
    align-items: center;
} 
.effect6 {
    position: relative;
    width: 1300px; height: 190px;;
    background: #fff;
    overflow: hidden;
   /*  border: 7px solid #111;  */
   
 }
.effect6 img {
    width: 100%;
   filter: saturate(10%); 
    transition: all 0.3s ease;
}
.effect6 figcaption {
    position: absolute;
    top: 0; right:0; bottom: 0; left: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    z-index: 1;
    text-align: center;
    line-height: 1.7em;
    color: #fff;
    text-transform: uppercase;
    font-size: 20px;
    opacity:0;
    transition: all 0.3s ease;
    transform: translatex(75%) rotate(180deg);
}

.effect6 figcaption:before {
    content:'';
    width: 150px; height: 150px;
    background: #000; 
    border-radius: 50%; 
    position: absolute;
    left: 50%; top: 50%;
    transform: translate(-50%, -50%);
    z-index: -1;
}
.effect6 figcaption h3 {
    font-size: 1.3em;
    font-weight: 100;
}
.effect6 figcaption em {
    display: block;
    font-weight: bold;
    letter-spacing: 1px;
    font-weight: 700;
}

.effect6:hover img {
    opacity: 0.1;
}
.effect6:hover figcaption {
    transform: translatex(0px) rotate(0deg);
    opacity: 1;
}

.search{
margin-left: 1150px;
}    
.noticewrite{
margin-left:1000px;
}     
.NoticeSearchBox{
border-bottom: 3px solid black;
width: 50.3%;

} 
.adminwrite{
margin-top: -35.5px;
margin-left: 690px;
}
.radiofont{
font-size: 16px;
width: 50%;
border-left: 2px black solid;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script type="text/javascript">
  
   </script>
<body>
<%-- <c:import url="../search.jsp" /> --%>

      <!-- 검색창시작 -->
   <div align="center">
         <div class="NoticeSearchBox" style="height: 130px;">
         <form action="selectNoticeSearchList.do" method="post">
    <a class="ui large black label" >제목</a>&ensp;
               <div class="ui input"><input type="text" name="search" style="width:340px; height:30px;"></div>&ensp;
          <br><br>
            <a class="ui large black label">분류</a>&emsp;&emsp;
           <input type="radio" name="searchtype" value="all" checked><label>전체</label>&emsp;&emsp; 
             <input type="radio" name="searchtype" value="일반"><label>&ensp;일반</label>&emsp;&emsp;
               <input type="radio" name="searchtype" value="전시"><label>&ensp;전시</label>&emsp;&emsp; 
               <input type="radio" name="searchtype" value="회원"><label>&ensp;회원</label>&emsp;&emsp;&emsp;
               <div class="ui buttons"><button class="ui middle black button" type="submit">검색</button></div> 
            
         </form>
<!-- 탭메뉴 -->

          </div>
                   <c:if test= "${loginUser.usertype ne 'USER'}"> 
               <div class="adminwrite"><button class="ui middle black button" onclick="location.href='insertNotice.do'">
      <i class="edit outline icon"></i>공지사항 작성</button> </div> </c:if>
          <c:if test= "${loginUser.usertype eq 'USER'}"> 
               <div class="adminwrite"><button class="ui middle black button">
      <i class="edit outline icon"></i>공지사항</button> </div> </c:if>
          
      </div>  
      <!-- 검색창 끝 -->

      
<c:forEach var="notice" items="${requestScope.list }"> 
<c:url var="ndt" value="noticeprenext.do">
   <c:param name="noticeno" value="${notice.noticeno}" />
                           
                           </c:url>   
   <div class="effect-wrap">
    <figure class="effect6">
          <div class="box-wrap">
    <div class="box">
       <div class="notice-list">
            <a href="${ ndt } " class="notice-item">
                <h1 class="title">${notice.noticetitle}</h1>
                <div class="writer">${notice.adminid}</div>
            </a>
            <p class="info"> 분류[${notice.noticetype}]
                <span class="pipe">|</span>
                <span class="date"><fmt:formatDate value="${notice.noticedate}" type="date"/></span>
            </p>
        </div>
        </div>
      </div>   
        <figcaption>
          
           <h3><a href="${ ndt } " class="notice-item">공지사항<em>더보기</em></a></h3>
         
        </figcaption>
    </figure>
      </div>               
 </c:forEach>
  
<div class="paging">
<!-- 맨 처음 페이지 -->
<c:if test="${requestScope.currentPage le 1 }"><p class="pre_page"><<</p></c:if>
<c:if test="${requestScope.currentPage gt 1 }"><a href="selectNoticeList.do"><p class="pre_page"><<</p></a></c:if>

<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
   <c:if test="${p eq requestScope.currentPage }">      
      <font><b class="page">${ p }</b></font>
   </c:if>
   <c:if test="${p ne requestScope.currentPage }"><a href="selectNoticeList.do?page=${ p }"><p class="pre_page" style="margin:0px 2px 0px 2px">${ p }</p></a></c:if>
</c:forEach>

<!-- 맨 마지막페이지 -->
<c:if test="${currentPage ge maxPage }"><p class="next_page">>></p></c:if>
<c:if test="${currentPage lt maxPage }"><a class="next_page" href="selectNoticeList.do?page=${ requestScope.maxPage }">>></a></c:if>  

</div>
<!-- //페이징 -->


<c:import url="../footer.jsp" />
</body>
</html>